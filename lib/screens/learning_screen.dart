import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final String language;
  final String level;

  LearningScreen({required this.language, this.level = "Beginner Level"});

  final topics = [
    {"name": "Variables", "icon": Icons.storage},
    {"name": "Data Types", "icon": Icons.category},
    {"name": "Loops", "icon": Icons.loop},
    {"name": "Arrays", "icon": Icons.view_list},
    {"name": "Functions", "icon": Icons.functions},
  ];

  final Map<String, String> beginnerContent = {
    "Variables":
        "A variable is like a box where we store values!\n\nExample in Python:\nname = 'John'\nage = 25\n\nVariables help us remember information in our programs. Think of it like a label on a box!",
    "Data Types":
        "Data types tell us what kind of information we have!\n\nCommon types:\n• Numbers (like 10, 25)\n• Text (like 'Hello')\n• True/False (like yes or no)\n\nExample:\nage = 25  # Number\nname = 'Sara'  # Text",
    "Loops":
        "Loops help us repeat things!\n\nExample in Python:\nfor i in range(5):\n    print('Hello')\n\nThis will print 'Hello' 5 times! Loops save us from writing the same code again and again.",
    "Arrays":
        "Arrays are like a list of items!\n\nExample in Python:\nfruits = ['apple', 'banana', 'orange']\n\nWe can store many items in one place. It's like a shopping list!",
    "Functions":
        "Functions are like recipes! They do a specific task.\n\nExample in Python:\ndef greet():\n    print('Hello!')\n\ngreet()  # This calls the function\n\nFunctions help us organize our code!",
  };

  final Map<String, String> intermediateContent = {
    "Variables":
        "Variables can store different types of data and can be changed!\n\nExample:\nx = 10\nx = x + 5  # Now x is 15\n\nYou can also swap values:\na, b = 5, 10\na, b = b, a  # Now a=10, b=5",
    "Data Types":
        "Python has many data types:\n\n• int: 42\n• float: 3.14\n• str: 'Hello'\n• bool: True/False\n• list: [1, 2, 3]\n• dict: {'name': 'John'}\n\nYou can convert between types:\nnum = int('42')  # String to int",
    "Loops":
        "There are different types of loops!\n\nfor loop:\nfor i in range(5):\n    print(i)\n\nwhile loop:\ncount = 0\nwhile count < 5:\n    print(count)\n    count += 1\n\nUse 'break' to exit and 'continue' to skip!",
    "Arrays":
        "Lists have many useful methods!\n\nfruits = ['apple', 'banana']\nfruits.append('orange')  # Add item\nfruits.remove('banana')  # Remove item\nfruits[0]  # Access first item\nlen(fruits)  # Get length\n\nYou can also slice lists:\nfruits[0:2]  # Get first 2 items",
    "Functions":
        "Functions can take parameters and return values!\n\ndef add(a, b):\n    return a + b\n\nresult = add(5, 3)  # result is 8\n\nYou can also have default parameters:\ndef greet(name='User'):\n    print(f'Hello {name}')",
  };

  final Map<String, String> advancedContent = {
    "Variables":
        "Advanced variable concepts:\n\nGlobal vs Local:\nglobal_var = 10\n\ndef func():\n    local_var = 20\n    global global_var\n    global_var = 30\n\nMultiple assignment:\nx = y = z = 0\na, b, *rest = [1, 2, 3, 4, 5]",
    "Data Types":
        "Advanced data structures:\n\nSets (unique items):\nmy_set = {1, 2, 3}\n\nTuples (immutable):\nmy_tuple = (1, 2, 3)\n\nDictionaries:\nperson = {\n    'name': 'John',\n    'age': 25,\n    'skills': ['Python', 'Java']\n}",
    "Loops":
        "Advanced loop techniques:\n\nList comprehension:\nsquares = [x**2 for x in range(10)]\n\nEnumerate:\nfor i, val in enumerate(['a', 'b']):\n    print(f'{i}: {val}')\n\nZip:\nfor x, y in zip([1,2], ['a','b']):\n    print(x, y)",
    "Arrays":
        "Advanced list operations:\n\nList comprehension:\nevens = [x for x in range(10) if x % 2 == 0]\n\nMap and filter:\nnums = [1, 2, 3, 4]\nsquared = list(map(lambda x: x**2, nums))\nevens = list(filter(lambda x: x%2==0, nums))\n\nSorting:\nnums.sort()  # In-place\nsorted_nums = sorted(nums)  # New list",
    "Functions":
        "Advanced function concepts:\n\nLambda functions:\nsquare = lambda x: x**2\n\nDecorators:\ndef decorator(func):\n    def wrapper():\n        print('Before')\n        func()\n        print('After')\n    return wrapper\n\n*args and **kwargs:\ndef func(*args, **kwargs):\n    print(args, kwargs)",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Topics - $level"),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: ListView.builder(
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
                  color: Color(0xFF2196F3).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  topics[index]["icon"] as IconData,
                  color: Color(0xFF2196F3),
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
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF2196F3)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(
                      topic: topics[index]["name"] as String,
                      language: language,
                      level: level,
                      beginnerContent: beginnerContent,
                      intermediateContent: intermediateContent,
                      advancedContent: advancedContent,
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
  final Map<String, String> beginnerContent;
  final Map<String, String> intermediateContent;
  final Map<String, String> advancedContent;

  TopicDetailScreen({
    required this.topic,
    required this.language,
    required this.level,
    required this.beginnerContent,
    required this.intermediateContent,
    required this.advancedContent,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> topicContent;
    if (level.contains("Intermediate")) {
      topicContent = intermediateContent;
    } else if (level.contains("Advanced")) {
      topicContent = advancedContent;
    } else {
      topicContent = beginnerContent;
    }

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
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle),
                label: Text("I Understood!"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
