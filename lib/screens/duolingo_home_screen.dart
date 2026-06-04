import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'level_language_selection_screen.dart';

class DuolingoHomeScreen extends StatefulWidget {
  final String language;

  DuolingoHomeScreen({required this.language});

  @override
  _DuolingoHomeScreenState createState() => _DuolingoHomeScreenState();
}

class _DuolingoHomeScreenState extends State<DuolingoHomeScreen> {
  int currentLevel = 1;
  int totalPoints = 0;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLevel = prefs.getInt('currentLevel_${widget.language}') ?? 1;
      totalPoints = prefs.getInt('totalPoints') ?? 0;
    });
  }

  final List<Map<String, dynamic>> levels = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4513),
        elevation: 0,
        title: Row(
          children: [
            Text(widget.language, style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.local_fire_department, color: Colors.orange),
            Text("0", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 15),
            Icon(Icons.star, color: Colors.amber),
            Text("$totalPoints", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF8B4513),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Learn ${widget.language}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: currentLevel / 12,
                    backgroundColor: Colors.white30,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    minHeight: 8,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Level $currentLevel of 12",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...List.generate(levels.length, (index) {
              final level = levels[index];
              final isUnlocked = level["level"] <= currentLevel;
              final isCompleted = level["level"] < currentLevel;
              final isCurrent = level["level"] == currentLevel;
              
              // Zigzag pattern
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
                              if (level["level"] == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LevelLanguageSelectionScreen(
                                      level: level["level"],
                                      title: level["title"],
                                      concept: level["concept"],
                                    ),
                                  ),
                                ).then((_) => loadProgress());
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LevelLanguageSelectionScreen(
                                      level: level["level"],
                                      title: level["title"],
                                      concept: level["concept"],
                                    ),
                                  ),
                                ).then((_) => loadProgress());
                              }
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
                              color: isUnlocked
                                  ? level["color"]
                                  : Colors.grey[400],
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
                                  ? Icon(Icons.check, color: Colors.white, size: 40)
                                  : Text(
                                      "${level["level"]}",
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
                            level["title"],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B4513),
                            ),
                          ),
                          Text(
                            level["concept"],
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
                          color: isCompleted ? level["color"] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              );
            }),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
