import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../user_data_manager.dart';

class LevelLessonScreen extends StatefulWidget {
  final String language;
  final int level;
  final String title;
  final String concept;

  LevelLessonScreen({
    required this.language,
    required this.level,
    required this.title,
    required this.concept,
  });

  @override
  _LevelLessonScreenState createState() => _LevelLessonScreenState();
}

class _LevelLessonScreenState extends State<LevelLessonScreen> {
  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;
  bool showFeedback = false;
  bool isCorrect = false;
  bool isMuted = false;
  String voiceGender = "female"; // female or male
  FlutterTts flutterTts = FlutterTts();

  void playClickSound() {
    SystemSound.play(SystemSoundType.click);
  }

  final Map<String, Map<int, List<Map<String, dynamic>>>> allLanguageLessons = {
    "Mixed": {
      1: [
        {
          "question": "🐍 How do you print 'Hello' in Python?",
          "options": ["print('Hello')", "echo 'Hello'", "console.log('Hello')", "printf('Hello')"],
          "correct": 0,
          "explanation": "In Python, we use print() function! Python is easy and fun! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How do you print 'Hello' in Java?",
          "options": ["System.out.println(\"Hello\")", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In Java, we use System.out.println()! Java is powerful! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How do you print 'Hello' in C?",
          "options": ["printf(\"Hello\")", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In C, we use printf() function! C is fast and classic! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How do you display 'Hello' in HTML?",
          "options": ["<p>Hello</p>", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In HTML, we use <p> tags for text! HTML builds websites! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What does print('Hi') do in Python?",
          "options": ["Shows Hi on screen", "Saves Hi to file", "Deletes Hi", "Nothing"],
          "correct": 0,
          "explanation": "print() displays text on screen. Python makes coding fun! 🐍",
          "language": "Python"
        },
      ],
      2: [
        {
          "question": "🐍 How to create variable in Python?",
          "options": ["name = 'John'", "var name = 'John'", "let name = 'John'", "String name = 'John'"],
          "correct": 0,
          "explanation": "Python uses simple = for variables. No type needed! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to declare variable in Java?",
          "options": ["String name = \"John\"", "name = 'John'", "var name = 'John'", "let name = 'John'"],
          "correct": 0,
          "explanation": "Java needs type declaration. String for text! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to declare variable in C?",
          "options": ["char name[] = \"John\"", "name = 'John'", "var name = 'John'", "let name = 'John'"],
          "correct": 0,
          "explanation": "C uses char[] for strings. Classic way! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create heading in HTML?",
          "options": ["<h1>Title</h1>", "<heading>Title</heading>", "<title>Title</title>", "<head>Title</head>"],
          "correct": 0,
          "explanation": "<h1> creates biggest heading in HTML! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 Which variable name is valid in Python?",
          "options": ["my_name", "123name", "my-name", "my name"],
          "correct": 0,
          "explanation": "Use letters, numbers, underscore. No spaces or dashes! 🐍",
          "language": "Python"
        },
      ],
      3: [
        {
          "question": "🐍 What type is 'Hello' in Python?",
          "options": ["String", "Number", "Boolean", "List"],
          "correct": 0,
          "explanation": "Text in quotes is a string! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What type is 42 in Java?",
          "options": ["int", "String", "float", "boolean"],
          "correct": 0,
          "explanation": "Whole numbers are int in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What type is 3.14 in C?",
          "options": ["float", "int", "char", "double"],
          "correct": 0,
          "explanation": "Decimal numbers are float in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 Which tag makes text bold in HTML?",
          "options": ["<b>", "<bold>", "<strong>", "Both A and C"],
          "correct": 3,
          "explanation": "Both <b> and <strong> make text bold! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What type is True in Python?",
          "options": ["Boolean", "String", "Integer", "None"],
          "correct": 0,
          "explanation": "True/False are boolean values! 🐍",
          "language": "Python"
        },
      ],
      4: [
        {
          "question": "🐍 How to get user input in Python?",
          "options": ["input()", "scan()", "read()", "get()"],
          "correct": 0,
          "explanation": "input() gets user input in Python! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to read input in Java?",
          "options": ["Scanner", "input()", "read()", "get()"],
          "correct": 0,
          "explanation": "Scanner class reads input in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to read input in C?",
          "options": ["scanf()", "input()", "read()", "get()"],
          "correct": 0,
          "explanation": "scanf() reads input in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 Which tag creates input field in HTML?",
          "options": ["<input>", "<textbox>", "<field>", "<text>"],
          "correct": 0,
          "explanation": "<input> creates input fields! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to print with variable in Python?",
          "options": ["print(name)", "print('name')", "echo name", "printf(name)"],
          "correct": 0,
          "explanation": "Use variable without quotes in print()! 🐍",
          "language": "Python"
        },
      ],
      5: [
        {
          "question": "🐍 What is 5 + 3 in Python?",
          "options": ["8", "53", "15", "Error"],
          "correct": 0,
          "explanation": "+ adds numbers! 5 + 3 = 8! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is 10 / 2 in Java?",
          "options": ["5", "5.0", "Both", "Error"],
          "correct": 0,
          "explanation": "/ divides numbers! 10 / 2 = 5! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What is 4 * 3 in C?",
          "options": ["12", "7", "43", "Error"],
          "correct": 0,
          "explanation": "* multiplies numbers! 4 * 3 = 12! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to add CSS to HTML?",
          "options": ["<style>", "<css>", "<design>", "<format>"],
          "correct": 0,
          "explanation": "<style> tag adds CSS to HTML! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What is 10 % 3 in Python?",
          "options": ["1", "3", "10", "0"],
          "correct": 0,
          "explanation": "% gives remainder! 10 % 3 = 1! 🐍",
          "language": "Python"
        },
      ],
      6: [
        {
          "question": "🐍 What does if x > 5: do in Python?",
          "options": ["Checks if x is greater than 5", "Sets x to 5", "Adds 5 to x", "Nothing"],
          "correct": 0,
          "explanation": "if checks conditions! > means greater than! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is else used for in Java?",
          "options": ["When if is false", "Always runs", "Loops code", "Ends program"],
          "correct": 0,
          "explanation": "else runs when if condition is false! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What does == mean in C?",
          "options": ["Equal to", "Assign value", "Not equal", "Greater than"],
          "correct": 0,
          "explanation": "== checks if two values are equal! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create link in HTML?",
          "options": ["<a href=\"url\">text</a>", "<link>text</link>", "<url>text</url>", "<href>text</href>"],
          "correct": 0,
          "explanation": "<a> tag with href creates links! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What is elif in Python?",
          "options": ["Else if", "End if", "Exit if", "Error if"],
          "correct": 0,
          "explanation": "elif means else if - another condition! 🐍",
          "language": "Python"
        },
      ],
      7: [
        {
          "question": "🐍 What does for i in range(5): do?",
          "options": ["Loops 5 times", "Loops forever", "Runs once", "Error"],
          "correct": 0,
          "explanation": "for loop repeats code! range(5) = 0,1,2,3,4! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is for(int i=0; i<5; i++) in Java?",
          "options": ["Loop 5 times", "Loop forever", "Run once", "Error"],
          "correct": 0,
          "explanation": "for loop repeats! i++ increases i by 1! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What does for(i=0; i<3; i++) do in C?",
          "options": ["Loop 3 times", "Loop forever", "Run once", "Error"],
          "correct": 0,
          "explanation": "for loop repeats 3 times! i=0,1,2! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create list in HTML?",
          "options": ["<ul><li>item</li></ul>", "<list>item</list>", "<items>item</items>", "<ol>item</ol>"],
          "correct": 0,
          "explanation": "<ul> creates unordered list, <li> for items! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to exit loop in Python?",
          "options": ["break", "exit", "stop", "end"],
          "correct": 0,
          "explanation": "break exits the loop immediately! 🐍",
          "language": "Python"
        },
      ],
      8: [
        {
          "question": "🐍 What does while True: do?",
          "options": ["Loop forever", "Loop once", "Never loops", "Error"],
          "correct": 0,
          "explanation": "while True loops forever until break! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is while(x > 0) in Java?",
          "options": ["Loop while x > 0", "Loop forever", "Run once", "Error"],
          "correct": 0,
          "explanation": "while loops as long as condition is true! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What does do-while loop do in C?",
          "options": ["Run at least once", "Never runs", "Loop forever", "Error"],
          "correct": 0,
          "explanation": "do-while runs code first, then checks condition! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to add image in HTML?",
          "options": ["<img src=\"url\">", "<image>url</image>", "<pic>url</pic>", "<photo>url</photo>"],
          "correct": 0,
          "explanation": "<img> tag with src adds images! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What is continue in Python?",
          "options": ["Skip to next iteration", "Exit loop", "Stop program", "Error"],
          "correct": 0,
          "explanation": "continue skips current iteration, goes to next! 🐍",
          "language": "Python"
        },
      ],
      9: [
        {
          "question": "🐍 How to create list in Python?",
          "options": ["[1, 2, 3]", "{1, 2, 3}", "(1, 2, 3)", "<1, 2, 3>"],
          "correct": 0,
          "explanation": "[] creates lists in Python! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to create array in Java?",
          "options": ["int[] arr = {1,2,3}", "arr = [1,2,3]", "array arr = {1,2,3}", "list arr = {1,2,3}"],
          "correct": 0,
          "explanation": "int[] creates integer array in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to declare array in C?",
          "options": ["int arr[3]", "arr = [1,2,3]", "array arr", "list arr"],
          "correct": 0,
          "explanation": "int arr[size] declares array in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create table in HTML?",
          "options": ["<table><tr><td>data</td></tr></table>", "<tab>data</tab>", "<grid>data</grid>", "<data>data</data>"],
          "correct": 0,
          "explanation": "<table> creates tables! <tr> = row, <td> = cell! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to access first item in list?",
          "options": ["list[0]", "list[1]", "list.first()", "list.get(0)"],
          "correct": 0,
          "explanation": "Index starts at 0! list[0] = first item! 🐍",
          "language": "Python"
        },
      ],
      10: [
        {
          "question": "🐍 How to create function in Python?",
          "options": ["def myFunc():", "function myFunc()", "func myFunc()", "void myFunc()"],
          "correct": 0,
          "explanation": "def creates functions in Python! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to create method in Java?",
          "options": ["public void myMethod()", "def myMethod()", "function myMethod()", "method myMethod()"],
          "correct": 0,
          "explanation": "public void creates methods in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to create function in C?",
          "options": ["void myFunc()", "def myFunc()", "function myFunc()", "func myFunc()"],
          "correct": 0,
          "explanation": "void creates functions in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to add JavaScript in HTML?",
          "options": ["<script>code</script>", "<js>code</js>", "<javascript>code</javascript>", "<code>code</code>"],
          "correct": 0,
          "explanation": "<script> tag adds JavaScript! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to call function in Python?",
          "options": ["myFunc()", "call myFunc()", "run myFunc()", "execute myFunc()"],
          "correct": 0,
          "explanation": "Just write function name with ()! 🐍",
          "language": "Python"
        },
      ],
      11: [
        {
          "question": "🐍 How to make text uppercase in Python?",
          "options": [".upper()", ".toUpper()", ".uppercase()", ".UP()"],
          "correct": 0,
          "explanation": ".upper() makes text UPPERCASE! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to get string length in Java?",
          "options": [".length()", ".size()", ".count()", ".len()"],
          "correct": 0,
          "explanation": ".length() returns string length! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to get string length in C?",
          "options": ["strlen()", "length()", "size()", "count()"],
          "correct": 0,
          "explanation": "strlen() from string.h gets length! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to change text color in CSS?",
          "options": ["color: red;", "text-color: red;", "font-color: red;", "text: red;"],
          "correct": 0,
          "explanation": "color property changes text color! 🌐",
          "language": "CSS"
        },
        {
          "question": "🐍 How to replace text in Python?",
          "options": [".replace('old', 'new')", ".change('old', 'new')", ".swap('old', 'new')", ".update('old', 'new')"],
          "correct": 0,
          "explanation": ".replace() replaces text! 🐍",
          "language": "Python"
        },
      ],
      12: [
        {
          "question": "🐍 What makes Python great for beginners?",
          "options": ["Easy syntax", "Fast speed", "Old language", "Hard to learn"],
          "correct": 0,
          "explanation": "Python has simple, readable syntax! Perfect for beginners! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is Java mainly used for?",
          "options": ["Apps & websites", "Only games", "Only mobile", "Only desktop"],
          "correct": 0,
          "explanation": "Java builds apps, websites, Android apps! Very versatile! ☕",
          "language": "Java"
        },
        {
          "question": "💻 Why is C language important?",
          "options": ["Fast & powerful", "Easy to learn", "New language", "Only for web"],
          "correct": 0,
          "explanation": "C is fast, powerful, used in OS and embedded systems! 💻",
          "language": "C"
        },
        {
          "question": "🌐 What does HTML stand for?",
          "options": ["HyperText Markup Language", "High Tech Modern Language", "Home Tool Markup Language", "Hyper Transfer Markup Language"],
          "correct": 0,
          "explanation": "HTML = HyperText Markup Language! Builds web pages! 🌐",
          "language": "HTML"
        },
        {
          "question": "🎉 You completed all levels! What's next?",
          "options": ["Keep practicing!", "Give up", "Stop learning", "Forget everything"],
          "correct": 0,
          "explanation": "Keep coding! Practice makes perfect! You're awesome! 🎉",
          "language": "All"
        },
      ],
    },
    "Python": {
      1: [
        {
          "question": "How do you print 'Hello' in Python?",
          "options": ["print('Hello')", "echo 'Hello'", "console.log('Hello')", "printf('Hello')"],
          "correct": 0,
          "explanation": "In Python, we use print() function to display output! 🐍"
        },
        {
          "question": "What does print('Hi') do?",
          "options": ["Shows Hi on screen", "Saves Hi to file", "Deletes Hi", "Nothing"],
          "correct": 0,
          "explanation": "print() displays text on the screen. Easy peasy!"
        },
        {
          "question": "Which is correct?",
          "options": ["print('Welcome')", "Print('Welcome')", "PRINT('Welcome')", "print Welcome"],
          "correct": 0,
          "explanation": "Python is case-sensitive. Always use lowercase 'print'!"
        },
        {
          "question": "How to print a number?",
          "options": ["print(42)", "print('42')", "Both are correct", "None"],
          "correct": 2,
          "explanation": "You can print numbers with or without quotes. Both work!"
        },
        {
          "question": "What's the output: print('Hello', 'World')?",
          "options": ["Hello World", "HelloWorld", "Hello, World", "Error"],
          "correct": 0,
          "explanation": "print() automatically adds space between items. Cool!"
        },
      ],
    },
    "Java": {
      1: [
        {
          "question": "How do you print 'Hello' in Java?",
          "options": ["System.out.println(\"Hello\")", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In Java, we use System.out.println() to print! ☕"
        },
        {
          "question": "What does System.out.print() do?",
          "options": ["Prints without new line", "Prints with new line", "Deletes text", "Nothing"],
          "correct": 0,
          "explanation": "print() doesn't add new line, println() does!"
        },
        {
          "question": "Which is correct?",
          "options": ["System.out.println(\"Hi\")", "system.out.println(\"Hi\")", "SYSTEM.OUT.PRINTLN(\"Hi\")", "println(\"Hi\")"],
          "correct": 0,
          "explanation": "Java is case-sensitive. Use proper capitalization!"
        },
        {
          "question": "How to print a number in Java?",
          "options": ["System.out.println(42)", "System.out.println('42')", "Both work", "None"],
          "correct": 2,
          "explanation": "Java can print numbers with or without quotes!"
        },
        {
          "question": "What's at the end of every Java statement?",
          "options": ["Semicolon ;", "Comma ,", "Period .", "Nothing"],
          "correct": 0,
          "explanation": "Every Java statement ends with a semicolon! Don't forget it!"
        },
      ],
    },
    "C Language": {
      1: [
        {
          "question": "How do you print 'Hello' in C?",
          "options": ["printf(\"Hello\")", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In C, we use printf() function to print! 💻"
        },
        {
          "question": "What does printf(\"Hi\\n\") do?",
          "options": ["Prints Hi with new line", "Prints Hi without new line", "Error", "Nothing"],
          "correct": 0,
          "explanation": "\\n adds a new line after printing. Super useful!"
        },
        {
          "question": "Which header file is needed for printf?",
          "options": ["#include <stdio.h>", "#include <iostream>", "#include <print.h>", "No header needed"],
          "correct": 0,
          "explanation": "stdio.h (Standard Input Output) is needed for printf!"
        },
        {
          "question": "How to print a number in C?",
          "options": ["printf(\"%d\", 42)", "printf(42)", "print(42)", "console.log(42)"],
          "correct": 0,
          "explanation": "Use %d for integers in printf. Format specifiers are cool!"
        },
        {
          "question": "What's at the end of every C statement?",
          "options": ["Semicolon ;", "Comma ,", "Period .", "Nothing"],
          "correct": 0,
          "explanation": "Every C statement ends with a semicolon! Just like Java!"
        },
      ],
    },
    "HTML/CSS": {
      1: [
        {
          "question": "How do you display 'Hello' in HTML?",
          "options": ["<p>Hello</p>", "print('Hello')", "console.log('Hello')", "echo 'Hello'"],
          "correct": 0,
          "explanation": "In HTML, we use <p> tags for paragraphs! 🌐"
        },
        {
          "question": "What does <h1> tag do?",
          "options": ["Creates big heading", "Creates paragraph", "Creates link", "Creates image"],
          "correct": 0,
          "explanation": "<h1> creates the biggest heading. <h6> is smallest!"
        },
        {
          "question": "Which tag creates a link?",
          "options": ["<a>", "<link>", "<url>", "<href>"],
          "correct": 0,
          "explanation": "<a> tag creates links. 'a' stands for anchor!"
        },
        {
          "question": "How to make text bold in HTML?",
          "options": ["<b>text</b>", "<bold>text</bold>", "<strong>text</strong>", "Both A and C"],
          "correct": 3,
          "explanation": "Both <b> and <strong> make text bold! Two ways to do it!"
        },
        {
          "question": "What does CSS stand for?",
          "options": ["Cascading Style Sheets", "Computer Style Sheets", "Creative Style Sheets", "Colorful Style Sheets"],
          "correct": 0,
          "explanation": "CSS = Cascading Style Sheets. It makes websites beautiful!"
        },
      ],
    },
  };

  List<Map<String, dynamic>> getCurrentQuestions() {
    final languageLessons = allLanguageLessons[widget.language];
    if (languageLessons == null) return [];
    return languageLessons[widget.level] ?? [];
  }

  Future<void> speak(String text) async {
    if (isMuted) return;
    
    await flutterTts.setLanguage("en-IN"); // Indian English
    
    if (voiceGender == "female") {
      await flutterTts.setPitch(1.3); // Higher pitch for female
      await flutterTts.setSpeechRate(0.45); // Slower for clarity
    } else {
      await flutterTts.setPitch(0.9); // Lower pitch for male
      await flutterTts.setSpeechRate(0.45); // Slower for clarity
    }
    
    await flutterTts.speak(text);
  }

  void checkAnswer() {
    final questions = getCurrentQuestions();
    final question = questions[currentQuestion];
    
    setState(() {
      showFeedback = true;
      isCorrect = selectedAnswer == question["options"][question["correct"]];
      if (isCorrect) {
        score++;
        speak("Correct! Well done!");
      } else {
        speak("Oops! Try again next time.");
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
        finishLesson();
      }
    });
  }

  Future<void> finishLesson() async {
    final questions = getCurrentQuestions();
    final percentage = (score / questions.length * 100).toInt();
    
    if (percentage >= 60) {
      await UserDataManager.markTopicCompleted('${widget.language}_level_${widget.level}');
      await UserDataManager.addPoints(score * 10);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LessonResultScreen(
          score: score,
          total: questions.length,
          passed: percentage >= 60,
          level: widget.level,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions = getCurrentQuestions();
    
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Level ${widget.level}"),
          backgroundColor: Color(0xFFFF8C42),
        ),
        body: Center(child: Text("Coming Soon!")),
      );
    }

    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4513),
        title: Text("${widget.title}"),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
            onSelected: (value) {
              setState(() {
                if (value == "mute") {
                  isMuted = !isMuted;
                } else {
                  voiceGender = value;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "mute",
                child: Row(
                  children: [
                    Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                    SizedBox(width: 10),
                    Text(isMuted ? "Unmute" : "Mute"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "female",
                child: Row(
                  children: [
                    Icon(Icons.woman, color: voiceGender == "female" ? Colors.pink : Colors.grey),
                    SizedBox(width: 10),
                    Text("Girl Voice"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "male",
                child: Row(
                  children: [
                    Icon(Icons.man, color: voiceGender == "male" ? Colors.blue : Colors.grey),
                    SizedBox(width: 10),
                    Text("Boy Voice"),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                "${currentQuestion + 1}/${questions.length}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (currentQuestion + 1) / questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
            minHeight: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question["question"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF8C42),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.volume_up, color: Color(0xFFFF8C42), size: 30),
                          onPressed: () => speak(question["question"]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ...List.generate(
                    (question["options"] as List).length,
                    (index) {
                      final option = question["options"][index];
                      final isSelected = selectedAnswer == option;
                      final isCorrectOption = index == question["correct"];
                      
                      Color buttonColor = Colors.white;
                      if (showFeedback) {
                        if (isCorrectOption) {
                          buttonColor = Color(0xFF58CC02);
                        } else if (isSelected && !isCorrect) {
                          buttonColor = Color(0xFFFF4B4B);
                        }
                      } else if (isSelected) {
                        buttonColor = Color(0xFFD2691E);
                      }

                      return Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: (showFeedback && (isCorrectOption || isSelected)) || isSelected
                                ? Colors.white
                                : Color(0xFFFF8C42),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Color(0xFFFF8C42),
                                width: 2,
                              ),
                            ),
                            elevation: 4,
                          ),
                          onPressed: showFeedback
                              ? null
                              : () {
                                  playClickSound();
                                  setState(() {
                                    selectedAnswer = option;
                                  });
                                },
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                              if (showFeedback && isCorrectOption)
                                Icon(Icons.check_circle, color: Colors.white, size: 30),
                              if (showFeedback && isSelected && !isCorrect)
                                Icon(Icons.cancel, color: Colors.white, size: 30),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  if (showFeedback)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isCorrect ? Color(0xFF58CC02).withOpacity(0.2) : Color(0xFFFF4B4B).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isCorrect ? Color(0xFF58CC02) : Color(0xFFFF4B4B),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.info,
                            color: isCorrect ? Color(0xFF58CC02) : Color(0xFFFF4B4B),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              question["explanation"],
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF58CC02),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              onPressed: (selectedAnswer == null || showFeedback) ? null : () {
                playClickSound();
                checkAnswer();
              },
              child: Text(
                "CHECK",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final bool passed;
  final int level;

  LessonResultScreen({
    required this.score,
    required this.total,
    required this.passed,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).toInt();

    return Scaffold(
      backgroundColor: passed ? Color(0xFF58CC02) : Color(0xFFFF9600),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  passed ? Icons.emoji_events : Icons.refresh,
                  size: 120,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  passed ? "Level Complete!" : "Keep Practicing!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$score / $total",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: passed ? Color(0xFF58CC02) : Color(0xFFFF9600),
                        ),
                      ),
                      Text(
                        "$percentage% Correct",
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      ),
                      if (passed) ...[
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            SizedBox(width: 10),
                            Text(
                              "+${score * 10} Points",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: passed ? Color(0xFF58CC02) : Color(0xFFFF9600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
