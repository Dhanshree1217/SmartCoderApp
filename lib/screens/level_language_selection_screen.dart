import 'package:flutter/material.dart';
import 'level_lesson_screen.dart';

class LevelLanguageSelectionScreen extends StatelessWidget {
  final int level;
  final String title;
  final String concept;

  LevelLanguageSelectionScreen({
    required this.level,
    required this.title,
    required this.concept,
  });

  final List<Map<String, dynamic>> languages = [
    {
      "name": "Python",
      "emoji": "🐍",
      "color": Color(0xFF3776AB),
      "description": "Easy & Fun!",
    },
    {
      "name": "Java",
      "emoji": "☕",
      "color": Color(0xFFF89820),
      "description": "Popular & Powerful",
    },
    {
      "name": "C Language",
      "emoji": "C",
      "color": Color(0xFF00599C),
      "description": "Fast & Classic",
    },
    {
      "name": "HTML/CSS",
      "emoji": "🌐",
      "color": Color(0xFFE34F26),
      "description": "Build Websites",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4513),
        title: Text("Choose Your Language"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
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
                  Text(
                    "Level $level",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD2691E),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    concept,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Select a programming language:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelLessonScreen(
                            language: lang["name"],
                            level: level,
                            title: title,
                            concept: concept,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            lang["color"],
                            lang["color"].withOpacity(0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lang["emoji"],
                            style: TextStyle(fontSize: 60),
                          ),
                          SizedBox(height: 10),
                          Text(
                            lang["name"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            lang["description"],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
