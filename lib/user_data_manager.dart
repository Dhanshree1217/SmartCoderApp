import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  // User Profile Methods
  static Future<void> saveUserProfile(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? 'User';
  }

  static Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email') ?? '';
  }

  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
  }

  static Future<void> saveUserPhoto(String photoPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_photo', photoPath);
  }

  static Future<String> getUserPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_photo') ?? '';
  }

  // Progress Methods
  static Future<int> getUserLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_level') ?? 1;
  }

  static Future<void> setUserLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_level', level);
  }

  static Future<int> getTotalPoints() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('total_points') ?? 0;
  }

  static Future<void> addPoints(int points) async {
    final prefs = await SharedPreferences.getInstance();
    int currentPoints = await getTotalPoints();
    await prefs.setInt('total_points', currentPoints + points);
    
    // Update daily activity when points are added
    await _updateDailyActivity();
  }

  // Enhanced Streak System
  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    String? lastActiveDate = prefs.getString('last_active_date');
    String today = DateTime.now().toIso8601String().split('T')[0];
    
    if (lastActiveDate == null) {
      return 0;
    }
    
    DateTime lastDate = DateTime.parse(lastActiveDate);
    DateTime todayDate = DateTime.parse(today);
    int daysDifference = todayDate.difference(lastDate).inDays;
    
    if (daysDifference > 1) {
      // Streak broken - reset to 0
      await prefs.setInt('streak', 0);
      return 0;
    }
    
    return prefs.getInt('streak') ?? 0;
  }

  static Future<void> _updateDailyActivity() async {
    final prefs = await SharedPreferences.getInstance();
    String today = DateTime.now().toIso8601String().split('T')[0];
    String? lastActiveDate = prefs.getString('last_active_date');
    
    if (lastActiveDate != today) {
      // New day - update streak
      int currentStreak = await getStreak();
      
      if (lastActiveDate == null) {
        // First time user
        await prefs.setInt('streak', 1);
      } else {
        DateTime lastDate = DateTime.parse(lastActiveDate);
        DateTime todayDate = DateTime.parse(today);
        int daysDifference = todayDate.difference(lastDate).inDays;
        
        if (daysDifference == 1) {
          // Consecutive day - increment streak
          await prefs.setInt('streak', currentStreak + 1);
        } else if (daysDifference > 1) {
          // Streak broken - start new streak
          await prefs.setInt('streak', 1);
        }
      }
      
      // Update last active date
      await prefs.setString('last_active_date', today);
      
      // Track daily points
      int todayPoints = prefs.getInt('today_points_$today') ?? 0;
      await prefs.setInt('today_points_$today', todayPoints + 10);
    }
  }

  static Future<void> updateStreak() async {
    await _updateDailyActivity();
  }

  static Future<int> getCompletedTopicsCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completedTopics = prefs.getStringList('completed_topics') ?? [];
    return completedTopics.length;
  }

  static Future<void> markTopicCompleted(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completedTopics = prefs.getStringList('completed_topics') ?? [];
    if (!completedTopics.contains(topic)) {
      completedTopics.add(topic);
      await prefs.setStringList('completed_topics', completedTopics);
      
      // Add bonus points for topic completion
      await addPoints(50);
      
      // Update language progress
      String language = topic.split('_')[0];
      await _updateLanguageProgress(language);
    }
  }

  static Future<void> _updateLanguageProgress(String language) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completedTopics = prefs.getStringList('completed_topics') ?? [];
    
    // Count completed topics for this language
    int languageTopics = completedTopics.where((topic) => topic.startsWith(language)).length;
    
    // Calculate progress percentage (assuming 10 topics per language)
    int progress = (languageTopics * 10).clamp(0, 100);
    
    await prefs.setInt('${language.toLowerCase()}_progress', progress);
  }

  // Quiz Methods
  static Future<void> saveQuizScore(String topic, int score, int totalQuestions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quiz_${topic}_score', score);
    await prefs.setInt('quiz_${topic}_total', totalQuestions);
    
    // Add points for quiz completion
    await addPoints(score * 10);
    
    // Mark topic as completed if score is good
    if (score >= (totalQuestions * 0.6)) {
      await markTopicCompleted(topic);
    }
  }

  static Future<int> getQuizScore(String topic) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('quiz_${topic}_score') ?? 0;
  }

  // User Rank and Progress
  static Future<String> getUserRank() async {
    int points = await getTotalPoints();
    if (points >= 2000) return 'Master Coder 🏆';
    if (points >= 1500) return 'Expert Programmer 💎';
    if (points >= 1000) return 'Advanced Developer 🚀';
    if (points >= 500) return 'Intermediate Coder 📈';
    if (points >= 200) return 'Learning Enthusiast 📚';
    return 'Coding Beginner 🌱';
  }

  static Future<Map<String, int>> getLanguageProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'Python': prefs.getInt('python_progress') ?? 0,
      'Java': prefs.getInt('java_progress') ?? 0,
      'C': prefs.getInt('c_progress') ?? 0,
      'HTML': prefs.getInt('html_progress') ?? 0,
    };
  }

  static Future<void> updateLanguageProgress(String language, int progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${language.toLowerCase()}_progress', progress);
  }

  // Daily Stats
  static Future<int> getTodayPoints() async {
    final prefs = await SharedPreferences.getInstance();
    String today = DateTime.now().toIso8601String().split('T')[0];
    return prefs.getInt('today_points_$today') ?? 0;
  }

  static Future<List<int>> getWeeklyProgress() async {
    final prefs = await SharedPreferences.getInstance();
    List<int> weeklyPoints = [];
    
    for (int i = 6; i >= 0; i--) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      String dateStr = date.toIso8601String().split('T')[0];
      int points = prefs.getInt('today_points_$dateStr') ?? 0;
      weeklyPoints.add(points);
    }
    
    return weeklyPoints;
  }

  // Achievement System
  static Future<List<String>> getUnlockedAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('achievements') ?? [];
  }

  static Future<void> checkAndUnlockAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> achievements = prefs.getStringList('achievements') ?? [];
    
    int points = await getTotalPoints();
    int streak = await getStreak();
    int completedTopics = await getCompletedTopicsCount();
    
    // Check various achievements
    if (points >= 100 && !achievements.contains('first_100_points')) {
      achievements.add('first_100_points');
    }
    if (streak >= 7 && !achievements.contains('week_streak')) {
      achievements.add('week_streak');
    }
    if (completedTopics >= 5 && !achievements.contains('topic_master')) {
      achievements.add('topic_master');
    }
    if (points >= 1000 && !achievements.contains('expert_level')) {
      achievements.add('expert_level');
    }
    
    await prefs.setStringList('achievements', achievements);
  }

  // Clear all data
  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}