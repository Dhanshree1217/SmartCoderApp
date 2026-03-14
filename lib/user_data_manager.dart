import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  static const String KEY_USER_NAME = 'userName';
  static const String KEY_USER_EMAIL = 'userEmail';
  static const String KEY_USER_PHOTO = 'userPhoto';
  static const String KEY_TOTAL_POINTS = 'totalPoints';
  static const String KEY_USER_LEVEL = 'userLevel';
  static const String KEY_STREAK = 'streak';
  static const String KEY_COMPLETED_TOPICS = 'completedTopics';
  static const String KEY_QUIZ_SCORES = 'quizScores';
  static const String KEY_PRACTICE_COMPLETED = 'practiceCompleted';

  // Save user data
  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_NAME, name);
  }

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_EMAIL, email);
  }

  static Future<void> saveUserPhoto(String photoPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_PHOTO, photoPath);
  }

  static Future<void> saveTotalPoints(int points) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_TOTAL_POINTS, points);
  }

  static Future<void> saveUserLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_USER_LEVEL, level);
  }

  static Future<void> saveStreak(int streak) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_STREAK, streak);
  }

  // Get user data
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

  // Add points (when user completes quiz/practice)
  static Future<void> addPoints(int points) async {
    int currentPoints = await getTotalPoints();
    int newPoints = currentPoints + points;
    await saveTotalPoints(newPoints);
    
    // Level up logic
    int newLevel = (newPoints ~/ 100) + 1;
    await saveUserLevel(newLevel);
  }

  // Mark topic as completed
  static Future<void> markTopicCompleted(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_COMPLETED_TOPICS) ?? [];
    if (!completed.contains(topic)) {
      completed.add(topic);
      await prefs.setStringList(KEY_COMPLETED_TOPICS, completed);
      await addPoints(10); // 10 points for completing a topic
    }
  }

  // Save quiz score
  static Future<void> saveQuizScore(String topic, int score, int total) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quiz_$topic', '$score/$total');
    
    // Add points based on score
    int points = (score * 5); // 5 points per correct answer
    await addPoints(points);
  }

  // Mark practice as completed
  static Future<void> markPracticeCompleted(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_PRACTICE_COMPLETED) ?? [];
    if (!completed.contains(topic)) {
      completed.add(topic);
      await prefs.setStringList(KEY_PRACTICE_COMPLETED, completed);
      await addPoints(15); // 15 points for completing practice
    }
  }

  // Get completed topics count
  static Future<int> getCompletedTopicsCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList(KEY_COMPLETED_TOPICS) ?? [];
    return completed.length;
  }

  // Clear all data (logout)
  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
