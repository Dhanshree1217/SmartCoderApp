import 'package:flutter/material.dart';
import '../user_data_manager.dart';
import 'topic_quiz_screen.dart';

class LearningScreen extends StatelessWidget {
  final String language;
  final String level;

  LearningScreen({required this.language, this.level = "Beginner Level"});

  Map<String, List<Map<String, dynamic>>> getTopicsForLanguage(String language) {
    switch (language) {
      case 'Python':
        return {
          'topics': [
            {"name": "Variables", "icon": Icons.storage},
            {"name": "Data Types", "icon": Icons.category},
            {"name": "Loops", "icon": Icons.loop},
            {"name": "Lists", "icon": Icons.view_list},
            {"name": "Functions", "icon": Icons.functions},
          ]
        };
      case 'Java':
        return {
          'topics': [
            {"name": "Classes", "icon": Icons.class_outlined},
            {"name": "Objects", "icon": Icons.widgets},
            {"name": "Inheritance", "icon": Icons.account_tree},
            {"name": "Methods", "icon": Icons.functions},
            {"name": "Arrays", "icon": Icons.view_list},
          ]
        };
      case 'C':
        return {
          'topics': [
            {"name": "Hello World", "icon": Icons.play_arrow},
            {"name": "Variables", "icon": Icons.storage},
            {"name": "Data Types", "icon": Icons.category},
            {"name": "Input Output", "icon": Icons.keyboard},
            {"name": "Operators", "icon": Icons.calculate},
          ]
        };
      case 'HTML':
        return {
          'topics': [
            {"name": "HTML Basics", "icon": Icons.code},
            {"name": "Headings & Paragraphs", "icon": Icons.text_fields},
            {"name": "Links & Images", "icon": Icons.link},
            {"name": "Lists & Tables", "icon": Icons.list},
            {"name": "Forms", "icon": Icons.assignment},
          ]
        };
      default:
        return {
          'topics': [
            {"name": "Variables", "icon": Icons.storage},
            {"name": "Data Types", "icon": Icons.category},
            {"name": "Loops", "icon": Icons.loop},
            {"name": "Arrays", "icon": Icons.view_list},
            {"name": "Functions", "icon": Icons.functions},
          ]
        };
    }
  }

  Map<String, String> getBeginnerContent(String language) {
    switch (language) {
      case 'Python':
        return {
          "Variables": "A variable is like a box where we store values!\n\nExample in Python:\nname = 'John'\nage = 25\n\nVariables help us remember information in our programs.",
          "Data Types": "Data types tell us what kind of information we have!\n\nCommon types:\n• Numbers (like 10, 25)\n• Text (like 'Hello')\n• True/False (like yes or no)\n\nExample:\nage = 25  # Number\nname = 'Sara'  # Text",
          "Loops": "Loops help us repeat things!\n\nExample in Python:\nfor i in range(5):\n    print('Hello')\n\nThis will print 'Hello' 5 times!",
          "Lists": "Lists are like a shopping list!\n\nExample in Python:\nfruits = ['apple', 'banana', 'orange']\n\nWe can store many items in one place.",
          "Functions": "Functions are like recipes! They do a specific task.\n\nExample in Python:\ndef greet():\n    print('Hello!')\n\ngreet()  # This calls the function",
        };
      case 'Java':
        return {
          "Classes": "A class is like a blueprint for creating objects!\n\nExample in Java:\nclass Car {\n    String color;\n    int speed;\n}\n\nClasses help us organize our code.",
          "Objects": "Objects are instances of classes!\n\nExample in Java:\nCar myCar = new Car();\nmyCar.color = \"red\";\n\nObjects have properties and behaviors.",
          "Inheritance": "Inheritance lets one class use properties of another!\n\nExample in Java:\nclass Animal { }\nclass Dog extends Animal { }\n\nDog inherits from Animal.",
          "Methods": "Methods are functions inside classes!\n\nExample in Java:\npublic void drive() {\n    System.out.println(\"Driving!\");\n}\n\nMethods perform actions.",
          "Arrays": "Arrays store multiple values!\n\nExample in Java:\nint[] numbers = {1, 2, 3, 4, 5};\n\nArrays have fixed size in Java.",
        };
      case 'C':
        return {
          "Hello World": "Your first C program!\n\nExample in C:\n#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\");\n    return 0;\n}\n\nThis prints 'Hello, World!' on screen.\nEvery C program starts with main() function.",
          "Variables": "Variables store data in C!\n\nExample in C:\nint age = 25;\nchar name[] = \"John\";\nfloat price = 99.99;\n\nC needs data types for variables.\nint for numbers, char for text, float for decimals.",
          "Data Types": "C has different data types!\n\nCommon types:\n• int: 42 (whole numbers)\n• float: 3.14 (decimal numbers)\n• char: 'A' (single character)\n• char[]: \"Hello\" (text/string)\n\nExample:\nint number = 10;\nfloat price = 99.99;",
          "Input Output": "Get input and show output in C!\n\nOutput with printf:\nprintf(\"Hello World\");\nprintf(\"Number: %d\", 42);\n\nInput with scanf:\nint age;\nscanf(\"%d\", &age);\n\nprintf shows data, scanf gets data from user.",
          "Operators": "Do math and comparisons in C!\n\nMath operators:\n+ (add), - (subtract), * (multiply), / (divide)\n\nExample:\nint a = 10, b = 5;\nint sum = a + b;  // 15\nint diff = a - b; // 5\n\nComparison: ==, !=, <, >, <=, >=",
        };
      case 'HTML':
        return {
          "HTML Basics": "HTML creates web pages!\n\nBasic HTML structure:\n<!DOCTYPE html>\n<html>\n<head>\n    <title>My Page</title>\n</head>\n<body>\n    <h1>Welcome!</h1>\n</body>\n</html>\n\nHTML uses tags to structure content.",
          "Headings & Paragraphs": "Create headings and text in HTML!\n\nHeadings (big to small):\n<h1>Biggest Heading</h1>\n<h2>Medium Heading</h2>\n<h3>Small Heading</h3>\n\nParagraphs:\n<p>This is a paragraph of text.</p>\n\nHeadings organize content, paragraphs contain text.",
          "Links & Images": "Add links and pictures to your webpage!\n\nLinks:\n<a href=\"https://google.com\">Click here</a>\n\nImages:\n<img src=\"photo.jpg\" alt=\"My photo\">\n\nLinks connect pages, images show pictures.\nalt text describes the image.",
          "Lists & Tables": "Organize information with lists and tables!\n\nUnordered list:\n<ul>\n  <li>Apple</li>\n  <li>Banana</li>\n</ul>\n\nTable:\n<table>\n  <tr>\n    <td>Name</td>\n    <td>Age</td>\n  </tr>\n</table>\n\nLists show items, tables show data in rows/columns.",
          "Forms": "Collect user input with forms!\n\nBasic form:\n<form>\n  <input type=\"text\" placeholder=\"Your name\">\n  <input type=\"email\" placeholder=\"Your email\">\n  <button type=\"submit\">Send</button>\n</form>\n\nForms let users enter and submit information.",
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageTopics = getTopicsForLanguage(language)['topics']!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("$language Topics - $level"),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: languageTopics.length,
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
                  color: Color(0xFF2196F3).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  languageTopics[index]["icon"] as IconData,
                  color: Color(0xFF2196F3),
                  size: 30,
                ),
              ),
              title: Text(
                languageTopics[index]["name"] as String,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF2196F3)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(
                      topic: languageTopics[index]["name"] as String,
                      language: language,
                      level: level,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final String topic;
  final String language;
  final String level;

  TopicDetailScreen({
    required this.topic,
    required this.language,
    required this.level,
  });

  Map<String, String> getBeginnerContent(String language) {
    switch (language) {
      case 'Python':
        return {
          "Variables": "A variable is like a box where we store values!\n\nExample in Python:\nname = 'John'\nage = 25\n\nVariables help us remember information in our programs.",
          "Data Types": "Data types tell us what kind of information we have!\n\nCommon types:\n• Numbers (like 10, 25)\n• Text (like 'Hello')\n• True/False (like yes or no)\n\nExample:\nage = 25  # Number\nname = 'Sara'  # Text",
          "Loops": "Loops help us repeat things!\n\nExample in Python:\nfor i in range(5):\n    print('Hello')\n\nThis will print 'Hello' 5 times!",
          "Lists": "Lists are like a shopping list!\n\nExample in Python:\nfruits = ['apple', 'banana', 'orange']\n\nWe can store many items in one place.",
          "Functions": "Functions are like recipes! They do a specific task.\n\nExample in Python:\ndef greet():\n    print('Hello!')\n\ngreet()  # This calls the function",
        };
      case 'Java':
        return {
          "Classes": "A class is like a blueprint for creating objects!\n\nExample in Java:\nclass Car {\n    String color;\n    int speed;\n}\n\nClasses help us organize our code.",
          "Objects": "Objects are instances of classes!\n\nExample in Java:\nCar myCar = new Car();\nmyCar.color = \"red\";\n\nObjects have properties and behaviors.",
          "Inheritance": "Inheritance lets one class use properties of another!\n\nExample in Java:\nclass Animal { }\nclass Dog extends Animal { }\n\nDog inherits from Animal.",
          "Methods": "Methods are functions inside classes!\n\nExample in Java:\npublic void drive() {\n    System.out.println(\"Driving!\");\n}\n\nMethods perform actions.",
          "Arrays": "Arrays store multiple values!\n\nExample in Java:\nint[] numbers = {1, 2, 3, 4, 5};\n\nArrays have fixed size in Java.",
        };
      case 'C':
        return {
          "Hello World": "Your first C program!\n\nExample in C:\n#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\");\n    return 0;\n}\n\nThis prints 'Hello, World!' on screen.\nEvery C program starts with main() function.",
          "Variables": "Variables store data in C!\n\nExample in C:\nint age = 25;\nchar name[] = \"John\";\nfloat price = 99.99;\n\nC needs data types for variables.\nint for numbers, char for text, float for decimals.",
          "Data Types": "C has different data types!\n\nCommon types:\n• int: 42 (whole numbers)\n• float: 3.14 (decimal numbers)\n• char: 'A' (single character)\n• char[]: \"Hello\" (text/string)\n\nExample:\nint number = 10;\nfloat price = 99.99;",
          "Input Output": "Get input and show output in C!\n\nOutput with printf:\nprintf(\"Hello World\");\nprintf(\"Number: %d\", 42);\n\nInput with scanf:\nint age;\nscanf(\"%d\", &age);\n\nprintf shows data, scanf gets data from user.",
          "Operators": "Do math and comparisons in C!\n\nMath operators:\n+ (add), - (subtract), * (multiply), / (divide)\n\nExample:\nint a = 10, b = 5;\nint sum = a + b;  // 15\nint diff = a - b; // 5\n\nComparison: ==, !=, <, >, <=, >=",
        };
      case 'HTML':
        return {
          "HTML Basics": "HTML creates web pages!\n\nBasic HTML structure:\n<!DOCTYPE html>\n<html>\n<head>\n    <title>My Page</title>\n</head>\n<body>\n    <h1>Welcome!</h1>\n</body>\n</html>\n\nHTML uses tags to structure content.",
          "Headings & Paragraphs": "Create headings and text in HTML!\n\nHeadings (big to small):\n<h1>Biggest Heading</h1>\n<h2>Medium Heading</h2>\n<h3>Small Heading</h3>\n\nParagraphs:\n<p>This is a paragraph of text.</p>\n\nHeadings organize content, paragraphs contain text.",
          "Links & Images": "Add links and pictures to your webpage!\n\nLinks:\n<a href=\"https://google.com\">Click here</a>\n\nImages:\n<img src=\"photo.jpg\" alt=\"My photo\">\n\nLinks connect pages, images show pictures.\nalt text describes the image.",
          "Lists & Tables": "Organize information with lists and tables!\n\nUnordered list:\n<ul>\n  <li>Apple</li>\n  <li>Banana</li>\n</ul>\n\nTable:\n<table>\n  <tr>\n    <td>Name</td>\n    <td>Age</td>\n  </tr>\n</table>\n\nLists show items, tables show data in rows/columns.",
          "Forms": "Collect user input with forms!\n\nBasic form:\n<form>\n  <input type=\"text\" placeholder=\"Your name\">\n  <input type=\"email\" placeholder=\"Your email\">\n  <button type=\"submit\">Send</button>\n</form>\n\nForms let users enter and submit information.",
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final topicContent = getBeginnerContent(language);

    return Scaffold(
      appBar: AppBar(
        title: Text("Learn: $topic"),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Icon(Icons.lightbulb, size: 50, color: Colors.amber),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topic,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          level,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF2196F3), width: 2),
              ),
              child: Text(
                topicContent[topic] ??
                    "This topic will teach you about $topic in $language!",
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.check_circle),
                  label: Text("समजले!"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4CAF50),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    await UserDataManager.markTopicCompleted('${language}_${topic}_read');
                    await UserDataManager.addPoints(20);
                    await UserDataManager.updateStreak();
                    await UserDataManager.checkAndUnlockAchievements();
                    
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.quiz),
                  label: Text("Quiz घ्या"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2196F3),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicQuizScreen(
                          topic: topic,
                          language: language,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}