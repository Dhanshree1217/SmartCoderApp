import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  static const String KEY_USER_NAME = 'userName';
  static const String KEY_USER_EMAIL = 'userEmail';
  static const String KEY_USER_PHOTO = 'userPhoto';
  static const String KEY_TOTAL_POINTS = 'totalPoints';
  static const String KEY_USER_LEVEL = 'userLevel';
  static const String KEY_STREAK = 'streak';
  static const String KEY_COMPLETED_TOPICS = 'completedTopics';
  static const String KEY_PRACTICE_COMPLETED = 'practiceCompleted';

  static Future<void> saveUserProfile({required String name, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_NAME, name);
    await prefs.setString(KEY_USER_EMAIL, email);
    await prefs.setString('email', email);
    await prefs.setBool('isLoggedIn', true);
  }

  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_NAME, name);
  }

  static Future<void> saveUserPhoto(String photoPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_PHOTO, photoPath);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_USER_NAME) ?? 'User';
  }

  static Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_USER_EMAIL) ?? '';
  }

  static Future<String?> getUserPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_USER_PHOTO);
  }

  static Future<int> getTotalPoints() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(KEY_TOTAL_POINTS) ?? 0;
  }

  static Future<int> getUserLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(KEY_USER_LEVEL) ?? 1;
  }

  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(KEY_STREAK) ?? 0;
  }

  static Future<int> getCompletedTopicsCount() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(KEY_COMPLETED_TOPICS) ?? []).length;
  }

  static Future<int> getUserRank() async {
    int points = await getTotalPoints();
    if (points >= 500) return 1;
    if (points >= 300) return 2;
    if (points >= 200) return 3;
    if (points >= 100) return 5;
    if (points >= 50) return 10;
    return 20;
  }

  static Future<Map<String, double>> getLanguageProgress() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_COMPLETED_TOPICS) ?? [];

    Map<String, List<String>> languageTopics = {
      'Python': ['Python_level_1', 'Python_level_2', 'Python_level_3', 'Python_level_4', 'Python_level_5'],
      'Java': ['Java_level_1', 'Java_level_2', 'Java_level_3', 'Java_level_4', 'Java_level_5'],
      'C Language': ['C Language_level_1', 'C Language_level_2', 'C Language_level_3', 'C Language_level_4', 'C Language_level_5'],
      'HTML & CSS': ['HTML/CSS_level_1', 'HTML/CSS_level_2', 'HTML/CSS_level_3', 'HTML/CSS_level_4', 'HTML/CSS_level_5'],
    };

    Map<String, double> progress = {};
    languageTopics.forEach((lang, topics) {
      int done = topics.where((t) => completed.contains(t)).length;
      progress[lang] = done / topics.length;
    });
    return progress;
  }

  static Future<void> addPoints(int points) async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(KEY_TOTAL_POINTS) ?? 0;
    int newPoints = current + points;
    await prefs.setInt(KEY_TOTAL_POINTS, newPoints);
    await prefs.setInt(KEY_USER_LEVEL, (newPoints ~/ 100) + 1);
  }

  static Future<void> markTopicCompleted(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_COMPLETED_TOPICS) ?? [];
    if (!completed.contains(topic)) {
      completed.add(topic);
      await prefs.setStringList(KEY_COMPLETED_TOPICS, completed);
      await addPoints(10);
    }
  }

  static Future<void> saveQuizScore(String topic, int score, int total) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quiz_$topic', '$score/$total');
    await addPoints(score * 5);
  }

  static Future<void> markPracticeCompleted(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_PRACTICE_COMPLETED) ?? [];
    if (!completed.contains(topic)) {
      completed.add(topic);
      await prefs.setStringList(KEY_PRACTICE_COMPLETED, completed);
      await addPoints(15);
    }
  }

  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
