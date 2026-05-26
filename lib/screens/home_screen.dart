import 'package:flutter/material.dart';
import 'language_screen.dart';
import 'how_to_use_screen.dart';
import 'profile_screen.dart';
import 'level_lesson_screen.dart';
import '../user_data_manager.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  HomeScreen({this.userName = 'User'});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int userLevel = 1;
  int totalPoints = 0;
  int streak = 0;
  int completedTopics = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRealUserData();
  }

  Future<void> loadRealUserData() async {
    userLevel = await UserDataManager.getUserLevel();
    totalPoints = await UserDataManager.getTotalPoints();
    streak = await UserDataManager.getStreak();
    completedTopics = await UserDataManager.getCompletedTopicsCount();
    
    // Update streak and check achievements on app open
    await UserDataManager.updateStreak();
    await UserDataManager.checkAndUnlockAchievements();
    
    setState(() {
      isLoading = false;
    });
  }

  Widget buildHomePage() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF5DEB3).withOpacity(0.3), Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Learning Path",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: userLevel / 36,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
              minHeight: 8,
            ),
            SizedBox(height: 5),
            Text(
              "Level $userLevel of 36",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 20),
            ..._buildLevels(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLevels() {
    final levels = [
      // Beginner Levels (1-12)
      {"level": 1, "title": "🚀 Hello World", "concept": "Your First Code Adventure!", "color": Color(0xFF58CC02), "emoji": "🐸", "description": "Say hello to programming!"},
      {"level": 2, "title": "📦 Variables", "concept": "Store Your Digital Treasures", "color": Color(0xFF58CC02), "emoji": "🐸", "description": "Learn to save data like a pro!"},
      {"level": 3, "title": "🎯 Data Types", "concept": "Numbers, Text & More Magic", "color": Color(0xFF58CC02), "emoji": "🐸", "description": "Discover different data powers!"},
      {"level": 4, "title": "💬 Input/Output", "concept": "Talk to Your Programs", "color": Color(0xFF1CB0F6), "emoji": "🐸", "description": "Make interactive experiences!"},
      {"level": 5, "title": "⚡ Operators", "concept": "Math Superpowers Unlocked", "color": Color(0xFF1CB0F6), "emoji": "🐸", "description": "Calculate like a wizard!"},
      {"level": 6, "title": "🤔 Conditions", "concept": "Smart Decision Making", "color": Color(0xFF1CB0F6), "emoji": "🐸", "description": "Teach programs to think!"},
      {"level": 7, "title": "🔄 Loops Intro", "concept": "Repeat Like a Champion", "color": Color(0xFFFF9600), "emoji": "🐸", "description": "Master the art of repetition!"},
      {"level": 8, "title": "⏰ While Loop", "concept": "Keep Going Until Perfect", "color": Color(0xFFFF9600), "emoji": "🐸", "description": "Run code until conditions met!"},
      {"level": 9, "title": "📋 Lists/Arrays", "concept": "Organize Multiple Items", "color": Color(0xFFFF9600), "emoji": "🐸", "description": "Store collections like a boss!"},
      {"level": 10, "title": "🛠️ Functions", "concept": "Build Reusable Code Blocks", "color": Color(0xFFCE82FF), "emoji": "🐸", "description": "Create your own tools!"},
      {"level": 11, "title": "✨ String Methods", "concept": "Text Manipulation Mastery", "color": Color(0xFFFF4B4B), "emoji": "🐸", "description": "Transform text like magic!"},
      {"level": 12, "title": "🏆 Beginner Complete", "concept": "Ready for Next Level!", "color": Color(0xFFFFD700), "emoji": "🐸", "description": "You mastered basics!"},
      
      // Intermediate Levels (13-24)
      {"level": 13, "title": "🔧 Advanced Functions", "concept": "Parameters & Return Values", "color": Color(0xFF9C27B0), "emoji": "🐸", "description": "Master function power!"},
      {"level": 14, "title": "📚 Classes & Objects", "concept": "Object-Oriented Programming", "color": Color(0xFF9C27B0), "emoji": "🐸", "description": "Create your own data types!"},
      {"level": 15, "title": "🔄 Nested Loops", "concept": "Loops Inside Loops", "color": Color(0xFF9C27B0), "emoji": "🐸", "description": "Double the loop power!"},
      {"level": 16, "title": "📊 2D Arrays", "concept": "Tables & Matrices", "color": Color(0xFF673AB7), "emoji": "🐸", "description": "Work with grid data!"},
      {"level": 17, "title": "🎯 Exception Handling", "concept": "Handle Errors Gracefully", "color": Color(0xFF673AB7), "emoji": "🐸", "description": "Catch and fix errors!"},
      {"level": 18, "title": "📁 File Operations", "concept": "Read & Write Files", "color": Color(0xFF673AB7), "emoji": "🐸", "description": "Save data to files!"},
      {"level": 19, "title": "🔍 Searching Algorithms", "concept": "Find Data Efficiently", "color": Color(0xFF3F51B5), "emoji": "🐸", "description": "Search like a pro!"},
      {"level": 20, "title": "📈 Sorting Algorithms", "concept": "Organize Data Perfectly", "color": Color(0xFF3F51B5), "emoji": "🐸", "description": "Sort data efficiently!"},
      {"level": 21, "title": "🌐 Web Basics", "concept": "HTML, CSS & JavaScript", "color": Color(0xFF3F51B5), "emoji": "🐸", "description": "Build web pages!"},
      {"level": 22, "title": "🗄️ Database Basics", "concept": "Store & Retrieve Data", "color": Color(0xFF2196F3), "emoji": "🐸", "description": "Manage big data!"},
      {"level": 23, "title": "🔗 APIs & JSON", "concept": "Connect to Web Services", "color": Color(0xFF2196F3), "emoji": "🐸", "description": "Talk to other apps!"},
      {"level": 24, "title": "🎮 Intermediate Complete", "concept": "Ready for Advanced!", "color": Color(0xFF2196F3), "emoji": "🐸", "description": "You're getting pro!"},
      
      // Hard Levels (25-36)
      {"level": 25, "title": "🧠 Data Structures", "concept": "Stacks, Queues & Trees", "color": Color(0xFFE91E63), "emoji": "🐸", "description": "Advanced data organization!"},
      {"level": 26, "title": "⚡ Dynamic Programming", "concept": "Optimize Complex Problems", "color": Color(0xFFE91E63), "emoji": "🐸", "description": "Solve hard puzzles!"},
      {"level": 27, "title": "🔄 Recursion Mastery", "concept": "Functions Calling Themselves", "color": Color(0xFFE91E63), "emoji": "🐸", "description": "Master recursive thinking!"},
      {"level": 28, "title": "🌳 Graph Algorithms", "concept": "Networks & Connections", "color": Color(0xFFF44336), "emoji": "🐸", "description": "Navigate complex networks!"},
      {"level": 29, "title": "🔐 Cryptography", "concept": "Secure Data & Encryption", "color": Color(0xFFF44336), "emoji": "🐸", "description": "Protect sensitive data!"},
      {"level": 30, "title": "🤖 Machine Learning", "concept": "AI & Pattern Recognition", "color": Color(0xFFF44336), "emoji": "🐸", "description": "Teach computers to learn!"},
      {"level": 31, "title": "🏗️ System Design", "concept": "Build Scalable Systems", "color": Color(0xFF795548), "emoji": "🐸", "description": "Design big applications!"},
      {"level": 32, "title": "⚙️ Multithreading", "concept": "Parallel Processing", "color": Color(0xFF795548), "emoji": "🐸", "description": "Do multiple tasks at once!"},
      {"level": 33, "title": "🔧 Compiler Design", "concept": "Build Programming Languages", "color": Color(0xFF795548), "emoji": "🐸", "description": "Create your own language!"},
      {"level": 34, "title": "🌐 Distributed Systems", "concept": "Multiple Computers Working", "color": Color(0xFF607D8B), "emoji": "🐸", "description": "Connect many computers!"},
      {"level": 35, "title": "🛡️ Cybersecurity", "concept": "Protect Against Attacks", "color": Color(0xFF607D8B), "emoji": "🐸", "description": "Defend digital systems!"},
      {"level": 36, "title": "🚀 Master Complete", "concept": "Programming Expert!", "color": Color(0xFF607D8B), "emoji": "🐸", "description": "You are now a master!"},
    ];

    return List.generate(levels.length, (index) {
      final level = levels[index];
      final levelNum = level["level"] as int;
      final levelTitle = level["title"] as String;
      final levelConcept = level["concept"] as String;
      final levelColor = level["color"] as Color;
      final levelEmoji = level["emoji"] as String;
      final levelDescription = level["description"] as String;
      final isUnlocked = levelNum <= userLevel;
      final isCompleted = levelNum < userLevel;
      final isCurrent = levelNum == userLevel;
      final isLeft = index % 2 == 0;

      return Padding(
        padding: EdgeInsets.only(
          left: isLeft ? 20 : 120,
          right: isLeft ? 120 : 20,
          bottom: 40,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: isUnlocked
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelLessonScreen(
                            language: "Mixed",
                            level: levelNum,
                            title: levelTitle,
                            concept: levelConcept,
                          ),
                        ),
                      ).then((_) {
                        setState(() {
                          isLoading = true;
                        });
                        loadRealUserData();
                      });
                    }
                  : null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Glow effect for current level
                  if (isCurrent)
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: levelColor.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  // Main circle
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isUnlocked
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                levelColor,
                                levelColor.withOpacity(0.7),
                              ],
                            )
                          : LinearGradient(
                              colors: [Colors.grey[400]!, Colors.grey[600]!],
                            ),
                      border: Border.all(
                        color: isCurrent ? Colors.white : Colors.transparent,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: isCompleted
                          ? Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    levelEmoji,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    "DONE",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : isCurrent
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        levelEmoji,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        "$levelNum",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : isUnlocked
                                  ? Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            levelEmoji,
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Text(
                                            "$levelNum",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.lock, color: Colors.white, size: 30),
                                          Text(
                                            "$levelNum",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                    ),
                  ),
                  // Sparkle effect for completed levels
                  if (isCompleted)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.star, color: Colors.white, size: 12),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // Enhanced info card
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey[50]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: isUnlocked ? levelColor.withOpacity(0.3) : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    levelTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? levelColor : Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    levelConcept,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (isUnlocked) ...[
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: levelColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        levelDescription,
                        style: TextStyle(
                          fontSize: 10,
                          color: levelColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Animated connecting line
            if (index < levels.length - 1)
              Container(
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 4,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: isCompleted
                              ? [levelColor, levels[index + 1]["color"] as Color]
                              : [Colors.grey[300]!, Colors.grey[300]!],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    if (isCompleted)
                      Positioned(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: levelColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final actualPages = [
      buildHomePage(),
      LanguageScreen(),
      HowToUseScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Smart Coder",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFFF8C42),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              loadRealUserData();
            },
          ),
        ],
      ),
      body: actualPages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFF8C42),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: "Languages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: "How To Use",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
