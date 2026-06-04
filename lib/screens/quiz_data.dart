// quiz_data.dart — Question bank per language per level per topic
// Pure Dart — no Flutter imports needed here

// Structure: quizData[language][level][topic] = List of questions
const Map<String, Map<String, Map<String, List<Map<String, dynamic>>>>> quizData = {

  // ════════════════════════════════════════════════════════════════
  // PYTHON
  // ════════════════════════════════════════════════════════════════
  'Python': {

    'Beginner Level': {
      'Hello World': [
        {'q': 'How do you print "Hello" in Python?', 'options': ['print("Hello")', 'echo "Hello"', 'console.log("Hello")', 'printf("Hello")'], 'correct': 0},
        {'q': 'Does Python require semicolons?', 'options': ['No', 'Yes', 'Only sometimes', 'Only in loops'], 'correct': 0},
        {'q': 'What does print() do?', 'options': ['Displays output on screen', 'Reads user input', 'Saves to file', 'Deletes data'], 'correct': 0},
        {'q': 'Which is the correct Python syntax?', 'options': ['print("Hi")', 'Print("Hi")', 'PRINT("Hi")', 'println("Hi")'], 'correct': 0},
      ],
      'Variables': [
        {'q': 'How do you create a variable in Python?', 'options': ['name = "Ali"', 'var name = "Ali"', 'String name = "Ali"', 'let name = "Ali"'], 'correct': 0},
        {'q': 'Which is a valid Python variable name?', 'options': ['my_name', '123name', 'my-name', 'my name'], 'correct': 0},
        {'q': 'Does Python require type declaration?', 'options': ['No', 'Yes always', 'Only for int', 'Only for strings'], 'correct': 0},
        {'q': 'What does x = 5 do?', 'options': ['Assigns 5 to x', 'Compares x with 5', 'Calls function x', 'Prints 5'], 'correct': 0},
      ],
      'Data Types': [
        {'q': 'What is the type of "Hello"?', 'options': ['str', 'int', 'bool', 'list'], 'correct': 0},
        {'q': 'What is the type of 25?', 'options': ['int', 'str', 'float', 'bool'], 'correct': 0},
        {'q': 'What is the type of 3.14?', 'options': ['float', 'int', 'str', 'double'], 'correct': 0},
        {'q': 'What is the type of True?', 'options': ['bool', 'str', 'int', 'none'], 'correct': 0},
      ],
      'Input/Output': [
        {'q': 'How do you get user input in Python?', 'options': ['input()', 'scan()', 'read()', 'get()'], 'correct': 0},
        {'q': 'What type does input() always return?', 'options': ['str', 'int', 'float', 'bool'], 'correct': 0},
        {'q': 'How do you print a variable called name?', 'options': ['print(name)', 'print("name")', 'echo name', 'show(name)'], 'correct': 0},
        {'q': 'How to convert input to integer?', 'options': ['int(input())', 'input(int)', 'integer(input())', 'toInt(input())'], 'correct': 0},
      ],
      'Operators': [
        {'q': 'What is 10 % 3?', 'options': ['1', '3', '0', '10'], 'correct': 0},
        {'q': 'What is 2 ** 3?', 'options': ['8', '6', '9', '5'], 'correct': 0},
        {'q': 'What is 10 // 3?', 'options': ['3', '3.33', '1', '0'], 'correct': 0},
        {'q': 'Which operator checks equality?', 'options': ['==', '=', '!=', '=>'], 'correct': 0},
      ],
      'Conditions': [
        {'q': 'What does elif mean?', 'options': ['else if', 'end if', 'exit if', 'error if'], 'correct': 0},
        {'q': 'What runs when if condition is False?', 'options': ['else block', 'then block', 'when block', 'default block'], 'correct': 0},
        {'q': 'Is indentation required in Python?', 'options': ['Yes', 'No', 'Optional', 'Only in functions'], 'correct': 0},
        {'q': 'Which is correct if syntax in Python?', 'options': ['if x > 5:', 'if (x > 5)', 'if x > 5 then', 'if{x > 5}'], 'correct': 0},
      ],
      'For Loop': [
        {'q': 'What does range(5) produce?', 'options': ['0,1,2,3,4', '1,2,3,4,5', '0,1,2,3,4,5', '1,2,3,4'], 'correct': 0},
        {'q': 'How do you exit a loop early?', 'options': ['break', 'exit', 'stop', 'end'], 'correct': 0},
        {'q': 'How do you skip the current iteration?', 'options': ['continue', 'skip', 'pass', 'next'], 'correct': 0},
        {'q': 'How many times does for i in range(3) run?', 'options': ['3', '4', '2', '0'], 'correct': 0},
      ],
      'While Loop': [
        {'q': 'What does while True: create?', 'options': ['Infinite loop', 'Runs once', 'Error', 'Nothing'], 'correct': 0},
        {'q': 'What stops a while loop?', 'options': ['break or False condition', 'continue', 'pass', 'return'], 'correct': 0},
        {'q': 'What does i += 1 mean?', 'options': ['i = i + 1', 'i = 1', 'i + 1', 'i = i - 1'], 'correct': 0},
        {'q': 'Which is correct while loop syntax?', 'options': ['while i < 5:', 'while (i < 5)', 'while i < 5 do', 'loop i < 5:'], 'correct': 0},
      ],
      'Lists': [
        {'q': 'How do you access the first item in a list?', 'options': ['list[0]', 'list[1]', 'list.first()', 'list(0)'], 'correct': 0},
        {'q': 'How do you add an item to a list?', 'options': ['list.append(x)', 'list.add(x)', 'list.push(x)', 'list.insert(x)'], 'correct': 0},
        {'q': 'How do you get the length of a list?', 'options': ['len(list)', 'list.length', 'list.size()', 'count(list)'], 'correct': 0},
        {'q': 'Which brackets create a list in Python?', 'options': ['[ ]', '{ }', '( )', '< >'], 'correct': 0},
      ],
      'Functions': [
        {'q': 'How do you define a function in Python?', 'options': ['def myFunc():', 'function myFunc()', 'func myFunc()', 'void myFunc()'], 'correct': 0},
        {'q': 'How do you return a value from a function?', 'options': ['return value', 'send value', 'give value', 'output value'], 'correct': 0},
        {'q': 'How do you call a function named greet?', 'options': ['greet()', 'call greet()', 'run greet()', 'start greet()'], 'correct': 0},
        {'q': 'Where do function parameters go?', 'options': ['Inside parentheses ()', 'Inside brackets []', 'Inside braces {}', 'After colon :'], 'correct': 0},
      ],
    },

    'Intermediate Level': {
      'String Methods': [
        {'q': 'What does "hello".upper() return?', 'options': ['HELLO', 'Hello', 'hello', 'hELLO'], 'correct': 0},
        {'q': 'What does "  hi  ".strip() return?', 'options': ['hi', '  hi  ', 'hi  ', '  hi'], 'correct': 0},
        {'q': 'Which method splits a string into a list?', 'options': ['split()', 'divide()', 'cut()', 'break()'], 'correct': 0},
        {'q': 'What does "hello".replace("l","r") return?', 'options': ['herro', 'hello', 'hellr', 'hrllo'], 'correct': 0},
      ],
      'Dictionaries': [
        {'q': 'How do you create a dictionary?', 'options': ['{"key": "value"}', '["key", "value"]', '("key", "value")', '<key: value>'], 'correct': 0},
        {'q': 'How do you access a value in a dict?', 'options': ['dict["key"]', 'dict.key', 'dict(key)', 'dict->key'], 'correct': 0},
        {'q': 'How do you add a new key-value pair?', 'options': ['dict["new"] = val', 'dict.add("new", val)', 'dict.insert("new", val)', 'dict.put("new", val)'], 'correct': 0},
        {'q': 'Which method returns all keys of a dict?', 'options': ['dict.keys()', 'dict.all()', 'dict.items()', 'dict.list()'], 'correct': 0},
      ],
      'Tuples & Sets': [
        {'q': 'How do you create a tuple?', 'options': ['(1, 2, 3)', '[1, 2, 3]', '{1, 2, 3}', '<1, 2, 3>'], 'correct': 0},
        {'q': 'Are tuples mutable in Python?', 'options': ['No', 'Yes', 'Only numbers', 'Only strings'], 'correct': 0},
        {'q': 'What does a set NOT allow?', 'options': ['Duplicate values', 'Mixed types', 'Iteration', 'Membership check'], 'correct': 0},
        {'q': 'How do you create a set?', 'options': ['{1, 2, 3}', '(1, 2, 3)', '[1, 2, 3]', 'set[1, 2, 3]'], 'correct': 0},
      ],
      'File Handling': [
        {'q': 'How do you open a file for reading?', 'options': ['open("f.txt","r")', 'open("f.txt")', 'read("f.txt")', 'file("f.txt")'], 'correct': 0},
        {'q': 'Which mode opens file for writing?', 'options': ['"w"', '"r"', '"x"', '"a"'], 'correct': 0},
        {'q': 'What does "with open(...) as f" ensure?', 'options': ['File is closed automatically', 'File is read only', 'File is deleted after', 'File is copied'], 'correct': 0},
        {'q': 'Which method reads all lines into a list?', 'options': ['readlines()', 'readline()', 'read()', 'getlines()'], 'correct': 0},
      ],
      'Exception Handling': [
        {'q': 'Which block catches exceptions in Python?', 'options': ['except', 'catch', 'error', 'handle'], 'correct': 0},
        {'q': 'What does the finally block do?', 'options': ['Always executes', 'Only on error', 'Only on success', 'Exits program'], 'correct': 0},
        {'q': 'How do you raise an exception manually?', 'options': ['raise ValueError("msg")', 'throw ValueError("msg")', 'error ValueError("msg")', 'except ValueError("msg")'], 'correct': 0},
        {'q': 'What is try-except used for?', 'options': ['Error handling', 'Looping', 'File reading', 'Defining classes'], 'correct': 0},
      ],
      'Classes & Objects': [
        {'q': 'How do you define a class in Python?', 'options': ['class MyClass:', 'Class MyClass:', 'def MyClass:', 'object MyClass:'], 'correct': 0},
        {'q': 'What is __init__ used for?', 'options': ['Initialize object', 'Delete object', 'Copy object', 'Compare objects'], 'correct': 0},
        {'q': 'How do you create an object of class Car?', 'options': ['Car()', 'new Car()', 'create Car()', 'Car.new()'], 'correct': 0},
        {'q': 'What is self in Python class methods?', 'options': ['Reference to current object', 'Class name', 'Module name', 'Return value'], 'correct': 0},
      ],
      'Inheritance': [
        {'q': 'How do you inherit from a parent class?', 'options': ['class Child(Parent):', 'class Child extends Parent:', 'class Child inherits Parent:', 'class Child : Parent:'], 'correct': 0},
        {'q': 'What does super() do?', 'options': ['Calls parent class method', 'Creates new class', 'Deletes parent', 'Overrides method'], 'correct': 0},
        {'q': 'Can a Python class inherit from multiple classes?', 'options': ['Yes', 'No', 'Only 2', 'Only interfaces'], 'correct': 0},
        {'q': 'What is method overriding?', 'options': ['Redefining parent method in child', 'Calling parent method', 'Deleting parent method', 'Hiding a variable'], 'correct': 0},
      ],
      'Modules': [
        {'q': 'How do you import a module?', 'options': ['import math', 'include math', 'use math', 'require math'], 'correct': 0},
        {'q': 'How do you import only sqrt from math?', 'options': ['from math import sqrt', 'import math.sqrt', 'import sqrt from math', 'use math.sqrt'], 'correct': 0},
        {'q': 'What does import os provide?', 'options': ['OS-level functions', 'Math functions', 'String functions', 'Network functions'], 'correct': 0},
        {'q': 'What is a Python package?', 'options': ['Directory with __init__.py', 'Single .py file', 'A class', 'A function'], 'correct': 0},
      ],
    },

    'Advanced Level': {
      'Decorators': [
        {'q': 'What is a decorator in Python?', 'options': ['Function that modifies another function', 'Class attribute', 'Loop construct', 'Error handler'], 'correct': 0},
        {'q': 'How do you apply a decorator?', 'options': ['@decorator_name above function', 'decorator(func)', 'apply decorator', 'use decorator'], 'correct': 0},
        {'q': 'What does @staticmethod do?', 'options': ['Defines method without self', 'Defines class method', 'Hides method', 'Caches result'], 'correct': 0},
        {'q': 'What does functools.wraps do in a decorator?', 'options': ['Preserves original function metadata', 'Wraps return value', 'Copies function', 'Logs function calls'], 'correct': 0},
      ],
      'Generators': [
        {'q': 'What keyword makes a function a generator?', 'options': ['yield', 'return', 'generate', 'produce'], 'correct': 0},
        {'q': 'What does next() do on a generator?', 'options': ['Gets next value', 'Restarts generator', 'Closes generator', 'Counts items'], 'correct': 0},
        {'q': 'What is a generator expression?', 'options': ['(x for x in range(n))', '[x for x in range(n)]', '{x for x in range(n)}', 'gen(x for x in range(n))'], 'correct': 0},
        {'q': 'Why use generators over lists?', 'options': ['Memory efficient for large data', 'Faster for small data', 'Easier syntax', 'Better for sorting'], 'correct': 0},
      ],
      'Lambda Functions': [
        {'q': 'What is a lambda function?', 'options': ['Anonymous single-expression function', 'Named function', 'Class method', 'Module function'], 'correct': 0},
        {'q': 'Correct lambda syntax?', 'options': ['lambda x: x*2', 'lambda(x): x*2', 'def lambda x: x*2', 'func lambda x: x*2'], 'correct': 0},
        {'q': 'Which function uses lambda for sorting?', 'options': ['sorted(list, key=lambda x: x[1])', 'sort(list, lambda x)', 'order(list, key=lambda)', 'arrange(list, lambda x: x)'], 'correct': 0},
        {'q': 'Can lambda have multiple statements?', 'options': ['No', 'Yes', 'Only 2', 'Only with if'], 'correct': 0},
      ],
      'List Comprehension': [
        {'q': 'What is list comprehension?', 'options': ['Compact way to create lists', 'List sorting method', 'List deletion method', 'List copying method'], 'correct': 0},
        {'q': 'Which creates list of squares 0-4?', 'options': ['[x**2 for x in range(5)]', '[x**2 in range(5)]', '{x**2 for x in range(5)}', '(x**2 for x in range(5))'], 'correct': 0},
        {'q': 'How to filter even numbers from list using comprehension?', 'options': ['[x for x in lst if x%2==0]', '[x if x%2==0 in lst]', '[filter(x%2==0, lst)]', '[x%2==0 for x in lst]'], 'correct': 0},
        {'q': 'What is a dict comprehension?', 'options': ['{k: v for k,v in pairs}', '[k: v for k,v in pairs]', '(k: v for k,v in pairs)', 'dict(k,v for k,v in pairs)'], 'correct': 0},
      ],
      'Regex': [
        {'q': 'Which module handles regex in Python?', 'options': ['re', 'regex', 'match', 'pattern'], 'correct': 0},
        {'q': 'What does re.match() check?', 'options': ['Match at beginning of string', 'Match anywhere in string', 'Match at end of string', 'Match whole string'], 'correct': 0},
        {'q': 'What pattern matches any digit?', 'options': ['\\d', '\\w', '\\s', '\\a'], 'correct': 0},
        {'q': 'What does re.findall() return?', 'options': ['List of all matches', 'First match only', 'Boolean', 'Match object'], 'correct': 0},
      ],
      'Multithreading': [
        {'q': 'Which module handles threads in Python?', 'options': ['threading', 'multithread', 'concurrent', 'parallel'], 'correct': 0},
        {'q': 'What is the GIL in Python?', 'options': ['Global Interpreter Lock', 'Global Import Library', 'General Interface Layer', 'Global Instance Lock'], 'correct': 0},
        {'q': 'How do you start a thread?', 'options': ['thread.start()', 'thread.run()', 'thread.begin()', 'thread.execute()'], 'correct': 0},
        {'q': 'What does thread.join() do?', 'options': ['Waits for thread to finish', 'Starts thread', 'Kills thread', 'Pauses thread'], 'correct': 0},
      ],
    },
  },

  // ════════════════════════════════════════════════════════════════
  // JAVA
  // ════════════════════════════════════════════════════════════════
  'Java': {

    'Beginner Level': {
      'Hello World': [
        {'q': 'What is the Java print statement?', 'options': ['System.out.println()', 'print()', 'console.log()', 'echo()'], 'correct': 0},
        {'q': 'What is the entry point of a Java program?', 'options': ['main()', 'start()', 'run()', 'init()'], 'correct': 0},
        {'q': 'Every Java statement ends with?', 'options': [';', '.', ',', ':'], 'correct': 0},
        {'q': 'What does println add after output?', 'options': ['Newline', 'Space', 'Tab', 'Nothing'], 'correct': 0},
      ],
      'Variables': [
        {'q': 'How do you declare an int variable?', 'options': ['int age = 20;', 'age = 20', 'var age = 20', 'let age = 20'], 'correct': 0},
        {'q': 'Which type stores decimal numbers?', 'options': ['double', 'int', 'String', 'char'], 'correct': 0},
        {'q': 'Which type stores text in Java?', 'options': ['String', 'str', 'text', 'char'], 'correct': 0},
        {'q': 'Which type stores whole numbers?', 'options': ['int', 'float', 'double', 'long'], 'correct': 0},
      ],
      'Data Types': [
        {'q': 'Which Java type is NOT primitive?', 'options': ['String', 'int', 'boolean', 'char'], 'correct': 0},
        {'q': 'What does boolean hold?', 'options': ['true or false', '0 or 1', 'yes or no', 'on or off'], 'correct': 0},
        {'q': 'What does char hold?', 'options': ['Single character', 'Multiple chars', 'Integer', 'Boolean'], 'correct': 0},
        {'q': 'double has more precision than float?', 'options': ['Yes', 'No', 'Same', 'Depends'], 'correct': 0},
      ],
      'Operators': [
        {'q': 'What does a++ mean?', 'options': ['a = a + 1', 'a + 1', 'a = 1', 'a * a'], 'correct': 0},
        {'q': 'Logical AND operator in Java?', 'options': ['&&', '&', 'AND', 'and'], 'correct': 0},
        {'q': 'Not equal operator in Java?', 'options': ['!=', '<>', 'NOT=', '=/='], 'correct': 0},
        {'q': 'What does a += 5 mean?', 'options': ['a = a + 5', 'a + 5', 'a = 5', 'a = a * 5'], 'correct': 0},
      ],
      'Conditions': [
        {'q': 'Correct Java if syntax?', 'options': ['if (x > 5) {}', 'if x > 5:', 'if x > 5 then', 'if[x > 5]'], 'correct': 0},
        {'q': 'What is else if written as in Java?', 'options': ['else if', 'elif', 'elseif', 'otherwise'], 'correct': 0},
        {'q': 'Condition must be enclosed in?', 'options': ['parentheses ()', 'brackets []', 'braces {}', 'quotes ""'], 'correct': 0},
        {'q': 'Code blocks are enclosed in?', 'options': ['braces {}', 'parentheses ()', 'brackets []', 'indentation'], 'correct': 0},
      ],
      'For Loop': [
        {'q': 'Correct Java for loop syntax?', 'options': ['for(int i=0;i<5;i++)', 'for i in range(5)', 'for(i=0 to 5)', 'loop 5 times'], 'correct': 0},
        {'q': 'Correct for-each syntax?', 'options': ['for(int n : nums)', 'for n in nums', 'foreach(n in nums)', 'for each n nums'], 'correct': 0},
        {'q': 'What does i++ do in a for loop?', 'options': ['Increases i by 1', 'Decreases i', 'Resets i', 'Stops loop'], 'correct': 0},
        {'q': 'What does break do in a loop?', 'options': ['Exits the loop', 'Skips iteration', 'Continues loop', 'Restarts loop'], 'correct': 0},
      ],
      'While Loop': [
        {'q': 'Correct Java while syntax?', 'options': ['while(i < 5)', 'while i < 5:', 'while(i < 5):', 'while i < 5'], 'correct': 0},
        {'q': 'do-while loop runs at least how many times?', 'options': ['Once', 'Twice', 'Zero', 'Five'], 'correct': 0},
        {'q': 'Difference between while and do-while?', 'options': ['do-while checks condition after', 'while checks after', 'Same', 'do-while is faster'], 'correct': 0},
        {'q': 'How to create infinite loop in Java?', 'options': ['while(true)', 'while(1)', 'loop()', 'forever()'], 'correct': 0},
      ],
      'Arrays': [
        {'q': 'How do you declare an int array?', 'options': ['int[] arr = new int[5]', 'array int[5]', 'int arr(5)', 'new array[5]'], 'correct': 0},
        {'q': 'What is the index of the first element?', 'options': ['0', '1', '-1', '2'], 'correct': 0},
        {'q': 'How do you get the array size?', 'options': ['arr.length', 'arr.size()', 'len(arr)', 'arr.count'], 'correct': 0},
        {'q': 'Java array size is?', 'options': ['Fixed', 'Dynamic', 'Unlimited', 'Zero'], 'correct': 0},
      ],
      'Methods': [
        {'q': 'What does void return type mean?', 'options': ['No return value', 'Returns int', 'Returns String', 'Returns null'], 'correct': 0},
        {'q': 'How do you call a method on an object?', 'options': ['object.method()', 'call method()', 'run method()', 'method.call()'], 'correct': 0},
        {'q': 'What does the return keyword do?', 'options': ['Sends value back to caller', 'Prints value', 'Stores value', 'Deletes value'], 'correct': 0},
        {'q': 'A static method can be called?', 'options': ['Without an object', 'Only with object', 'Only in main', 'Never'], 'correct': 0},
      ],
      'Scanner Input': [
        {'q': 'What import is needed for Scanner?', 'options': ['import java.util.Scanner', 'import Scanner', 'include Scanner', 'use Scanner'], 'correct': 0},
        {'q': 'How do you read a String with Scanner?', 'options': ['sc.nextLine()', 'sc.nextString()', 'sc.getString()', 'sc.readLine()'], 'correct': 0},
        {'q': 'How do you read an int with Scanner?', 'options': ['sc.nextInt()', 'sc.getInt()', 'sc.readInt()', 'sc.parseInt()'], 'correct': 0},
        {'q': 'Scanner sc = new Scanner(?) — what goes in?', 'options': ['System.in', 'System.out', 'File', 'Network'], 'correct': 0},
      ],
    },

    'Intermediate Level': {
      'Classes & Objects': [
        {'q': 'What is a class in Java?', 'options': ['Blueprint for objects', 'A variable', 'A loop', 'A function'], 'correct': 0},
        {'q': 'How do you create an object of class Car?', 'options': ['Car c = new Car()', 'Car c = Car()', 'new Car c', 'create Car c'], 'correct': 0},
        {'q': 'What is encapsulation?', 'options': ['Hiding data with private fields', 'Inheriting from parent', 'Using interfaces', 'Overloading methods'], 'correct': 0},
        {'q': 'What is the access modifier for class-only access?', 'options': ['private', 'public', 'protected', 'default'], 'correct': 0},
      ],
      'Constructors': [
        {'q': 'What is a constructor?', 'options': ['Special method to initialize object', 'Method that returns value', 'Static method', 'Abstract method'], 'correct': 0},
        {'q': 'Constructor name must match?', 'options': ['Class name', 'Method name', 'Variable name', 'Package name'], 'correct': 0},
        {'q': 'Can a class have multiple constructors?', 'options': ['Yes (overloading)', 'No', 'Only 2', 'Only default'], 'correct': 0},
        {'q': 'What is a default constructor?', 'options': ['Constructor with no parameters', 'Constructor with all parameters', 'Private constructor', 'Static constructor'], 'correct': 0},
      ],
      'Inheritance': [
        {'q': 'Which keyword is used for inheritance?', 'options': ['extends', 'implements', 'inherits', 'super'], 'correct': 0},
        {'q': 'What does super() call?', 'options': ['Parent class constructor', 'Child class constructor', 'Static method', 'Interface method'], 'correct': 0},
        {'q': 'Java supports how many levels of inheritance?', 'options': ['Multiple levels (not multiple base)', 'Only one', 'Only two', 'Unlimited multiple'], 'correct': 0},
        {'q': 'What is method overriding?', 'options': ['Redefining parent method in child class', 'Calling parent method', 'Creating new method', 'Static method'], 'correct': 0},
      ],
      'Interfaces': [
        {'q': 'How do you implement an interface?', 'options': ['implements', 'extends', 'uses', 'inherits'], 'correct': 0},
        {'q': 'Can an interface have method bodies in Java 8+?', 'options': ['Yes (default methods)', 'No never', 'Only static', 'Only abstract'], 'correct': 0},
        {'q': 'A class can implement how many interfaces?', 'options': ['Multiple', 'Only one', 'Only two', 'Zero'], 'correct': 0},
        {'q': 'Interface variables are implicitly?', 'options': ['public static final', 'private', 'protected', 'default'], 'correct': 0},
      ],
      'Exception Handling': [
        {'q': 'What keyword catches exceptions in Java?', 'options': ['catch', 'except', 'handle', 'error'], 'correct': 0},
        {'q': 'What does finally block guarantee?', 'options': ['Always executes', 'Only on error', 'Only on success', 'Never executes'], 'correct': 0},
        {'q': 'How do you throw an exception?', 'options': ['throw new Exception()', 'raise Exception()', 'error new Exception()', 'except new Exception()'], 'correct': 0},
        {'q': 'What is a checked exception?', 'options': ['Must be caught or declared', 'Runtime only', 'Never caught', 'Compile-time ignored'], 'correct': 0},
      ],
      'ArrayList': [
        {'q': 'How do you create an ArrayList?', 'options': ['ArrayList<String> list = new ArrayList<>()', 'ArrayList list = []', 'new ArrayList String', 'List<String> = ArrayList'], 'correct': 0},
        {'q': 'How do you add to ArrayList?', 'options': ['list.add(item)', 'list.append(item)', 'list.push(item)', 'list.insert(item)'], 'correct': 0},
        {'q': 'How do you get ArrayList size?', 'options': ['list.size()', 'list.length', 'list.count()', 'len(list)'], 'correct': 0},
        {'q': 'ArrayList vs Array — key difference?', 'options': ['ArrayList is dynamic size', 'Array is dynamic', 'Both same size', 'ArrayList is faster'], 'correct': 0},
      ],
      'HashMap': [
        {'q': 'How do you create a HashMap?', 'options': ['HashMap<K,V> map = new HashMap<>()', 'Map map = new Map()', 'HashMap map = {}', 'new HashMap map'], 'correct': 0},
        {'q': 'How do you add to HashMap?', 'options': ['map.put(key, value)', 'map.add(key, value)', 'map.set(key, value)', 'map.insert(key, value)'], 'correct': 0},
        {'q': 'How do you get a value from HashMap?', 'options': ['map.get(key)', 'map[key]', 'map.value(key)', 'map.fetch(key)'], 'correct': 0},
        {'q': 'HashMap keys must be?', 'options': ['Unique', 'Sorted', 'Integers only', 'Strings only'], 'correct': 0},
      ],
      'String Methods': [
        {'q': 'How do you get string length in Java?', 'options': ['str.length()', 'str.size()', 'str.count()', 'len(str)'], 'correct': 0},
        {'q': 'How do you convert String to uppercase?', 'options': ['str.toUpperCase()', 'str.upper()', 'str.uppercase()', 'str.UP()'], 'correct': 0},
        {'q': 'How do you check if string contains a substring?', 'options': ['str.contains("sub")', 'str.has("sub")', 'str.includes("sub")', 'str.find("sub")'], 'correct': 0},
        {'q': 'How do you compare two strings in Java?', 'options': ['str1.equals(str2)', 'str1 == str2', 'str1.compare(str2)', 'str1.same(str2)'], 'correct': 0},
      ],
    },

    'Advanced Level': {
      'Generics': [
        {'q': 'What is the purpose of generics?', 'options': ['Type-safe code reuse', 'Faster execution', 'Memory saving', 'Thread safety'], 'correct': 0},
        {'q': 'What does <T> represent in generics?', 'options': ['Type parameter', 'Template class', 'Thread', 'Tuple'], 'correct': 0},
        {'q': 'What is a bounded type parameter?', 'options': ['<T extends Number>', '<T>', '<T super String>', 'Both A and C'], 'correct': 3},
        {'q': 'Can you use primitives as generic type arguments?', 'options': ['No, use wrappers', 'Yes always', 'Only int', 'Only double'], 'correct': 0},
      ],
      'Streams & Lambda': [
        {'q': 'How do you create a stream from a list?', 'options': ['list.stream()', 'Stream.of(list)', 'list.toStream()', 'stream(list)'], 'correct': 0},
        {'q': 'Which operation filters a stream?', 'options': ['filter()', 'select()', 'where()', 'find()'], 'correct': 0},
        {'q': 'Which terminal operation collects stream to list?', 'options': ['collect(Collectors.toList())', 'toList()', 'asList()', 'gather()'], 'correct': 0},
        {'q': 'What does map() do on a stream?', 'options': ['Transforms each element', 'Filters elements', 'Sorts elements', 'Counts elements'], 'correct': 0},
      ],
      'Multithreading': [
        {'q': 'How do you create a thread in Java?', 'options': ['extends Thread or implements Runnable', 'import Thread', 'new Process()', 'use goroutine'], 'correct': 0},
        {'q': 'What does synchronized keyword do?', 'options': ['Prevents concurrent access', 'Speeds up thread', 'Creates new thread', 'Kills thread'], 'correct': 0},
        {'q': 'What is a deadlock?', 'options': ['Threads waiting for each other indefinitely', 'Thread running forever', 'Thread crash', 'Thread priority issue'], 'correct': 0},
        {'q': 'What is the thread lifecycle order?', 'options': ['New→Runnable→Running→Dead', 'Running→New→Dead', 'New→Dead→Running', 'Running→Runnable→New'], 'correct': 0},
      ],
      'File I/O': [
        {'q': 'Which class writes text to a file in Java?', 'options': ['FileWriter', 'FileReader', 'FileStream', 'FileBuffer'], 'correct': 0},
        {'q': 'Which class reads text from a file?', 'options': ['BufferedReader', 'FileWriter', 'InputFile', 'ReadFile'], 'correct': 0},
        {'q': 'What is the NIO package used for?', 'options': ['Modern, non-blocking I/O', 'Old I/O', 'Network only', 'Database access'], 'correct': 0},
        {'q': 'How do you check if a file exists?', 'options': ['file.exists()', 'file.check()', 'file.isPresent()', 'file.found()'], 'correct': 0},
      ],
      'JDBC': [
        {'q': 'What does JDBC stand for?', 'options': ['Java Database Connectivity', 'Java Data Bridge Connection', 'Java Direct Base Connection', 'Java Database Component'], 'correct': 0},
        {'q': 'Which method executes a SQL SELECT query?', 'options': ['executeQuery()', 'executeUpdate()', 'execute()', 'runQuery()'], 'correct': 0},
        {'q': 'What is a PreparedStatement used for?', 'options': ['Parameterized SQL to prevent injection', 'Faster queries', 'Stored procedures only', 'DDL statements'], 'correct': 0},
        {'q': 'Which JDBC object holds query results?', 'options': ['ResultSet', 'QueryResult', 'DataSet', 'RecordSet'], 'correct': 0},
      ],
    },
  },

  // ════════════════════════════════════════════════════════════════
  // C LANGUAGE
  // ════════════════════════════════════════════════════════════════
  'C Language': {

    'Beginner Level': {
      'Hello World': [
        {'q': 'Which function prints output in C?', 'options': ['printf()', 'print()', 'cout()', 'echo()'], 'correct': 0},
        {'q': 'Which header is required for printf?', 'options': ['#include <stdio.h>', '#include <iostream>', '#include <print.h>', 'no header needed'], 'correct': 0},
        {'q': 'What is the entry point of a C program?', 'options': ['main()', 'start()', 'begin()', 'run()'], 'correct': 0},
        {'q': 'What does \\n represent in C?', 'options': ['Newline', 'Tab', 'Carriage return', 'Null'], 'correct': 0},
      ],
      'Variables': [
        {'q': 'How do you declare an integer variable in C?', 'options': ['int x = 5;', 'var x = 5;', 'x = 5;', 'integer x = 5;'], 'correct': 0},
        {'q': 'Which type stores decimal numbers in C?', 'options': ['float', 'int', 'char', 'decimal'], 'correct': 0},
        {'q': 'Which type stores a single character?', 'options': ['char', 'string', 'text', 'letter'], 'correct': 0},
        {'q': 'Does C require type declaration for variables?', 'options': ['Yes always', 'No', 'Optional', 'Only for int'], 'correct': 0},
      ],
      'Data Types': [
        {'q': 'Format specifier for int in printf?', 'options': ['%d', '%f', '%c', '%s'], 'correct': 0},
        {'q': 'Format specifier for float in printf?', 'options': ['%f', '%d', '%c', '%s'], 'correct': 0},
        {'q': 'Format specifier for string in printf?', 'options': ['%s', '%d', '%f', '%c'], 'correct': 0},
        {'q': 'Which has more precision: double or float?', 'options': ['double', 'float', 'Same', 'Depends on compiler'], 'correct': 0},
      ],
      'Input/Output': [
        {'q': 'How do you read an integer with scanf?', 'options': ['scanf("%d", &x)', 'scanf("%d", x)', 'input("%d", x)', 'read(x)'], 'correct': 0},
        {'q': 'What does & mean in scanf?', 'options': ['Address of variable', 'Value of variable', 'AND operator', 'Bitwise operator'], 'correct': 0},
        {'q': 'What does printf output to?', 'options': ['Standard output (screen)', 'File', 'Memory', 'Network'], 'correct': 0},
        {'q': 'What does %d in printf represent?', 'options': ['Integer', 'Float', 'String', 'Character'], 'correct': 0},
      ],
      'Operators': [
        {'q': 'What is the remainder operator in C?', 'options': ['%', '/', '//', '**'], 'correct': 0},
        {'q': 'What does a++ do?', 'options': ['Increments a by 1', 'a + 1 without saving', 'Sets a to 1', 'Multiplies a'], 'correct': 0},
        {'q': 'How do you check equality in C?', 'options': ['==', '=', '!=', '==='], 'correct': 0},
        {'q': 'Logical AND operator in C?', 'options': ['&&', '&', 'AND', 'and'], 'correct': 0},
      ],
      'Conditions': [
        {'q': 'Correct if syntax in C?', 'options': ['if (x > 5) {}', 'if x > 5:', 'if x > 5 then', 'if[x > 5]'], 'correct': 0},
        {'q': 'What is else if written as in C?', 'options': ['else if', 'elif', 'elseif', 'otherwise'], 'correct': 0},
        {'q': 'What is switch-case used for?', 'options': ['Multiple condition checks', 'Loops', 'Functions', 'Arrays'], 'correct': 0},
        {'q': 'What does break do in switch-case?', 'options': ['Exits the matched case', 'Continues to next case', 'Restarts switch', 'Nothing'], 'correct': 0},
      ],
      'For Loop': [
        {'q': 'Correct for loop syntax in C?', 'options': ['for(int i=0;i<5;i++)', 'for i in range(5)', 'for(i=0 to 5)', 'loop 5 times'], 'correct': 0},
        {'q': 'What does i++ do in a for loop?', 'options': ['Increases i by 1', 'Decreases i', 'Resets i', 'Stops loop'], 'correct': 0},
        {'q': 'What does the break statement do in a loop?', 'options': ['Exits the loop', 'Skips iteration', 'Restarts loop', 'Nothing'], 'correct': 0},
        {'q': 'What does continue do in a loop?', 'options': ['Skips to next iteration', 'Exits loop', 'Restarts loop', 'Stops program'], 'correct': 0},
      ],
      'While Loop': [
        {'q': 'Correct while syntax in C?', 'options': ['while(i < 5)', 'while i < 5:', 'while i < 5 do', 'loop(i < 5)'], 'correct': 0},
        {'q': 'When does do-while check its condition?', 'options': ['After execution', 'Before execution', 'During execution', 'Never'], 'correct': 0},
        {'q': 'How to write an infinite loop in C?', 'options': ['while(1)', 'while(true)', 'loop()', 'forever()'], 'correct': 0},
        {'q': 'What must you always do to the loop variable?', 'options': ['Update it in the loop', 'Keep it static', 'Make it global', 'Make it constant'], 'correct': 0},
      ],
      'Arrays': [
        {'q': 'How do you declare an int array of size 5?', 'options': ['int arr[5]', 'array int[5]', 'int arr(5)', 'new int[5]'], 'correct': 0},
        {'q': 'What is the index of the first element?', 'options': ['0', '1', '-1', '2'], 'correct': 0},
        {'q': 'How do you access element at index 2?', 'options': ['arr[2]', 'arr(2)', 'arr{2}', 'arr.2'], 'correct': 0},
        {'q': 'Can C array size change after declaration?', 'options': ['No, it is fixed', 'Yes always', 'Using realloc only', 'Using malloc only'], 'correct': 0},
      ],
      'Functions': [
        {'q': 'What does void as return type mean?', 'options': ['Function returns nothing', 'Returns int', 'Returns string', 'Returns bool'], 'correct': 0},
        {'q': 'Where must functions be declared in C?', 'options': ['Before use or use a prototype', 'After use', 'Anywhere', 'Only in header files'], 'correct': 0},
        {'q': 'What does return statement do?', 'options': ['Sends value back to caller', 'Prints value', 'Stores value', 'Deletes value'], 'correct': 0},
        {'q': 'What does main() return on success?', 'options': ['0', '1', '-1', 'void'], 'correct': 0},
      ],
    },

    'Intermediate Level': {
      'Pointers': [
        {'q': 'What does & operator give?', 'options': ['Address of variable', 'Value of variable', 'AND result', 'Nothing'], 'correct': 0},
        {'q': 'What does * in int *ptr mean?', 'options': ['Pointer variable', 'Multiply', 'Value only', 'Nothing'], 'correct': 0},
        {'q': 'What does *ptr give?', 'options': ['Value at address ptr points to', 'Address of ptr', 'Size of ptr', 'Error'], 'correct': 0},
        {'q': 'What is a NULL pointer?', 'options': ['Pointer pointing to nothing', 'Pointer to zero', 'Uninitialized pointer', 'Invalid pointer'], 'correct': 0},
      ],
      'Strings': [
        {'q': 'How are strings stored in C?', 'options': ['char array ending with \\0', 'String object', 'Linked list', 'Integer array'], 'correct': 0},
        {'q': 'Which function gets string length in C?', 'options': ['strlen()', 'length()', 'size()', 'count()'], 'correct': 0},
        {'q': 'Which function copies a string in C?', 'options': ['strcpy()', 'copy()', 'strdup()', 'memcpy()'], 'correct': 0},
        {'q': 'Which header is needed for string functions?', 'options': ['<string.h>', '<stdio.h>', '<str.h>', '<strings.h>'], 'correct': 0},
      ],
      'Structures': [
        {'q': 'How do you define a structure in C?', 'options': ['struct MyStruct { };', 'class MyStruct { };', 'object MyStruct { };', 'type MyStruct { };'], 'correct': 0},
        {'q': 'How do you access struct member?', 'options': ['struct.member', 'struct->member', 'struct[member]', 'struct(member)'], 'correct': 0},
        {'q': 'How do you access struct member via pointer?', 'options': ['ptr->member', 'ptr.member', 'ptr[member]', '*ptr.member'], 'correct': 0},
        {'q': 'What is typedef used for with structs?', 'options': ['Create alias for struct type', 'Inherit struct', 'Copy struct', 'Delete struct'], 'correct': 0},
      ],
      'File Handling': [
        {'q': 'Which function opens a file in C?', 'options': ['fopen()', 'open()', 'file()', 'read()'], 'correct': 0},
        {'q': 'Which function writes to a file in C?', 'options': ['fprintf()', 'fwrite()', 'Both A and B', 'fprint()'], 'correct': 2},
        {'q': 'Which function closes a file?', 'options': ['fclose()', 'close()', 'end()', 'finish()'], 'correct': 0},
        {'q': 'What does feof() check?', 'options': ['End of file reached', 'File open status', 'File size', 'File permissions'], 'correct': 0},
      ],
      'Dynamic Memory': [
        {'q': 'Which function allocates memory dynamically?', 'options': ['malloc()', 'alloc()', 'new()', 'create()'], 'correct': 0},
        {'q': 'Which function frees allocated memory?', 'options': ['free()', 'delete()', 'release()', 'clear()'], 'correct': 0},
        {'q': 'What is a memory leak?', 'options': ['Allocated memory not freed', 'Stack overflow', 'Null pointer access', 'Buffer overflow'], 'correct': 0},
        {'q': 'What does calloc() do differently than malloc?', 'options': ['Initializes memory to zero', 'Allocates more memory', 'Faster allocation', 'Thread-safe allocation'], 'correct': 0},
      ],
      'Recursion': [
        {'q': 'What is recursion?', 'options': ['Function calling itself', 'Loop construct', 'Array traversal', 'Pointer operation'], 'correct': 0},
        {'q': 'What is the base case in recursion?', 'options': ['Condition that stops recursion', 'Starting condition', 'Loop counter', 'Return value'], 'correct': 0},
        {'q': 'What happens without a base case?', 'options': ['Stack overflow', 'Infinite compile', 'Memory leak', 'Syntax error'], 'correct': 0},
        {'q': 'Recursive factorial of 5?', 'options': ['120', '25', '15', '5'], 'correct': 0},
      ],
    },

    'Advanced Level': {
      'Linked Lists': [
        {'q': 'What is a linked list?', 'options': ['Nodes connected by pointers', 'Contiguous memory array', 'Stack structure', 'Queue structure'], 'correct': 0},
        {'q': 'What does each node in a linked list contain?', 'options': ['Data and pointer to next', 'Only data', 'Only pointer', 'Index and data'], 'correct': 0},
        {'q': 'Time complexity to access nth element in linked list?', 'options': ['O(n)', 'O(1)', 'O(log n)', 'O(n^2)'], 'correct': 0},
        {'q': 'What is a doubly linked list?', 'options': ['Each node has next and prev pointers', 'Two separate lists', 'List with two heads', 'Circular list'], 'correct': 0},
      ],
      'Stacks & Queues': [
        {'q': 'What principle does a stack follow?', 'options': ['LIFO (Last In First Out)', 'FIFO (First In First Out)', 'Random access', 'Priority order'], 'correct': 0},
        {'q': 'What principle does a queue follow?', 'options': ['FIFO (First In First Out)', 'LIFO (Last In First Out)', 'Random access', 'Sorted order'], 'correct': 0},
        {'q': 'Push operation on a stack does what?', 'options': ['Adds element to top', 'Removes from top', 'Adds to bottom', 'Removes from bottom'], 'correct': 0},
        {'q': 'What is a circular queue?', 'options': ['Rear connects back to front', 'Queue in a circle shape', 'Priority queue', 'Double-ended queue'], 'correct': 0},
      ],
      'Bit Manipulation': [
        {'q': 'What does x & 1 check?', 'options': ['If x is odd', 'If x is even', 'If x is zero', 'If x is negative'], 'correct': 0},
        {'q': 'What does x << 1 do?', 'options': ['Multiplies x by 2', 'Divides x by 2', 'Adds 1 to x', 'Subtracts 1'], 'correct': 0},
        {'q': 'What does XOR of a number with itself give?', 'options': ['0', '1', 'The number itself', '-1'], 'correct': 0},
        {'q': 'How do you set the nth bit of x?', 'options': ['x | (1 << n)', 'x & (1 << n)', 'x ^ (1 << n)', 'x - (1 << n)'], 'correct': 0},
      ],
      'Preprocessor': [
        {'q': 'What does #define do?', 'options': ['Creates macro/constant', 'Includes file', 'Declares variable', 'Defines function'], 'correct': 0},
        {'q': 'What does #include do?', 'options': ['Includes header file', 'Defines macro', 'Creates function', 'Declares variable'], 'correct': 0},
        {'q': 'What is #ifdef used for?', 'options': ['Conditional compilation', 'Define macro', 'Include file', 'Function declaration'], 'correct': 0},
        {'q': 'When does the preprocessor run?', 'options': ['Before compilation', 'During compilation', 'After compilation', 'At runtime'], 'correct': 0},
      ],
    },
  },

  // ════════════════════════════════════════════════════════════════
  // HTML & CSS
  // ════════════════════════════════════════════════════════════════
  'HTML & CSS': {

    'Beginner Level': {
      'HTML Basics': [
        {'q': 'HTML stands for?', 'options': ['HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyper Transfer Markup'], 'correct': 0},
        {'q': 'Where does visible page content go?', 'options': ['<body>', '<head>', '<title>', '<html>'], 'correct': 0},
        {'q': 'Where does the page title go?', 'options': ['<title>', '<head>', '<body>', '<header>'], 'correct': 0},
        {'q': 'HTML tags generally come in?', 'options': ['Pairs (opening and closing)', 'Singles only', 'Triples', 'Any number'], 'correct': 0},
      ],
      'Headings & Paragraphs': [
        {'q': 'Which is the biggest heading tag?', 'options': ['<h1>', '<h6>', '<heading>', '<big>'], 'correct': 0},
        {'q': 'Which tag creates a paragraph?', 'options': ['<p>', '<para>', '<text>', '<paragraph>'], 'correct': 0},
        {'q': 'Which tag creates a line break?', 'options': ['<br>', '<lb>', '<break>', '<newline>'], 'correct': 0},
        {'q': 'Which tag creates a horizontal line?', 'options': ['<hr>', '<hl>', '<line>', '<hline>'], 'correct': 0},
      ],
      'Links & Images': [
        {'q': 'Which tag creates a hyperlink?', 'options': ['<a>', '<link>', '<url>', '<href>'], 'correct': 0},
        {'q': 'Which attribute specifies link destination?', 'options': ['href', 'src', 'link', 'url'], 'correct': 0},
        {'q': 'Which tag embeds an image?', 'options': ['<img>', '<image>', '<pic>', '<photo>'], 'correct': 0},
        {'q': 'Which attribute specifies image source?', 'options': ['src', 'href', 'link', 'path'], 'correct': 0},
      ],
      'Lists & Tables': [
        {'q': 'Which tag creates an unordered (bulleted) list?', 'options': ['<ul>', '<ol>', '<list>', '<items>'], 'correct': 0},
        {'q': 'Which tag creates a list item?', 'options': ['<li>', '<item>', '<it>', '<list-item>'], 'correct': 0},
        {'q': 'Which tag creates a table row?', 'options': ['<tr>', '<row>', '<td>', '<th>'], 'correct': 0},
        {'q': 'Which tag creates a table header cell?', 'options': ['<th>', '<td>', '<tr>', '<thead>'], 'correct': 0},
      ],
      'Forms': [
        {'q': 'Which tag creates a form?', 'options': ['<form>', '<input>', '<submit>', '<field>'], 'correct': 0},
        {'q': 'How do you create a text input?', 'options': ['<input type="text">', '<text>', '<input>', '<field type="text">'], 'correct': 0},
        {'q': 'How do you create a submit button?', 'options': ['<button type="submit">', '<submit>', '<button>', '<input type="button">'], 'correct': 0},
        {'q': 'What are the two common form method values?', 'options': ['GET and POST', 'PUT and DELETE', 'SEND and RECEIVE', 'READ and WRITE'], 'correct': 0},
      ],
      'CSS Basics': [
        {'q': 'CSS stands for?', 'options': ['Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'Coded Style Sheets'], 'correct': 0},
        {'q': 'Inline CSS uses which attribute?', 'options': ['style', 'class', 'css', 'design'], 'correct': 0},
        {'q': 'External CSS is linked with which tag?', 'options': ['<link>', '<style>', '<css>', '<script>'], 'correct': 0},
        {'q': 'CSS property and value are separated by?', 'options': [':', '=', ';', ','], 'correct': 0},
      ],
      'Colors & Backgrounds': [
        {'q': 'Which property sets text color?', 'options': ['color', 'text-color', 'font-color', 'foreground'], 'correct': 0},
        {'q': 'Which property sets background color?', 'options': ['background-color', 'bg-color', 'background', 'back-color'], 'correct': 0},
        {'q': 'Hex color format is?', 'options': ['#RRGGBB', 'rgb()', 'hsl()', 'color()'], 'correct': 0},
        {'q': 'RGB color format is?', 'options': ['rgb(r,g,b)', '#RRGGBB', 'color(r,g,b)', 'hsl(h,s,l)'], 'correct': 0},
      ],
      'Box Model': [
        {'q': 'Space between content and border is?', 'options': ['padding', 'margin', 'border', 'gap'], 'correct': 0},
        {'q': 'Space outside the border is?', 'options': ['margin', 'padding', 'border', 'gap'], 'correct': 0},
        {'q': 'Correct box model order from inside to outside?', 'options': ['Content→Padding→Border→Margin', 'Margin→Border→Padding→Content', 'Border→Padding→Content→Margin', 'Padding→Content→Margin→Border'], 'correct': 0},
        {'q': 'box-sizing: border-box includes what in width?', 'options': ['Padding and border', 'Margin only', 'Nothing extra', 'Only border'], 'correct': 0},
      ],
      'Flexbox': [
        {'q': 'How do you enable flexbox on a container?', 'options': ['display: flex', 'flex: true', 'flexbox: on', 'display: flexbox'], 'correct': 0},
        {'q': 'Which property aligns items horizontally in flex?', 'options': ['justify-content', 'align-items', 'flex-direction', 'align-content'], 'correct': 0},
        {'q': 'Which property aligns items vertically in flex?', 'options': ['align-items', 'justify-content', 'flex-align', 'vertical-align'], 'correct': 0},
        {'q': 'Which property changes flex direction?', 'options': ['flex-direction', 'flex-flow', 'direction', 'flex-axis'], 'correct': 0},
      ],
      'Responsive Design': [
        {'q': 'Correct media query syntax?', 'options': ['@media (max-width: 600px)', '@responsive 600px', '@screen 600px', '@mobile 600px'], 'correct': 0},
        {'q': 'Where does the viewport meta tag go?', 'options': ['<head>', '<body>', '<html>', '<footer>'], 'correct': 0},
        {'q': 'The % unit is relative to?', 'options': ['Parent element', 'Screen size', 'Root element', 'Body only'], 'correct': 0},
        {'q': 'What does vw unit stand for?', 'options': ['Viewport width', 'Very wide', 'View window', 'Vertical width'], 'correct': 0},
      ],
    },

    'Intermediate Level': {
      'CSS Grid': [
        {'q': 'How do you enable CSS Grid?', 'options': ['display: grid', 'grid: true', 'display: table', 'layout: grid'], 'correct': 0},
        {'q': 'What does grid-template-columns: 1fr 1fr do?', 'options': ['Creates 2 equal columns', 'Creates 2 rows', 'Sets column gap', 'Creates 1 column'], 'correct': 0},
        {'q': 'What does grid-gap property do?', 'options': ['Sets space between grid cells', 'Sets grid width', 'Sets grid height', 'Sets grid color'], 'correct': 0},
        {'q': 'What does grid-column: span 2 mean?', 'options': ['Item spans 2 columns', 'Item in column 2', 'Item has 2 rows', 'Item spans 2 rows'], 'correct': 0},
      ],
      'CSS Animations': [
        {'q': 'Which property animates CSS properties?', 'options': ['animation', 'transition', 'transform', 'motion'], 'correct': 0},
        {'q': 'Which rule defines keyframes?', 'options': ['@keyframes', '@animation', '@frames', '@motion'], 'correct': 0},
        {'q': 'What does animation-duration set?', 'options': ['How long animation takes', 'Animation speed', 'Animation delay', 'Number of iterations'], 'correct': 0},
        {'q': 'What does animation-iteration-count: infinite do?', 'options': ['Loops animation forever', 'Plays once', 'Plays twice', 'Stops animation'], 'correct': 0},
      ],
      'CSS Variables': [
        {'q': 'How do you declare a CSS variable?', 'options': ['--primary: blue', 'var primary: blue', r'$primary: blue', '@primary: blue'], 'correct': 0},
        {'q': 'How do you use a CSS variable?', 'options': ['color: var(--primary)', 'color: --primary', r'color: $primary', 'color: @primary'], 'correct': 0},
        {'q': 'Where are CSS variables typically declared?', 'options': [':root selector', 'body selector', 'html tag', 'head tag'], 'correct': 0},
        {'q': 'Can CSS variables be updated with JavaScript?', 'options': ['Yes', 'No', 'Only in Chrome', 'Only with SCSS'], 'correct': 0},
      ],
      'Semantic HTML': [
        {'q': 'What is semantic HTML?', 'options': ['Tags that describe meaning', 'Colorful tags', 'New HTML5 tags only', 'Tags with CSS'], 'correct': 0},
        {'q': 'Which tag represents main navigation?', 'options': ['<nav>', '<menu>', '<links>', '<navigation>'], 'correct': 0},
        {'q': 'Which tag wraps the main page content?', 'options': ['<main>', '<content>', '<body>', '<center>'], 'correct': 0},
        {'q': 'Which tag represents a self-contained article?', 'options': ['<article>', '<section>', '<div>', '<content>'], 'correct': 0},
      ],
      'HTML5 APIs': [
        {'q': 'Which API stores data in browser permanently?', 'options': ['localStorage', 'sessionStorage', 'cookies', 'indexedDB'], 'correct': 0},
        {'q': 'Which API gets user geolocation?', 'options': ['Geolocation API', 'Location API', 'GPS API', 'Map API'], 'correct': 0},
        {'q': 'Which HTML element is used for drawing graphics?', 'options': ['<canvas>', '<draw>', '<graphic>', '<svg>'], 'correct': 0},
        {'q': 'What does the History API allow?', 'options': ['Manipulate browser history', 'Store user history', 'Track page views', 'Navigate back only'], 'correct': 0},
      ],
      'Media Queries': [
        {'q': 'What is the purpose of media queries?', 'options': ['Apply styles based on device/screen size', 'Load images conditionally', 'Block certain devices', 'Change HTML structure'], 'correct': 0},
        {'q': 'Which breakpoint targets mobile screens?', 'options': ['max-width: 768px', 'min-width: 1200px', 'max-width: 1920px', 'min-width: 768px'], 'correct': 0},
        {'q': 'What does min-width in media query mean?', 'options': ['Apply styles for screens AT LEAST this wide', 'Apply styles for screens NO WIDER than this', 'Minimum font size', 'Minimum margin'], 'correct': 0},
        {'q': 'Can you combine multiple media queries?', 'options': ['Yes with and/or', 'No', 'Only with and', 'Only with or'], 'correct': 0},
      ],
    },

    'Advanced Level': {
      'CSS Preprocessors': [
        {'q': 'What is SASS/SCSS?', 'options': ['CSS preprocessor with extra features', 'New version of CSS', 'JavaScript library', 'HTML template engine'], 'correct': 0},
        {'q': 'What does SCSS nesting allow?', 'options': ['Write selectors inside parent selectors', 'Import other files', 'Create variables', 'Mix-in functions'], 'correct': 0},
        {'q': 'What is a mixin in SCSS?', 'options': ['Reusable group of CSS declarations', 'Variable declaration', 'Import statement', 'Loop construct'], 'correct': 0},
        {'q': 'How do you extend styles in SCSS?', 'options': ['@extend .class', '@include .class', 'extend: .class', 'use: .class'], 'correct': 0},
      ],
      'Web Accessibility': [
        {'q': 'What does ARIA stand for?', 'options': ['Accessible Rich Internet Applications', 'Advanced Rich Interface API', 'Automated Responsive Interface App', 'Accessible Rendering Interface API'], 'correct': 0},
        {'q': 'What is the alt attribute for images used for?', 'options': ['Screen reader description', 'Image title', 'Image size', 'Image style'], 'correct': 0},
        {'q': 'Which WCAG level is the minimum recommended standard?', 'options': ['AA', 'A', 'AAA', 'AAAA'], 'correct': 0},
        {'q': 'What does tab order refer to?', 'options': ['Keyboard navigation sequence', 'Tab size in CSS', 'HTML indentation', 'Browser tab order'], 'correct': 0},
      ],
      'SEO Basics': [
        {'q': 'Which tag is most important for SEO page title?', 'options': ['<title>', '<h1>', '<meta>', '<header>'], 'correct': 0},
        {'q': 'What is a meta description?', 'options': ['Short page summary for search engines', 'Page title', 'Page keyword list', 'Page author'], 'correct': 0},
        {'q': 'What does a canonical tag do?', 'options': ['Specifies preferred URL for duplicate pages', 'Redirects users', 'Blocks search engines', 'Sets page language'], 'correct': 0},
        {'q': 'What is structured data / schema markup used for?', 'options': ['Rich results in search engines', 'Page styling', 'JavaScript data', 'Database schema'], 'correct': 0},
      ],
    },
  },
};

// End of quiz_data.dart
