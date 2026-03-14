import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  final String language;
  final String level;

  PracticeScreen({required this.language, this.level = "Beginner Level"});

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final topics = [
    {"name": "Variables", "icon": Icons.storage},
    {"name": "Data Types", "icon": Icons.category},
    {"name": "Loops", "icon": Icons.loop},
    {"name": "Arrays", "icon": Icons.view_list},
    {"name": "Functions", "icon": Icons.functions},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice Coding"),
        backgroundColor: Color(0xFF4CAF50),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[50]!, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.code, size: 60, color: Color(0xFF4CAF50)),
                  SizedBox(height: 10),
                  Text(
                    "Select a Topic to Practice",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFF4CAF50).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          topics[index]["icon"] as IconData,
                          color: Color(0xFF4CAF50),
                          size: 30,
                        ),
                      ),
                      title: Text(
                        topics[index]["name"] as String,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.edit, color: Color(0xFF4CAF50)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PracticeCodingScreen(
                              topic: topics[index]["name"] as String,
                              language: widget.language,
                            ),
                          ),
                        );
                      },
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

class PracticeCodingScreen extends StatefulWidget {
  final String topic;
  final String language;

  PracticeCodingScreen({required this.topic, required this.language});

  @override
  _PracticeCodingScreenState createState() => _PracticeCodingScreenState();
}

class _PracticeCodingScreenState extends State<PracticeCodingScreen> {
  final controller = TextEditingController();
  bool showResult = false;
  bool isCorrect = false;

  final Map<String, Map<String, String>> practiceData = {
    "Variables": {
      "question": "Create a variable called 'name' and set it to 'John'",
      "syntax": "name = 'John'",
      "hint": "Use: variable_name = value",
    },
    "Data Types": {
      "question": "Create a number variable 'age' with value 25",
      "syntax": "age = 25",
      "hint": "Use: variable_name = number",
    },
    "Loops": {
      "question": "Write a loop to print 'Hello' 3 times",
      "syntax": "for i in range(3):\n    print('Hello')",
      "hint": "Use: for i in range(n):",
    },
    "Arrays": {
      "question": "Create a list called 'fruits' with apple, banana",
      "syntax": "fruits = ['apple', 'banana']",
      "hint": "Use: list_name = [item1, item2]",
    },
    "Functions": {
      "question": "Create a function called 'greet' that prints 'Hello'",
      "syntax": "def greet():\n    print('Hello')",
      "hint": "Use: def function_name():",
    },
  };

  void checkAnswer() {
    final data = practiceData[widget.topic]!;
    final userAnswer = controller.text.trim().replaceAll(' ', '');
    final correctAnswer = data["syntax"]!.trim().replaceAll(' ', '');

    setState(() {
      showResult = true;
      isCorrect = userAnswer.toLowerCase() == correctAnswer.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = practiceData[widget.topic]!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Practice: ${widget.topic}"),
        backgroundColor: Color(0xFF4CAF50),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Task",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    data["question"]!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.amber[700]),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Hint: ${data["hint"]}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Write your code here:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: controller,
                maxLines: 5,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Type your code here...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.play_arrow),
                    label: Text("Run", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFC107),
                      foregroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: checkAnswer,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text("Submit", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: checkAnswer,
                  ),
                ),
              ],
            ),
            if (showResult)
              SizedBox(height: 20),
            if (showResult)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isCorrect ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      size: 50,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(
                      isCorrect ? "Correct! Well Done!" : "Try Again!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    if (!isCorrect)
                      SizedBox(height: 10),
                    if (!isCorrect)
                      Text(
                        "Expected: ${data["syntax"]}",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
