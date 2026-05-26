import 'package:flutter/material.dart';
import '../user_data_manager.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int todayPoints = 0;
  List<int> weeklyProgress = [];
  List<String> achievements = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  Future<void> loadStats() async {
    todayPoints = await UserDataManager.getTodayPoints();
    weeklyProgress = await UserDataManager.getWeeklyProgress();
    achievements = await UserDataManager.getUnlockedAchievements();
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Statistics'),
          backgroundColor: Color(0xFF2196F3),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Progress Stats'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Progress
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.today, size: 50, color: Colors.white),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today\'s Progress',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          '$todayPoints Points Earned',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Weekly Progress Chart
            Text(
              'Weekly Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(7, (index) {
                        final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        final points = weeklyProgress.isNotEmpty && index < weeklyProgress.length 
                            ? weeklyProgress[index] 
                            : 0;
                        final maxPoints = weeklyProgress.isNotEmpty 
                            ? weeklyProgress.reduce((a, b) => a > b ? a : b) 
                            : 1;
                        final height = maxPoints > 0 ? (points / maxPoints * 120).clamp(10.0, 120.0) : 10.0;
                        
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 30,
                              height: height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              days[index],
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                            Text(
                              '$points',
                              style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Achievement Summary
            Text(
              'Achievements Unlocked',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.emoji_events, size: 40, color: Colors.amber),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${achievements.length} Achievements',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[800],
                              ),
                            ),
                            Text(
                              'Keep learning to unlock more!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.amber[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (achievements.isNotEmpty) ...[
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: achievements.map((achievement) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _getAchievementName(achievement),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 30),

            // Learning Tips
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, size: 30, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Learning Tips',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  _buildTip('🎯', 'Set daily goals and stick to them'),
                  _buildTip('🔥', 'Maintain your streak for better retention'),
                  _buildTip('📚', 'Practice coding every day, even for 10 minutes'),
                  _buildTip('🤝', 'Join coding communities and share knowledge'),
                  _buildTip('🚀', 'Build projects to apply what you learn'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTip(String emoji, String tip) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getAchievementName(String achievement) {
    switch (achievement) {
      case 'first_100_points':
        return '💯 First 100 Points';
      case 'week_streak':
        return '🔥 Week Streak';
      case 'topic_master':
        return '📚 Topic Master';
      case 'expert_level':
        return '🏆 Expert Level';
      default:
        return '🎖️ Achievement';
    }
  }
}