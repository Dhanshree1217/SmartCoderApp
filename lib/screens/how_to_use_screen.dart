import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.help_outline, size: 80, color: Color(0xFF2196F3)),
                    SizedBox(height: 10),
                    Text(
                      "How to Use This App",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Learn coding step by step",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildStepCard(
                "Step 1: Choose Language",
                "Select your favorite programming language like Python, Java, C, or HTML",
                Icons.code,
                Color(0xFF2196F3),
              ),
              SizedBox(height: 16),
              _buildStepCard(
                "Step 2: Select Level",
                "Pick Beginner, Intermediate, or Advanced level based on your skills",
                Icons.stairs,
                Color(0xFF4CAF50),
              ),
              SizedBox(height: 16),
              _buildStepCard(
                "Step 3: Choose Mode",
                "Learn topics, play quiz, or practice coding - it's your choice!",
                Icons.school,
                Color(0xFFFF9800),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.amber, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Sample Examples",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildExample(
                      "Beginner Level",
                      "Question: Print 'Hello World'",
                      "Answer: print('Hello World')",
                    ),
                    Divider(color: Colors.white30, height: 30),
                    _buildExample(
                      "Intermediate Level",
                      "Question: Create a variable 'age' = 25",
                      "Answer: age = 25",
                    ),
                    Divider(color: Colors.white30, height: 30),
                    _buildExample(
                      "Advanced Level",
                      "Question: Write a simple loop",
                      "Answer: for i in range(5): print(i)",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFF4CAF50), width: 2),
                ),
                child: Column(
                  children: [
                    Icon(Icons.emoji_events, size: 50, color: Colors.amber),
                    SizedBox(height: 10),
                    Text(
                      "Tips for Success",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildTip("📚 Start with Learning Topics first"),
                    _buildTip("🎮 Play Quiz to test your knowledge"),
                    _buildTip("💻 Practice Coding to master syntax"),
                    _buildTip("🔥 Practice daily for best results"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(
      String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String level, String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        SizedBox(height: 8),
        Text(
          question,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            answer,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}