import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthDatabase {
  static const String _usersKey = 'sc_users_v2';
  static const String _currentUserKey = 'sc_current_user_v2';

  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    String method = 'email',
  }) async {
    try {
      final String cleanEmail = email.trim().toLowerCase();
      final String cleanPassword = password.trim();
      final String cleanName = name.trim();

      if (cleanEmail.isEmpty || cleanPassword.isEmpty || cleanName.isEmpty) return false;
      if (!cleanEmail.contains('@') || !cleanEmail.contains('.')) return false;

      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> users = await _getAllUsers(prefs);

      // Check duplicate
      if (users.any((u) => u['email'] == cleanEmail)) return false;

      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': cleanName,
        'email': cleanEmail,
        'password': cleanPassword,
        'method': method,
        'createdAt': DateTime.now().toIso8601String(),
        'lastLogin': DateTime.now().toIso8601String(),
      };

      users.add(newUser);

      // Save and immediately verify
      await prefs.setString(_usersKey, json.encode(users));
      await prefs.reload();
      final verify = prefs.getString(_usersKey);
      if (verify == null) return false;

      await _setCurrentUser(prefs, newUser);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final String cleanEmail = email.trim().toLowerCase();
      final String cleanPassword = password.trim();

      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final List<Map<String, dynamic>> users = await _getAllUsers(prefs);

      for (var u in users) {
        if (u['email'].toString() == cleanEmail &&
            u['password'].toString() == cleanPassword) {
          u['lastLogin'] = DateTime.now().toIso8601String();
          final idx = users.indexWhere((x) => x['id'] == u['id']);
          if (idx != -1) users[idx] = u;
          await prefs.setString(_usersKey, json.encode(users));
          await _setCurrentUser(prefs, u);
          return u;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> _getAllUsers(SharedPreferences prefs) async {
    try {
      final String? data = prefs.getString(_usersKey);
      if (data == null || data.isEmpty) return [];
      final List<dynamic> list = json.decode(data);
      return list.map((u) => Map<String, dynamic>.from(u)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> _setCurrentUser(SharedPreferences prefs, Map<String, dynamic> user) async {
    await prefs.setString(_currentUserKey, json.encode(user));
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userName', user['name']);
    await prefs.setString('userEmail', user['email']);
  }

  static Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final String? data = prefs.getString(_currentUserKey);
      if (data == null) return null;
      return Map<String, dynamic>.from(json.decode(data));
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
    await prefs.setBool('isLoggedIn', false);
  }

  static Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    return user != null;
  }

  static Future<List<String>> getLoginSuggestions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final users = await _getAllUsers(prefs);
      users.sort((a, b) =>
          DateTime.parse(b['lastLogin']).compareTo(DateTime.parse(a['lastLogin'])));
      return users.take(5).map((u) => u['email'].toString()).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usersKey);
    await prefs.remove(_currentUserKey);
    await prefs.setBool('isLoggedIn', false);
  }
}
