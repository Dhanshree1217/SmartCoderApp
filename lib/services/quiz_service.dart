import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class QuizService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _collection = 'quiz_questions';

  // Fetch questions by language and level
  static Future<List<QuestionModel>> getQuestions({
    required String language,
    required String level,
  }) async {
    try {
      final snapshot = await _db
          .collection(_collection)
          .where('language', isEqualTo: language)
          .where('level', isEqualTo: level)
          .get();

      return snapshot.docs
          .map((doc) => QuestionModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      return [];
    }
  }

  // Upload questions to Firestore (run once to seed data)
  static Future<void> uploadQuestions() async {
    final questions = _getAllQuestions();
    final batch = _db.batch();

    for (var q in questions) {
      final ref = _db.collection(_collection).doc();
      batch.set(ref, q.toMap());
    }
    await batch.commit();
  }

  static List<QuestionModel> _getAllQuestions() {
    return [
      // ─── PYTHON BEGINNER ───
      QuestionModel(id: '', language: 'Python', level: 'Beginner',
        question: 'How do you print "Hello" in Python?',
        options: ['print("Hello")', 'echo "Hello"', 'console.log("Hello")', 'printf("Hello")'],
        answer: 'print("Hello")'),
      QuestionModel(id: '', language: 'Python', level: 'Beginner',
        question: 'How do you create a variable in Python?',
        options: ['x = 5', 'var x = 5', 'int x = 5', 'let x = 5'],
        answer: 'x = 5'),
      QuestionModel(id: '', language: 'Python', level: 'Beginner',
        question: 'Which symbol is used for comments in Python?',
        options: ['#', '//', '/*', '--'],
        answer: '#'),
      QuestionModel(id: '', language: 'Python', level: 'Beginner',
        question: 'What is the output of print(2 + 3)?',
        options: ['5', '23', 'Error', 'None'],
        answer: '5'),
      QuestionModel(id: '', language: 'Python', level: 'Beginner',
        question: 'How do you take input from user in Python?',
        options: ['input()', 'scan()', 'read()', 'get()'],
        answer: 'input()'),

      // ─── PYTHON INTERMEDIATE ───
      QuestionModel(id: '', language: 'Python', level: 'Intermediate',
        question: 'What does len([1,2,3]) return?',
        options: ['3', '2', '1', 'Error'],
        answer: '3'),
      QuestionModel(id: '', language: 'Python', level: 'Intermediate',
        question: 'Which keyword defines a function in Python?',
        options: ['def', 'func', 'function', 'define'],
        answer: 'def'),
      QuestionModel(id: '', language: 'Python', level: 'Intermediate',
        question: 'What is a list comprehension?',
        options: ['[x for x in range(5)]', '{x for x in range(5)}', '(x for x in range(5))', 'None'],
        answer: '[x for x in range(5)]'),
      QuestionModel(id: '', language: 'Python', level: 'Intermediate',
        question: 'What does range(1, 5) produce?',
        options: ['1,2,3,4', '1,2,3,4,5', '0,1,2,3,4', '2,3,4,5'],
        answer: '1,2,3,4'),
      QuestionModel(id: '', language: 'Python', level: 'Intermediate',
        question: 'How do you open a file in Python?',
        options: ['open("file.txt")', 'file.open("file.txt")', 'read("file.txt")', 'load("file.txt")'],
        answer: 'open("file.txt")'),

      // ─── PYTHON ADVANCED ───
      QuestionModel(id: '', language: 'Python', level: 'Advanced',
        question: 'What is a decorator in Python?',
        options: ['A function that wraps another function', 'A class', 'A variable', 'A loop'],
        answer: 'A function that wraps another function'),
      QuestionModel(id: '', language: 'Python', level: 'Advanced',
        question: 'What does *args do in a function?',
        options: ['Accepts multiple positional arguments', 'Accepts keyword arguments', 'Returns multiple values', 'None'],
        answer: 'Accepts multiple positional arguments'),
      QuestionModel(id: '', language: 'Python', level: 'Advanced',
        question: 'What is a generator in Python?',
        options: ['A function using yield', 'A class', 'A list', 'A decorator'],
        answer: 'A function using yield'),
      QuestionModel(id: '', language: 'Python', level: 'Advanced',
        question: 'What is GIL in Python?',
        options: ['Global Interpreter Lock', 'General Input Loop', 'Global Input List', 'None'],
        answer: 'Global Interpreter Lock'),
      QuestionModel(id: '', language: 'Python', level: 'Advanced',
        question: 'What does __init__ do in a class?',
        options: ['Initializes object', 'Deletes object', 'Copies object', 'Prints object'],
        answer: 'Initializes object'),

      // ─── JAVA BEGINNER ───
      QuestionModel(id: '', language: 'Java', level: 'Beginner',
        question: 'How do you print in Java?',
        options: ['System.out.println()', 'print()', 'console.log()', 'echo()'],
        answer: 'System.out.println()'),
      QuestionModel(id: '', language: 'Java', level: 'Beginner',
        question: 'Which data type stores whole numbers in Java?',
        options: ['int', 'float', 'String', 'boolean'],
        answer: 'int'),
      QuestionModel(id: '', language: 'Java', level: 'Beginner',
        question: 'How do you declare a String in Java?',
        options: ['String name = "John"', 'str name = "John"', 'name = "John"', 'var name = "John"'],
        answer: 'String name = "John"'),
      QuestionModel(id: '', language: 'Java', level: 'Beginner',
        question: 'What ends every Java statement?',
        options: [';', '.', ',', ':'],
        answer: ';'),
      QuestionModel(id: '', language: 'Java', level: 'Beginner',
        question: 'Which keyword creates a class in Java?',
        options: ['class', 'Class', 'object', 'new'],
        answer: 'class'),

      // ─── JAVA INTERMEDIATE ───
      QuestionModel(id: '', language: 'Java', level: 'Intermediate',
        question: 'What is a constructor in Java?',
        options: ['A special method to initialize objects', 'A variable', 'A loop', 'A class'],
        answer: 'A special method to initialize objects'),
      QuestionModel(id: '', language: 'Java', level: 'Intermediate',
        question: 'What is inheritance in Java?',
        options: ['A class acquiring properties of another', 'A loop', 'A variable', 'A method'],
        answer: 'A class acquiring properties of another'),
      QuestionModel(id: '', language: 'Java', level: 'Intermediate',
        question: 'Which keyword is used for inheritance?',
        options: ['extends', 'implements', 'inherits', 'super'],
        answer: 'extends'),
      QuestionModel(id: '', language: 'Java', level: 'Intermediate',
        question: 'What is an interface in Java?',
        options: ['A blueprint with abstract methods', 'A class', 'A variable', 'A loop'],
        answer: 'A blueprint with abstract methods'),
      QuestionModel(id: '', language: 'Java', level: 'Intermediate',
        question: 'What does ArrayList store?',
        options: ['Dynamic list of objects', 'Fixed array', 'Only integers', 'Only strings'],
        answer: 'Dynamic list of objects'),

      // ─── JAVA ADVANCED ───
      QuestionModel(id: '', language: 'Java', level: 'Advanced',
        question: 'What is multithreading in Java?',
        options: ['Running multiple threads simultaneously', 'A loop', 'A class', 'A variable'],
        answer: 'Running multiple threads simultaneously'),
      QuestionModel(id: '', language: 'Java', level: 'Advanced',
        question: 'What is the purpose of synchronized keyword?',
        options: ['Prevent thread interference', 'Speed up code', 'Create threads', 'Delete threads'],
        answer: 'Prevent thread interference'),
      QuestionModel(id: '', language: 'Java', level: 'Advanced',
        question: 'What is a lambda expression in Java?',
        options: ['A short anonymous function', 'A class', 'A variable', 'A loop'],
        answer: 'A short anonymous function'),
      QuestionModel(id: '', language: 'Java', level: 'Advanced',
        question: 'What does JVM stand for?',
        options: ['Java Virtual Machine', 'Java Variable Method', 'Java Visual Mode', 'None'],
        answer: 'Java Virtual Machine'),
      QuestionModel(id: '', language: 'Java', level: 'Advanced',
        question: 'What is garbage collection in Java?',
        options: ['Automatic memory management', 'Deleting files', 'Clearing screen', 'None'],
        answer: 'Automatic memory management'),

      // ─── C BEGINNER ───
      QuestionModel(id: '', language: 'C', level: 'Beginner',
        question: 'How do you print in C?',
        options: ['printf()', 'print()', 'cout()', 'echo()'],
        answer: 'printf()'),
      QuestionModel(id: '', language: 'C', level: 'Beginner',
        question: 'Which header file is needed for printf?',
        options: ['#include <stdio.h>', '#include <math.h>', '#include <string.h>', '#include <stdlib.h>'],
        answer: '#include <stdio.h>'),
      QuestionModel(id: '', language: 'C', level: 'Beginner',
        question: 'How do you declare an integer in C?',
        options: ['int x = 5;', 'integer x = 5;', 'var x = 5;', 'x = 5;'],
        answer: 'int x = 5;'),
      QuestionModel(id: '', language: 'C', level: 'Beginner',
        question: 'What is %d used for in printf?',
        options: ['Print integer', 'Print float', 'Print string', 'Print char'],
        answer: 'Print integer'),
      QuestionModel(id: '', language: 'C', level: 'Beginner',
        question: 'How do you take input in C?',
        options: ['scanf()', 'input()', 'read()', 'get()'],
        answer: 'scanf()'),

      // ─── C INTERMEDIATE ───
      QuestionModel(id: '', language: 'C', level: 'Intermediate',
        question: 'What is a pointer in C?',
        options: ['A variable storing memory address', 'A function', 'A loop', 'An array'],
        answer: 'A variable storing memory address'),
      QuestionModel(id: '', language: 'C', level: 'Intermediate',
        question: 'What does malloc() do?',
        options: ['Allocates memory dynamically', 'Frees memory', 'Prints output', 'Reads input'],
        answer: 'Allocates memory dynamically'),
      QuestionModel(id: '', language: 'C', level: 'Intermediate',
        question: 'What is a struct in C?',
        options: ['A user-defined data type', 'A loop', 'A function', 'A pointer'],
        answer: 'A user-defined data type'),
      QuestionModel(id: '', language: 'C', level: 'Intermediate',
        question: 'What does & operator do in C?',
        options: ['Gets address of variable', 'Adds two numbers', 'Logical AND', 'Bitwise OR'],
        answer: 'Gets address of variable'),
      QuestionModel(id: '', language: 'C', level: 'Intermediate',
        question: 'What is recursion?',
        options: ['A function calling itself', 'A loop', 'A pointer', 'A struct'],
        answer: 'A function calling itself'),

      // ─── C ADVANCED ───
      QuestionModel(id: '', language: 'C', level: 'Advanced',
        question: 'What is a memory leak?',
        options: ['Allocated memory not freed', 'A bug in loop', 'A pointer error', 'None'],
        answer: 'Allocated memory not freed'),
      QuestionModel(id: '', language: 'C', level: 'Advanced',
        question: 'What does free() do in C?',
        options: ['Releases allocated memory', 'Allocates memory', 'Prints output', 'None'],
        answer: 'Releases allocated memory'),
      QuestionModel(id: '', language: 'C', level: 'Advanced',
        question: 'What is a function pointer?',
        options: ['A pointer pointing to a function', 'A function returning pointer', 'A struct', 'None'],
        answer: 'A pointer pointing to a function'),
      QuestionModel(id: '', language: 'C', level: 'Advanced',
        question: 'What is the difference between stack and heap?',
        options: ['Stack is static, heap is dynamic', 'Both are same', 'Heap is faster', 'None'],
        answer: 'Stack is static, heap is dynamic'),
      QuestionModel(id: '', language: 'C', level: 'Advanced',
        question: 'What does volatile keyword do in C?',
        options: ['Prevents compiler optimization', 'Speeds up code', 'Allocates memory', 'None'],
        answer: 'Prevents compiler optimization'),

      // ─── HTML BEGINNER ───
      QuestionModel(id: '', language: 'HTML', level: 'Beginner',
        question: 'What does HTML stand for?',
        options: ['HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'None'],
        answer: 'HyperText Markup Language'),
      QuestionModel(id: '', language: 'HTML', level: 'Beginner',
        question: 'Which tag creates a heading in HTML?',
        options: ['<h1>', '<head>', '<header>', '<title>'],
        answer: '<h1>'),
      QuestionModel(id: '', language: 'HTML', level: 'Beginner',
        question: 'Which tag creates a paragraph?',
        options: ['<p>', '<para>', '<text>', '<div>'],
        answer: '<p>'),
      QuestionModel(id: '', language: 'HTML', level: 'Beginner',
        question: 'How do you create a link in HTML?',
        options: ['<a href="url">text</a>', '<link>text</link>', '<url>text</url>', '<href>text</href>'],
        answer: '<a href="url">text</a>'),
      QuestionModel(id: '', language: 'HTML', level: 'Beginner',
        question: 'Which tag adds an image?',
        options: ['<img src="url">', '<image src="url">', '<pic src="url">', '<photo src="url">'],
        answer: '<img src="url">'),

      // ─── HTML INTERMEDIATE ───
      QuestionModel(id: '', language: 'HTML', level: 'Intermediate',
        question: 'What does CSS stand for?',
        options: ['Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'None'],
        answer: 'Cascading Style Sheets'),
      QuestionModel(id: '', language: 'HTML', level: 'Intermediate',
        question: 'How do you change text color in CSS?',
        options: ['color: red;', 'text-color: red;', 'font-color: red;', 'style: red;'],
        answer: 'color: red;'),
      QuestionModel(id: '', language: 'HTML', level: 'Intermediate',
        question: 'Which CSS property controls font size?',
        options: ['font-size', 'text-size', 'font', 'size'],
        answer: 'font-size'),
      QuestionModel(id: '', language: 'HTML', level: 'Intermediate',
        question: 'What is the CSS box model?',
        options: ['Content, padding, border, margin', 'Width and height only', 'Color and font', 'None'],
        answer: 'Content, padding, border, margin'),
      QuestionModel(id: '', language: 'HTML', level: 'Intermediate',
        question: 'How do you create a CSS class selector?',
        options: ['.classname', '#classname', 'classname', '*classname'],
        answer: '.classname'),

      // ─── HTML ADVANCED ───
      QuestionModel(id: '', language: 'HTML', level: 'Advanced',
        question: 'What is Flexbox in CSS?',
        options: ['A layout model for arranging elements', 'A font style', 'A color system', 'None'],
        answer: 'A layout model for arranging elements'),
      QuestionModel(id: '', language: 'HTML', level: 'Advanced',
        question: 'What is CSS Grid?',
        options: ['A 2D layout system', 'A 1D layout system', 'A font system', 'None'],
        answer: 'A 2D layout system'),
      QuestionModel(id: '', language: 'HTML', level: 'Advanced',
        question: 'What is a media query in CSS?',
        options: ['Applies styles based on screen size', 'Loads images', 'Plays videos', 'None'],
        answer: 'Applies styles based on screen size'),
      QuestionModel(id: '', language: 'HTML', level: 'Advanced',
        question: 'What does z-index do in CSS?',
        options: ['Controls stacking order of elements', 'Sets font size', 'Changes color', 'None'],
        answer: 'Controls stacking order of elements'),
      QuestionModel(id: '', language: 'HTML', level: 'Advanced',
        question: 'What is the difference between id and class in CSS?',
        options: ['id is unique, class can be reused', 'Both are same', 'class is unique', 'None'],
        answer: 'id is unique, class can be reused'),
    ];
  }
}
