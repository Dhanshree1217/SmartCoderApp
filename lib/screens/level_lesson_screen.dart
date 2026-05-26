import 'package:flutter/material.dart';
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
      // Intermediate Levels (13-24)
      13: [
        {
          "question": "🐍 How to define function with parameters in Python?",
          "options": ["def func(x, y):", "function func(x, y)", "func(x, y) {", "def func[x, y]:"],
          "correct": 0,
          "explanation": "def func(x, y): creates function with parameters! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to create class in Java?",
          "options": ["class MyClass {", "Class MyClass {", "new MyClass {", "object MyClass {"],
          "correct": 0,
          "explanation": "class MyClass { creates new class in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to use pointers in C?",
          "options": ["int *ptr", "int ptr*", "pointer int ptr", "int &ptr"],
          "correct": 0,
          "explanation": "int *ptr declares pointer in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to add CSS class in HTML?",
          "options": ["class=\"myclass\"", "css=\"myclass\"", "style=\"myclass\"", "className=\"myclass\""],
          "correct": 0,
          "explanation": "class attribute adds CSS classes! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What is list comprehension in Python?",
          "options": ["[x for x in range(5)]", "{x for x in range(5)}", "(x for x in range(5))", "<x for x in range(5)>"],
          "correct": 0,
          "explanation": "List comprehension creates lists efficiently! 🐍",
          "language": "Python"
        },
      ],
      14: [
        {
          "question": "🐍 How to create object in Python?",
          "options": ["obj = MyClass()", "obj = new MyClass()", "obj = create MyClass()", "obj = MyClass.new()"],
          "correct": 0,
          "explanation": "obj = MyClass() creates object in Python! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is inheritance in Java?",
          "options": ["class Child extends Parent", "class Child inherits Parent", "class Child : Parent", "class Child from Parent"],
          "correct": 0,
          "explanation": "extends keyword creates inheritance! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to allocate memory in C?",
          "options": ["malloc(size)", "new(size)", "alloc(size)", "memory(size)"],
          "correct": 0,
          "explanation": "malloc() allocates memory dynamically! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create responsive design?",
          "options": ["@media queries", "@responsive", "@mobile", "@screen"],
          "correct": 0,
          "explanation": "@media queries make responsive design! 🌐",
          "language": "CSS"
        },
        {
          "question": "🐍 What is __init__ method?",
          "options": ["Constructor", "Destructor", "Main method", "Static method"],
          "correct": 0,
          "explanation": "__init__ is constructor in Python classes! 🐍",
          "language": "Python"
        },
      ],
      15: [
        {
          "question": "🐍 How to create nested loop in Python?",
          "options": ["for i in range(3):\n  for j in range(3):", "for i,j in range(3,3):", "for i+j in range(6):", "nested for i,j:"],
          "correct": 0,
          "explanation": "Nested loops have one loop inside another! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ What is nested loop output?",
          "options": ["9 iterations total", "6 iterations total", "3 iterations total", "Error"],
          "correct": 0,
          "explanation": "3x3 nested loop = 9 total iterations! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to break from nested loop in C?",
          "options": ["Use goto or flag", "break break", "exit()", "return"],
          "correct": 0,
          "explanation": "Use goto statement or flag variable! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create nested HTML elements?",
          "options": ["<div><p>text</p></div>", "<div>+<p>text</p>", "<div><p>text</div></p>", "<div,p>text</div,p>"],
          "correct": 0,
          "explanation": "Put elements inside other elements! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What prints nested loop pattern?",
          "options": ["Stars in triangle", "Single line", "Nothing", "Error"],
          "correct": 0,
          "explanation": "Nested loops create patterns like triangles! 🐍",
          "language": "Python"
        },
      ],
      16: [
        {
          "question": "🐍 How to create 2D list in Python?",
          "options": ["[[1,2],[3,4]]", "{[1,2],[3,4]}", "([1,2],[3,4))", "<[1,2],[3,4]>"],
          "correct": 0,
          "explanation": "2D list is list of lists! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to declare 2D array in Java?",
          "options": ["int[][] arr = new int[3][3]", "int[3][3] arr", "array[3][3] arr", "int arr[3,3]"],
          "correct": 0,
          "explanation": "int[][] creates 2D array in Java! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to access 2D array element in C?",
          "options": ["arr[i][j]", "arr[i,j]", "arr(i)(j)", "arr{i}{j}"],
          "correct": 0,
          "explanation": "Use arr[row][col] to access elements! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to create table in HTML?",
          "options": ["<table><tr><td>data</td></tr></table>", "<grid><row><cell>data</cell></row></grid>", "<tab><line><box>data</box></line></tab>", "<matrix><r><c>data</c></r></matrix>"],
          "correct": 0,
          "explanation": "<table> creates tables with rows and cells! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to get matrix dimensions?",
          "options": ["len(matrix), len(matrix[0])", "matrix.size()", "matrix.dimensions()", "size(matrix)"],
          "correct": 0,
          "explanation": "len() gives rows, len(matrix[0]) gives columns! 🐍",
          "language": "Python"
        },
      ],
      17: [
        {
          "question": "🐍 How to handle exceptions in Python?",
          "options": ["try: except:", "catch: throw:", "handle: error:", "trap: fix:"],
          "correct": 0,
          "explanation": "try-except blocks handle errors! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to catch exceptions in Java?",
          "options": ["try { } catch(Exception e) { }", "handle { } error(Exception e) { }", "attempt { } fail(Exception e) { }", "run { } stop(Exception e) { }"],
          "correct": 0,
          "explanation": "try-catch blocks handle exceptions! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What happens with unhandled errors in C?",
          "options": ["Program crashes", "Program continues", "Error ignored", "Auto-fixed"],
          "correct": 0,
          "explanation": "C programs crash on unhandled errors! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to validate form input in HTML?",
          "options": ["required attribute", "validate attribute", "check attribute", "must attribute"],
          "correct": 0,
          "explanation": "required attribute validates input! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 What is finally block?",
          "options": ["Always executes", "Only on error", "Only on success", "Never executes"],
          "correct": 0,
          "explanation": "finally block always runs! 🐍",
          "language": "Python"
        },
      ],
      18: [
        {
          "question": "🐍 How to read file in Python?",
          "options": ["open('file.txt', 'r')", "read('file.txt')", "file('file.txt')", "load('file.txt')"],
          "correct": 0,
          "explanation": "open() function reads files! 🐍",
          "language": "Python"
        },
        {
          "question": "☕ How to write file in Java?",
          "options": ["FileWriter", "WriteFile", "FileOutput", "SaveFile"],
          "correct": 0,
          "explanation": "FileWriter class writes to files! ☕",
          "language": "Java"
        },
        {
          "question": "💻 How to open file in C?",
          "options": ["fopen(\"file.txt\", \"r\")", "open(\"file.txt\")", "file(\"file.txt\")", "read(\"file.txt\")"],
          "correct": 0,
          "explanation": "fopen() opens files in C! 💻",
          "language": "C"
        },
        {
          "question": "🌐 How to upload file in HTML?",
          "options": ["<input type=\"file\">", "<upload>file</upload>", "<file>upload</file>", "<attach>file</attach>"],
          "correct": 0,
          "explanation": "input type=file creates upload button! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 How to close file properly?",
          "options": ["file.close() or with statement", "file.end()", "file.finish()", "file.stop()"],
          "correct": 0,
          "explanation": "Always close files or use 'with'! 🐍",
          "language": "Python"
        },
      ],
      19: [
        {
          "question": "🐍 What is linear search?",
          "options": ["Check each element one by one", "Divide and search", "Random search", "Hash search"],
          "correct": 0,
          "explanation": "Linear search checks every element! 🐍",
          "language": "Algorithm"
        },
        {
          "question": "☕ What is binary search requirement?",
          "options": ["Sorted array", "Unsorted array", "Large array", "Small array"],
          "correct": 0,
          "explanation": "Binary search needs sorted data! ☕",
          "language": "Algorithm"
        },
        {
          "question": "💻 Time complexity of linear search?",
          "options": ["O(n)", "O(log n)", "O(1)", "O(n²)"],
          "correct": 0,
          "explanation": "Linear search is O(n) complexity! 💻",
          "language": "Algorithm"
        },
        {
          "question": "🌐 How to search in HTML page?",
          "options": ["Ctrl+F", "Alt+S", "Shift+F", "Tab+S"],
          "correct": 0,
          "explanation": "Ctrl+F opens browser search! 🌐",
          "language": "HTML"
        },
        {
          "question": "🐍 Which is faster for large data?",
          "options": ["Binary search", "Linear search", "Both same", "Depends on data"],
          "correct": 0,
          "explanation": "Binary search is much faster! 🐍",
          "language": "Algorithm"
        },
      ],
      20: [
        {
          "question": "🐍 What is bubble sort?",
          "options": ["Compare adjacent elements", "Divide and sort", "Pick minimum element", "Insert in position"],
          "correct": 0,
          "explanation": "Bubble sort compares neighbors! 🐍",
          "language": "Algorithm"
        },
        {
          "question": "☕ Which sort is fastest?",
          "options": ["Quick sort", "Bubble sort", "Selection sort", "Insertion sort"],
          "correct": 0,
          "explanation": "Quick sort is generally fastest! ☕",
          "language": "Algorithm"
        },
        {
          "question": "💻 Time complexity of bubble sort?",
          "options": ["O(n²)", "O(n)", "O(log n)", "O(1)"],
          "correct": 0,
          "explanation": "Bubble sort is O(n²) complexity! 💻",
          "language": "Algorithm"
        },
        {
          "question": "🌐 How to sort HTML table?",
          "options": ["JavaScript sorting", "CSS sorting", "HTML sorting", "Auto sorting"],
          "correct": 0,
          "explanation": "Use JavaScript to sort tables! 🌐",
          "language": "JavaScript"
        },
        {
          "question": "🐍 Built-in sort function?",
          "options": ["list.sort()", "list.order()", "list.arrange()", "list.organize()"],
          "correct": 0,
          "explanation": "Python has built-in sort() method! 🐍",
          "language": "Python"
        },
      ],
      21: [
        {
          "question": "🌐 What is HTML?",
          "options": ["Markup language", "Programming language", "Database", "Operating system"],
          "correct": 0,
          "explanation": "HTML is markup language for web! 🌐",
          "language": "HTML"
        },
        {
          "question": "🎨 What is CSS?",
          "options": ["Styling language", "Programming language", "Database", "Framework"],
          "correct": 0,
          "explanation": "CSS styles web pages! 🎨",
          "language": "CSS"
        },
        {
          "question": "⚡ What is JavaScript?",
          "options": ["Programming language", "Markup language", "Styling language", "Database"],
          "correct": 0,
          "explanation": "JavaScript adds interactivity! ⚡",
          "language": "JavaScript"
        },
        {
          "question": "🌐 How to link CSS to HTML?",
          "options": ["<link rel=\"stylesheet\" href=\"style.css\">", "<css>style.css</css>", "<style src=\"style.css\">", "<import>style.css</import>"],
          "correct": 0,
          "explanation": "<link> tag connects CSS files! 🌐",
          "language": "HTML"
        },
        {
          "question": "⚡ How to add JavaScript to HTML?",
          "options": ["<script src=\"script.js\"></script>", "<js>script.js</js>", "<javascript>script.js</javascript>", "<code>script.js</code>"],
          "correct": 0,
          "explanation": "<script> tag adds JavaScript! ⚡",
          "language": "HTML"
        },
      ],
      22: [
        {
          "question": "🗄️ What is database?",
          "options": ["Organized data storage", "Programming language", "Web browser", "Operating system"],
          "correct": 0,
          "explanation": "Database stores organized data! 🗄️",
          "language": "Database"
        },
        {
          "question": "📊 What is SQL?",
          "options": ["Database query language", "Programming language", "Web framework", "Operating system"],
          "correct": 0,
          "explanation": "SQL queries databases! 📊",
          "language": "SQL"
        },
        {
          "question": "🗄️ How to select all data?",
          "options": ["SELECT * FROM table", "GET * FROM table", "FETCH * FROM table", "SHOW * FROM table"],
          "correct": 0,
          "explanation": "SELECT * gets all data! 🗄️",
          "language": "SQL"
        },
        {
          "question": "📊 How to insert data?",
          "options": ["INSERT INTO table VALUES", "ADD INTO table VALUES", "PUT INTO table VALUES", "SAVE INTO table VALUES"],
          "correct": 0,
          "explanation": "INSERT INTO adds new data! 📊",
          "language": "SQL"
        },
        {
          "question": "🗄️ What is primary key?",
          "options": ["Unique identifier", "Password", "Table name", "Database name"],
          "correct": 0,
          "explanation": "Primary key uniquely identifies records! 🗄️",
          "language": "Database"
        },
      ],
      23: [
        {
          "question": "🔗 What is API?",
          "options": ["Application Programming Interface", "Advanced Programming Interface", "Automatic Programming Interface", "Applied Programming Interface"],
          "correct": 0,
          "explanation": "API connects different applications! 🔗",
          "language": "API"
        },
        {
          "question": "📋 What is JSON?",
          "options": ["JavaScript Object Notation", "Java Standard Object Notation", "Just Simple Object Notation", "Joint Standard Object Notation"],
          "correct": 0,
          "explanation": "JSON is data exchange format! 📋",
          "language": "JSON"
        },
        {
          "question": "🔗 What is REST API?",
          "options": ["Web service architecture", "Database type", "Programming language", "Operating system"],
          "correct": 0,
          "explanation": "REST is web API architecture! 🔗",
          "language": "API"
        },
        {
          "question": "📋 JSON data format?",
          "options": ["{\"key\": \"value\"}", "<key>value</key>", "key=value", "key:value"],
          "correct": 0,
          "explanation": "JSON uses key-value pairs! 📋",
          "language": "JSON"
        },
        {
          "question": "🔗 HTTP method for getting data?",
          "options": ["GET", "POST", "PUT", "DELETE"],
          "correct": 0,
          "explanation": "GET method retrieves data! 🔗",
          "language": "HTTP"
        },
      ],
      24: [
        {
          "question": "🎮 What makes a good game?",
          "options": ["Fun gameplay", "Complex code", "Big file size", "Expensive graphics"],
          "correct": 0,
          "explanation": "Fun gameplay is most important! 🎮",
          "language": "Game Dev"
        },
        {
          "question": "🎯 What is game loop?",
          "options": ["Update and render cycle", "Loading screen", "Menu system", "Save system"],
          "correct": 0,
          "explanation": "Game loop updates and renders continuously! 🎯",
          "language": "Game Dev"
        },
        {
          "question": "🎮 What is sprite?",
          "options": ["2D game image", "3D model", "Sound effect", "Game level"],
          "correct": 0,
          "explanation": "Sprite is 2D game graphics! 🎮",
          "language": "Game Dev"
        },
        {
          "question": "🎯 What is collision detection?",
          "options": ["Check if objects touch", "Sound system", "Graphics rendering", "Input handling"],
          "correct": 0,
          "explanation": "Collision detection checks object interactions! 🎯",
          "language": "Game Dev"
        },
        {
          "question": "🎮 Popular game engine?",
          "options": ["Unity", "Photoshop", "Word", "Excel"],
          "correct": 0,
          "explanation": "Unity is popular game development engine! 🎮",
          "language": "Game Dev"
        },
      ],
      25: [
        {
          "question": "🐍 What is time complexity of binary search?",
          "options": ["O(log n)", "O(n)", "O(n²)", "O(1)"],
          "correct": 0,
          "explanation": "Binary search has O(log n) complexity! 🐍",
          "language": "Algorithm"
        },
        {
          "question": "☕ What is polymorphism in Java?",
          "options": ["Same method, different behavior", "Multiple inheritance", "Method overloading only", "Interface implementation"],
          "correct": 0,
          "explanation": "Polymorphism allows same interface, different implementations! ☕",
          "language": "Java"
        },
        {
          "question": "💻 What is memory leak in C?",
          "options": ["Allocated memory not freed", "Stack overflow", "Null pointer", "Buffer overflow"],
          "correct": 0,
          "explanation": "Memory leak happens when malloc memory isn't freed! 💻",
          "language": "C"
        },
        {
          "question": "🌐 What is Virtual DOM?",
          "options": ["JavaScript representation of DOM", "CSS framework", "HTML template", "Database structure"],
          "correct": 0,
          "explanation": "Virtual DOM is JS representation for faster updates! 🌐",
          "language": "JavaScript"
        },
        {
          "question": "🐍 What is decorator in Python?",
          "options": ["Function that modifies another function", "Class inheritance", "Error handling", "Loop optimization"],
          "correct": 0,
          "explanation": "Decorators modify function behavior! 🐍",
          "language": "Python"
        },
      ],
      26: [
        {
          "question": "🧠 What is dynamic programming?",
          "options": ["Optimization technique", "Programming language", "Database method", "Web framework"],
          "correct": 0,
          "explanation": "Dynamic programming optimizes by storing results! 🧠",
          "language": "Algorithm"
        },
        {
          "question": "⚡ What is memoization?",
          "options": ["Caching function results", "Memory allocation", "Data compression", "File storage"],
          "correct": 0,
          "explanation": "Memoization caches expensive function calls! ⚡",
          "language": "Algorithm"
        },
        {
          "question": "📊 Fibonacci with DP?",
          "options": ["Store previous results", "Calculate each time", "Use recursion only", "Use loops only"],
          "correct": 0,
          "explanation": "DP stores Fibonacci results to avoid recalculation! 📊",
          "language": "Algorithm"
        },
        {
          "question": "🧠 What problem does DP solve?",
          "options": ["Overlapping subproblems", "Simple calculations", "Basic sorting", "File operations"],
          "correct": 0,
          "explanation": "DP solves problems with overlapping subproblems! 🧠",
          "language": "Algorithm"
        },
        {
          "question": "⚡ DP vs normal recursion?",
          "options": ["DP is faster", "Same speed", "Recursion faster", "Both slow"],
          "correct": 0,
          "explanation": "DP avoids redundant calculations! ⚡",
          "language": "Algorithm"
        },
      ],
      27: [
        {
          "question": "🔄 What is recursion?",
          "options": ["Function calling itself", "Loop structure", "Class inheritance", "Error handling"],
          "correct": 0,
          "explanation": "Recursion is when function calls itself! 🔄",
          "language": "Algorithm"
        },
        {
          "question": "🐍 Base case in recursion?",
          "options": ["Stopping condition", "Starting point", "Error case", "Loop counter"],
          "correct": 0,
          "explanation": "Base case stops infinite recursion! 🐍",
          "language": "Algorithm"
        },
        {
          "question": "🔄 Factorial recursively?",
          "options": ["n * factorial(n-1)", "n + factorial(n-1)", "n - factorial(n-1)", "n / factorial(n-1)"],
          "correct": 0,
          "explanation": "Factorial: n! = n * (n-1)! 🔄",
          "language": "Algorithm"
        },
        {
          "question": "🐍 Stack overflow in recursion?",
          "options": ["Too many recursive calls", "Memory allocation error", "Syntax error", "Logic error"],
          "correct": 0,
          "explanation": "Too deep recursion causes stack overflow! 🐍",
          "language": "Algorithm"
        },
        {
          "question": "🔄 Tail recursion benefit?",
          "options": ["Memory efficient", "Faster execution", "Easier to write", "Better readability"],
          "correct": 0,
          "explanation": "Tail recursion optimizes memory usage! 🔄",
          "language": "Algorithm"
        },
      ],
      28: [
        {
          "question": "🌳 What is graph?",
          "options": ["Nodes connected by edges", "Linear data structure", "Tree structure", "Array structure"],
          "correct": 0,
          "explanation": "Graph has nodes (vertices) connected by edges! 🌳",
          "language": "Data Structure"
        },
        {
          "question": "🗺️ BFS vs DFS?",
          "options": ["BFS uses queue, DFS uses stack", "BFS uses stack, DFS uses queue", "Both use queue", "Both use stack"],
          "correct": 0,
          "explanation": "BFS (breadth-first) uses queue, DFS (depth-first) uses stack! 🗺️",
          "language": "Algorithm"
        },
        {
          "question": "🌳 Shortest path algorithm?",
          "options": ["Dijkstra's algorithm", "Bubble sort", "Linear search", "Binary search"],
          "correct": 0,
          "explanation": "Dijkstra finds shortest paths in graphs! 🌳",
          "language": "Algorithm"
        },
        {
          "question": "🗺️ What is spanning tree?",
          "options": ["Tree connecting all nodes", "Complete graph", "Disconnected graph", "Cyclic graph"],
          "correct": 0,
          "explanation": "Spanning tree connects all nodes without cycles! 🗺️",
          "language": "Data Structure"
        },
        {
          "question": "🌳 Graph representation?",
          "options": ["Adjacency matrix or list", "Array only", "Stack only", "Queue only"],
          "correct": 0,
          "explanation": "Graphs use adjacency matrix or adjacency list! 🌳",
          "language": "Data Structure"
        },
      ],
      29: [
        {
          "question": "🔐 What is encryption?",
          "options": ["Converting data to secret code", "Data compression", "Data backup", "Data sorting"],
          "correct": 0,
          "explanation": "Encryption converts data to unreadable format! 🔐",
          "language": "Security"
        },
        {
          "question": "🔑 What is hash function?",
          "options": ["One-way data transformation", "Two-way encryption", "Data compression", "Data sorting"],
          "correct": 0,
          "explanation": "Hash functions create fixed-size output from any input! 🔑",
          "language": "Security"
        },
        {
          "question": "🔐 RSA encryption type?",
          "options": ["Public key cryptography", "Private key only", "No key needed", "Symmetric encryption"],
          "correct": 0,
          "explanation": "RSA uses public-private key pairs! 🔐",
          "language": "Security"
        },
        {
          "question": "🔑 What is digital signature?",
          "options": ["Proof of authenticity", "Data compression", "File backup", "Password storage"],
          "correct": 0,
          "explanation": "Digital signatures verify data authenticity! 🔑",
          "language": "Security"
        },
        {
          "question": "🔐 Caesar cipher shift?",
          "options": ["Letter position shift", "Random replacement", "Number addition", "Character deletion"],
          "correct": 0,
          "explanation": "Caesar cipher shifts letters by fixed positions! 🔐",
          "language": "Security"
        },
      ],
      30: [
        {
          "question": "🤖 What is machine learning?",
          "options": ["Computers learning from data", "Manual programming", "Database management", "Web development"],
          "correct": 0,
          "explanation": "ML enables computers to learn patterns from data! 🤖",
          "language": "AI"
        },
        {
          "question": "📊 Supervised vs unsupervised learning?",
          "options": ["Supervised has labeled data", "Unsupervised has labeled data", "Both same", "Neither uses data"],
          "correct": 0,
          "explanation": "Supervised learning uses labeled training data! 📊",
          "language": "AI"
        },
        {
          "question": "🤖 What is neural network?",
          "options": ["Brain-inspired computing model", "Database structure", "Web framework", "File system"],
          "correct": 0,
          "explanation": "Neural networks mimic brain neuron connections! 🤖",
          "language": "AI"
        },
        {
          "question": "📊 Training data purpose?",
          "options": ["Teach the model", "Test the model", "Store the model", "Delete the model"],
          "correct": 0,
          "explanation": "Training data teaches ML models patterns! 📊",
          "language": "AI"
        },
        {
          "question": "🤖 Overfitting in ML?",
          "options": ["Model memorizes training data", "Model learns perfectly", "Model runs fast", "Model saves memory"],
          "correct": 0,
          "explanation": "Overfitting means model memorizes instead of learning! 🤖",
          "language": "AI"
        },
      ],
      31: [
        {
          "question": "🏗️ What is system design?",
          "options": ["Architecture for large systems", "UI design", "Database design only", "Code optimization"],
          "correct": 0,
          "explanation": "System design creates architecture for scalable systems! 🏗️",
          "language": "System Design"
        },
        {
          "question": "📊 What is load balancing?",
          "options": ["Distribute traffic across servers", "Balance database load", "Balance memory usage", "Balance CPU usage"],
          "correct": 0,
          "explanation": "Load balancers distribute requests across multiple servers! 📊",
          "language": "System Design"
        },
        {
          "question": "🏗️ What is microservices?",
          "options": ["Small independent services", "Large monolithic app", "Database architecture", "UI components"],
          "correct": 0,
          "explanation": "Microservices break apps into small, independent services! 🏗️",
          "language": "System Design"
        },
        {
          "question": "📊 What is caching?",
          "options": ["Store frequently used data", "Delete old data", "Compress data", "Encrypt data"],
          "correct": 0,
          "explanation": "Caching stores frequently accessed data for faster retrieval! 📊",
          "language": "System Design"
        },
        {
          "question": "🏗️ Database sharding?",
          "options": ["Split database across servers", "Backup database", "Compress database", "Encrypt database"],
          "correct": 0,
          "explanation": "Sharding splits large databases across multiple servers! 🏗️",
          "language": "System Design"
        },
      ],
      32: [
        {
          "question": "⚙️ What is multithreading?",
          "options": ["Multiple tasks simultaneously", "Single task execution", "Database operations", "File operations"],
          "correct": 0,
          "explanation": "Multithreading runs multiple tasks at the same time! ⚙️",
          "language": "Concurrency"
        },
        {
          "question": "🔄 What is race condition?",
          "options": ["Threads accessing shared data", "Fast execution", "Slow execution", "Memory allocation"],
          "correct": 0,
          "explanation": "Race condition occurs when threads compete for shared resources! 🔄",
          "language": "Concurrency"
        },
        {
          "question": "⚙️ What is mutex?",
          "options": ["Mutual exclusion lock", "Multiple execution", "Memory unit", "Math function"],
          "correct": 0,
          "explanation": "Mutex ensures only one thread accesses resource at a time! ⚙️",
          "language": "Concurrency"
        },
        {
          "question": "🔄 Deadlock in threading?",
          "options": ["Threads waiting for each other", "Threads running fast", "Threads stopping", "Threads starting"],
          "correct": 0,
          "explanation": "Deadlock happens when threads wait for each other indefinitely! 🔄",
          "language": "Concurrency"
        },
        {
          "question": "⚙️ Thread vs process?",
          "options": ["Threads share memory", "Processes share memory", "Both same", "Neither exists"],
          "correct": 0,
          "explanation": "Threads share memory within a process! ⚙️",
          "language": "Concurrency"
        },
      ],
      33: [
        {
          "question": "🔧 What is compiler?",
          "options": ["Translates code to machine language", "Runs code directly", "Stores code", "Deletes code"],
          "correct": 0,
          "explanation": "Compiler converts source code to machine code! 🔧",
          "language": "Compiler"
        },
        {
          "question": "📝 Lexical analysis does?",
          "options": ["Breaks code into tokens", "Executes code", "Optimizes code", "Stores code"],
          "correct": 0,
          "explanation": "Lexical analysis breaks source code into meaningful tokens! 📝",
          "language": "Compiler"
        },
        {
          "question": "🔧 What is parser?",
          "options": ["Analyzes syntax structure", "Generates machine code", "Optimizes performance", "Manages memory"],
          "correct": 0,
          "explanation": "Parser analyzes the grammatical structure of code! 🔧",
          "language": "Compiler"
        },
        {
          "question": "📝 Interpreter vs compiler?",
          "options": ["Interpreter executes line by line", "Compiler executes line by line", "Both same", "Neither executes"],
          "correct": 0,
          "explanation": "Interpreter executes code line by line, compiler translates first! 📝",
          "language": "Compiler"
        },
        {
          "question": "🔧 Code optimization purpose?",
          "options": ["Make code faster/smaller", "Make code longer", "Make code complex", "Make code unreadable"],
          "correct": 0,
          "explanation": "Optimization makes code run faster and use less memory! 🔧",
          "language": "Compiler"
        },
      ],
      34: [
        {
          "question": "🌐 What is distributed system?",
          "options": ["Multiple computers working together", "Single computer system", "Database system", "Web browser"],
          "correct": 0,
          "explanation": "Distributed systems use multiple computers to work as one! 🌐",
          "language": "Distributed Systems"
        },
        {
          "question": "🔗 What is consensus?",
          "options": ["Agreement between nodes", "Data compression", "Network speed", "Memory allocation"],
          "correct": 0,
          "explanation": "Consensus ensures all nodes agree on system state! 🔗",
          "language": "Distributed Systems"
        },
        {
          "question": "🌐 CAP theorem?",
          "options": ["Consistency, Availability, Partition tolerance", "CPU, Array, Pointer", "Cache, API, Protocol", "Code, Algorithm, Program"],
          "correct": 0,
          "explanation": "CAP theorem: can't have all three guarantees simultaneously! 🌐",
          "language": "Distributed Systems"
        },
        {
          "question": "🔗 What is replication?",
          "options": ["Copy data across multiple nodes", "Delete old data", "Compress data", "Encrypt data"],
          "correct": 0,
          "explanation": "Replication copies data to multiple nodes for reliability! 🔗",
          "language": "Distributed Systems"
        },
        {
          "question": "🌐 Network partition?",
          "options": ["Nodes can't communicate", "Fast network", "Slow network", "No network"],
          "correct": 0,
          "explanation": "Network partition means some nodes can't communicate! 🌐",
          "language": "Distributed Systems"
        },
      ],
      35: [
        {
          "question": "🛡️ What is cybersecurity?",
          "options": ["Protecting digital systems", "Building websites", "Creating databases", "Writing code"],
          "correct": 0,
          "explanation": "Cybersecurity protects systems from digital attacks! 🛡️",
          "language": "Security"
        },
        {
          "question": "🔒 What is firewall?",
          "options": ["Network security barrier", "Database tool", "Programming language", "Web browser"],
          "correct": 0,
          "explanation": "Firewall blocks unauthorized network access! 🔒",
          "language": "Security"
        },
        {
          "question": "🛡️ What is malware?",
          "options": ["Malicious software", "Good software", "System software", "Web software"],
          "correct": 0,
          "explanation": "Malware is software designed to harm systems! 🛡️",
          "language": "Security"
        },
        {
          "question": "🔒 What is phishing?",
          "options": ["Fake emails to steal info", "Fishing for data", "Network protocol", "Database query"],
          "correct": 0,
          "explanation": "Phishing uses fake communications to steal sensitive data! 🔒",
          "language": "Security"
        },
        {
          "question": "🛡️ Two-factor authentication?",
          "options": ["Two verification steps", "Two passwords", "Two usernames", "Two computers"],
          "correct": 0,
          "explanation": "2FA requires two different verification methods! 🛡️",
          "language": "Security"
        },
      ],
      36: [
        {
          "question": "🚀 What makes a great programmer?",
          "options": ["Problem-solving skills", "Memorizing syntax", "Fast typing", "Expensive computer"],
          "correct": 0,
          "explanation": "Great programmers are excellent problem solvers! 🚀",
          "language": "Career"
        },
        {
          "question": "🎆 Best way to learn programming?",
          "options": ["Practice and build projects", "Read books only", "Watch videos only", "Memorize code"],
          "correct": 0,
          "explanation": "Hands-on practice and building projects is the best way! 🎆",
          "language": "Career"
        },
        {
          "question": "🚀 What is clean code?",
          "options": ["Readable and maintainable", "Complex and clever", "Short and cryptic", "Long and detailed"],
          "correct": 0,
          "explanation": "Clean code is easy to read, understand, and maintain! 🚀",
          "language": "Best Practices"
        },
        {
          "question": "🎆 Version control importance?",
          "options": ["Track changes and collaborate", "Make code faster", "Reduce file size", "Encrypt code"],
          "correct": 0,
          "explanation": "Version control tracks changes and enables team collaboration! 🎆",
          "language": "Tools"
        },
        {
          "question": "🚀 Congratulations! You're now a master programmer! What's next?",
          "options": ["Keep learning and building!", "Stop coding", "Forget everything", "Give up"],
          "correct": 0,
          "explanation": "Programming is a lifelong journey! Keep building amazing things! 🚀🎆",
          "language": "Motivation"
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
    // Text-to-speech functionality removed for simplicity
    print('Would speak: $text');
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
      
      // Unlock next level
      int currentUserLevel = await UserDataManager.getUserLevel();
      if (widget.level >= currentUserLevel) {
        await UserDataManager.setUserLevel(widget.level + 1);
      }
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
