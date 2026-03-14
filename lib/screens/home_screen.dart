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
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8C42), Color(0xFFFFB380)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 35, color: Color(0xFFFF8C42)),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back,",
                              style: TextStyle(fontSize: 14, color: Colors.white70),
                            ),
                            Text(
                              widget.userName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "$totalPoints pts",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
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
              value: userLevel / 12,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
              minHeight: 8,
            ),
            SizedBox(height: 5),
            Text(
              "Level $userLevel of 12",
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
      {"level": 1, "title": "Hello World", "concept": "Print Statements", "color": Color(0xFF58CC02)},
      {"level": 2, "title": "Variables", "concept": "Store Data", "color": Color(0xFF58CC02)},
      {"level": 3, "title": "Data Types", "concept": "Numbers & Text", "color": Color(0xFF58CC02)},
      {"level": 4, "title": "Input/Output", "concept": "User Interaction", "color": Color(0xFF1CB0F6)},
      {"level": 5, "title": "Operators", "concept": "Math Operations", "color": Color(0xFF1CB0F6)},
      {"level": 6, "title": "Conditions", "concept": "If-Else", "color": Color(0xFF1CB0F6)},
      {"level": 7, "title": "Loops Intro", "concept": "For Loop", "color": Color(0xFFFF9600)},
      {"level": 8, "title": "While Loop", "concept": "Repeat Until", "color": Color(0xFFFF9600)},
      {"level": 9, "title": "Lists/Arrays", "concept": "Store Multiple", "color": Color(0xFFFF9600)},
      {"level": 10, "title": "Functions", "concept": "Reusable Code", "color": Color(0xFFCE82FF)},
      {"level": 11, "title": "String Methods", "concept": "Text Operations", "color": Color(0xFFFF4B4B)},
      {"level": 12, "title": "Final Project", "concept": "Build Something!", "color": Color(0xFFFFD700)},
    ];

    return List.generate(levels.length, (index) {
      final level = levels[index];
      final levelNum = level["level"] as int;
      final levelTitle = level["title"] as String;
      final levelConcept = level["concept"] as String;
      final levelColor = level["color"] as Color;
      final isUnlocked = levelNum <= userLevel;
      final isCompleted = levelNum < userLevel;
      final isCurrent = levelNum == userLevel;
      final isLeft = index % 2 == 0;

      return Padding(
        padding: EdgeInsets.only(
          left: isLeft ? 40 : 200,
          right: isLeft ? 200 : 40,
          bottom: 30,
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
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isUnlocked ? levelColor : Colors.grey[400],
                      border: Border.all(
                        color: isCurrent ? Colors.white : Colors.transparent,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: isCompleted
                          ? Text(
                              "🐸",
                              style: TextStyle(fontSize: 40),
                            )
                          : isCurrent
                              ? Text(
                                  "$levelNum",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "$levelNum",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                    ),
                  ),
                  if (!isUnlocked)
                    Icon(Icons.lock, color: Colors.white, size: 30),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    levelTitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF8C42),
                    ),
                  ),
                  Text(
                    levelConcept,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (index < levels.length - 1)
              Container(
                height: 40,
                width: 4,
                decoration: BoxDecoration(
                  color: isCompleted ? levelColor : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
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
