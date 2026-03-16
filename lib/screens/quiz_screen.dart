import 'package:flutter/material.dart';
import '../user_data_manager.dart';

class QuizScreen extends StatefulWidget {
  final String language;
  final String level;

  QuizScreen({required this.language, this.level = "Beginner Level"});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> getTopicsForLanguage(String language) {
    switch (language) {
      case 'Python':
        return [
          {"name": "Variables", "icon": Icons.storage},
          {"name": "Data Types", "icon": Icons.category},
          {"name": "Loops", "icon": Icons.loop},
          {"name": "Lists", "icon": Icons.view_list},
          {"name": "Functions", "icon": Icons.functions},
        ];
      case 'Java':
        return [
          {"name": "Classes", "icon": Icons.class_outlined},
          {"name": "Objects", "icon": Icons.widgets},
          {"name": "Inheritance", "icon": Icons.account_tree},
          {"name": "Methods", "icon": Icons.functions},
          {"name": "Arrays", "icon": Icons.view_list},
        ];
      case 'C':
        return [
          {"name": "Pointers", "icon": Icons.arrow_forward},
          {"name": "Memory", "icon": Icons.memory},
          {"name": "Structures", "icon": Icons.account_box},
          {"name": "File I/O", "icon": Icons.folder},
          {"name": "Functions", "icon": Icons.functions},
        ];
      case 'HTML':
        return [
          {"name": "Tags", "icon": Icons.code},
          {"name": "CSS Styling", "icon": Icons.palette},
          {"name": "Forms", "icon": Icons.assignment},
          {"name": "Layout", "icon": Icons.dashboard},
          {"name": "Responsive", "icon": Icons.phone_android},
        ];
      default:
        return [
          {"name": "Variables", "icon": Icons.storage},
          {"name": "Data Types", "icon": Icons.category},
          {"name": "Loops", "icon": Icons.loop},
          {"name": "Arrays", "icon": Icons.view_list},
          {"name": "Functions", "icon": Icons.functions},
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageTopics = getTopicsForLanguage(widget.language);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Time!"),
        backgroundColor: Color(0xFFFF9800),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange[50]!, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.emoji_events, size: 60, color: Colors.amber),
                  SizedBox(height: 10),
                  Text(
                    "Select a ${widget.language} Topic to Quiz",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Earn 5 points per correct answer!",
                    style: TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
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
                          color: Color(0xFFFF9800).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          languageTopics[index]["icon"] as IconData,
                          color: Color(0xFFFF9800),
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
                      trailing: Icon(Icons.play_arrow, color: Color(0xFFFF9800)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizQuestionsScreen(
                              topic: languageTopics[index]["name"] as String,
                              language: widget.language,
                              level: widget.level,
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

class QuizQuestionsScreen extends StatefulWidget {
  final String topic;
  final String language;
  final String level;

  QuizQuestionsScreen({required this.topic, required this.language, required this.level});

  @override
  _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;
  bool showFeedback = false;
  bool isCorrect = false;

  Map<String, Map<String, Map<String, List<Map<String, dynamic>>>>> getQuizData() {
    return {
      'Python': {
        'Beginner': {
          "Variables": [
            {"question": "How do you create a variable in Python?", "options": ["x = 5", "var x = 5", "int x = 5", "let x = 5"], "correct": 0},
            {"question": "Which is a valid variable name?", "options": ["my_name", "123name", "my-name", "my name"], "correct": 0},
          ],
          "Data Types": [
            {"question": "What type is 'Hello'?", "options": ["String", "Number", "Boolean", "Array"], "correct": 0},
            {"question": "What type is 25?", "options": ["Integer", "String", "Boolean", "List"], "correct": 0},
          ],
          "Loops": [
            {"question": "What does a loop do?", "options": ["Repeats code", "Stops code", "Deletes code", "Saves code"], "correct": 0},
            {"question": "Which loop runs a fixed number of times?", "options": ["for loop", "if statement", "function", "variable"], "correct": 0},
          ],
          "Lists": [
            {"question": "What is a list in Python?", "options": ["Collection of items", "A single number", "A function", "A loop"], "correct": 0},
            {"question": "How do we access first item in list?", "options": ["list[0]", "list[1]", "list.first", "list(0)"], "correct": 0},
          ],
          "Functions": [
            {"question": "How do we define a function in Python?", "options": ["def function_name():", "function name()", "func name", "define name"], "correct": 0},
            {"question": "What is a function?", "options": ["Reusable block of code", "A variable", "A loop", "An array"], "correct": 0},
          ],
        }
      },
      'Java': {
        'Beginner': {
          "Classes": [
            {"question": "What is a class in Java?", "options": ["Blueprint for objects", "A variable", "A loop", "A function"], "correct": 0},
            {"question": "How do you create a class?", "options": ["class MyClass {}", "Class MyClass {}", "new MyClass", "object MyClass"], "correct": 0},
          ],
          "Objects": [
            {"question": "What is an object?", "options": ["Instance of a class", "A variable", "A method", "A loop"], "correct": 0},
            {"question": "How do you create an object?", "options": ["new ClassName()", "create ClassName()", "make ClassName()", "build ClassName()"], "correct": 0},
          ],
          "Inheritance": [
            {"question": "What keyword is used for inheritance?", "options": ["extends", "implements", "inherits", "super"], "correct": 0},
            {"question": "What is inheritance?", "options": ["Class acquiring properties of another", "A loop", "A variable", "A method"], "correct": 0},
          ],
          "Methods": [
            {"question": "What is a method in Java?", "options": ["Function inside a class", "A variable", "A loop", "An object"], "correct": 0},
            {"question": "How do you call a method?", "options": ["object.methodName()", "call methodName()", "run methodName()", "execute methodName()"], "correct": 0},
          ],
          "Arrays": [
            {"question": "How do you declare an array in Java?", "options": ["int[] arr = new int[5]", "array int arr[5]", "int arr[] = [5]", "new array int[5]"], "correct": 0},
            {"question": "What is an array?", "options": ["Collection of same type elements", "A single variable", "A method", "A class"], "correct": 0},
          ],
        }
      },
      'C': {
        'Beginner': {
          "Pointers": [
            {"question": "What is a pointer?", "options": ["Variable storing memory address", "A function", "A loop", "An array"], "correct": 0},
            {"question": "How do you declare a pointer?", "options": ["int *ptr", "pointer int ptr", "int ptr*", "*int ptr"], "correct": 0},
          ],
          "Memory": [
            {"question": "What does malloc() do?", "options": ["Allocates memory", "Frees memory", "Prints output", "Reads input"], "correct": 0},
            {"question": "What does free() do?", "options": ["Releases memory", "Allocates memory", "Prints output", "Reads input"], "correct": 0},
          ],
          "Structures": [
            {"question": "What is a struct?", "options": ["User-defined data type", "A loop", "A function", "A pointer"], "correct": 0},
            {"question": "How do you declare a struct?", "options": ["struct Name { };", "structure Name { };", "class Name { };", "type Name { };"], "correct": 0},
          ],
          "File I/O": [
            {"question": "How do you open a file in C?", "options": ["fopen()", "open()", "file_open()", "read_file()"], "correct": 0},
            {"question": "How do you close a file?", "options": ["fclose()", "close()", "file_close()", "end_file()"], "correct": 0},
          ],
          "Functions": [
            {"question": "How do you define a function in C?", "options": ["int functionName() { }", "function int functionName()", "def functionName()", "func int functionName()"], "correct": 0},
            {"question": "What is a function?", "options": ["Block of reusable code", "A variable", "A loop", "A struct"], "correct": 0},
          ],
        }
      },
      'HTML': {
        'Beginner': {
          "Tags": [
            {"question": "What does HTML stand for?", "options": ["HyperText Markup Language", "High Tech Modern Language", "Home Tool Markup Language", "Hyper Transfer Protocol"], "correct": 0},
            {"question": "Which tag creates a heading?", "options": ["<h1>", "<head>", "<header>", "<title>"], "correct": 0},
          ],
          "CSS Styling": [
            {"question": "What does CSS stand for?", "options": ["Cascading Style Sheets", "Computer Style Sheets", "Creative Style Sheets", "Colorful Style Sheets"], "correct": 0},
            {"question": "How do you change text color?", "options": ["color: red;", "text-color: red;", "font-color: red;", "style: red;"], "correct": 0},
          ],
          "Forms": [
            {"question": "Which tag creates a form?", "options": ["<form>", "<input>", "<button>", "<field>"], "correct": 0},
            {"question": "Which input type creates a text box?", "options": ["text", "textbox", "string", "input"], "correct": 0},
          ],
          "Layout": [
            {"question": "Which tag is used for divisions?", "options": ["<div>", "<section>", "<part>", "<block>"], "correct": 0},
            {"question": "Which tag creates a paragraph?", "options": ["<p>", "<para>", "<text>", "<paragraph>"], "correct": 0},
          ],
          "Responsive": [
            {"question": "What makes a website responsive?", "options": ["Media queries", "JavaScript", "Images", "Videos"], "correct": 0},
            {"question": "Which CSS property controls layout?", "options": ["display", "color", "font-size", "text-align"], "correct": 0},
          ],
        }
      }
    };
  }

  void checkAnswer() {
    final allQuizData = getQuizData();
    final languageData = allQuizData[widget.language] ?? {};
    final levelData = languageData[widget.level.split(' ')[0]] ?? {};
    final questions = levelData[widget.topic] ?? [];
    
    if (questions.isEmpty) return;
    
    final question = questions[currentQuestion];
    
    setState(() {
      showFeedback = true;
      isCorrect = selectedAnswer == question["options"][question["correct"]];
      if (isCorrect) {
        score++;
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
          selectedAnswer = null;
          showFeedback = false;
        });
      } else {
        finishQuiz();
      }
    });
  }

  Future<void> finishQuiz() async {
    final allQuizData = getQuizData();
    final languageData = allQuizData[widget.language] ?? {};
    final levelData = languageData[widget.level.split(' ')[0]] ?? {};
    final questions = levelData[widget.topic] ?? [];
    
    await UserDataManager.saveQuizScore(widget.topic, score, questions.length);
    
    if (score >= questions.length * 0.6) {
      await UserDataManager.markTopicCompleted(widget.topic);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          topic: widget.topic,
          score: score,
          total: questions.length,
          pointsEarned: score * 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allQuizData = getQuizData();
    final languageData = allQuizData[widget.language] ?? {};
    final levelData = languageData[widget.level.split(' ')[0]] ?? {};
    final questions = levelData[widget.topic] ?? [];

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        body: Center(child: Text("No questions available for ${widget.language} ${widget.topic}")),
      );
    }

    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.topic} Quiz"),
        backgroundColor: Color(0xFFFF9800),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF9800).withOpacity(0.3), Colors.white],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF9800)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${currentQuestion + 1}/${questions.length}",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Score: $score",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFFF9800),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                question["question"],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: (question["options"] as List).length,
                itemBuilder: (context, index) {
                  final option = question["options"][index];
                  final isSelected = selectedAnswer == option;
                  final isCorrectOption = index == question["correct"];
                  
                  Color buttonColor = Colors.white;
                  if (showFeedback) {
                    if (isCorrectOption) {
                      buttonColor = Colors.green;
                    } else if (isSelected && !isCorrect) {
                      buttonColor = Colors.red;
                    }
                  } else if (isSelected) {
                    buttonColor = Color(0xFF2196F3);
                  }

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: (showFeedback && (isCorrectOption || isSelected)) || isSelected
                            ? Colors.white
                            : Colors.black87,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Color(0xFFFF9800), width: 2),
                        ),
                      ),
                      onPressed: showFeedback
                          ? null
                          : () {
                              setState(() {
                                selectedAnswer = option;
                              });
                            },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              option,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          if (showFeedback && isCorrectOption)
                            Icon(Icons.check_circle, color: Colors.white),
                          if (showFeedback && isSelected && !isCorrect)
                            Icon(Icons.cancel, color: Colors.white),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9800),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: (selectedAnswer == null || showFeedback) ? null : checkAnswer,
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final String topic;
  final int score;
  final int total;
  final int pointsEarned;

  QuizResultScreen({
    required this.topic,
    required this.score,
    required this.total,
    required this.pointsEarned,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).toInt();
    final isPassed = percentage >= 60;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Result"),
        backgroundColor: Color(0xFFFF9800),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF9800).withOpacity(0.2), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPassed ? Icons.emoji_events : Icons.refresh,
                  size: 100,
                  color: isPassed ? Colors.amber : Colors.orange,
                ),
                SizedBox(height: 20),
                Text(
                  isPassed ? "Congratulations!" : "Keep Practicing!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Your Score",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$score/$total",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: isPassed ? Colors.green : Colors.orange,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$percentage%",
                        style: TextStyle(fontSize: 24, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "+$pointsEarned Points Earned!",
                              style: TextStyle(
                                fontSize: 18,
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
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.refresh),
                        label: Text("Retry"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.home),
                        label: Text("Home"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2196F3),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}