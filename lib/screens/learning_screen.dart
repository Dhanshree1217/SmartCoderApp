import 'dart:math';
import 'package:flutter/material.dart';
import '../user_data_manager.dart';

// ─── topic definitions per language per level ───────────────────────────────

const Map<String, Map<String, List<Map<String, dynamic>>>> _topicsByLangLevel = {
  'Python': {
    'Beginner Level': [
      {'name': 'Hello World',   'icon': Icons.play_arrow},
      {'name': 'Variables',     'icon': Icons.storage},
      {'name': 'Data Types',    'icon': Icons.category},
      {'name': 'Input/Output',  'icon': Icons.keyboard},
      {'name': 'Operators',     'icon': Icons.calculate},
      {'name': 'Conditions',    'icon': Icons.device_hub},
      {'name': 'For Loop',      'icon': Icons.loop},
      {'name': 'While Loop',    'icon': Icons.replay},
      {'name': 'Lists',         'icon': Icons.view_list},
      {'name': 'Functions',     'icon': Icons.functions},
    ],
    'Intermediate Level': [
      {'name': 'String Methods',    'icon': Icons.text_fields},
      {'name': 'Dictionaries',      'icon': Icons.menu_book},
      {'name': 'Tuples & Sets',     'icon': Icons.layers},
      {'name': 'File Handling',     'icon': Icons.folder_open},
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'Classes & Objects', 'icon': Icons.class_outlined},
      {'name': 'Inheritance',       'icon': Icons.account_tree},
      {'name': 'Modules',           'icon': Icons.extension},
    ],
    'Advanced Level': [
      {'name': 'Decorators',        'icon': Icons.auto_fix_high},
      {'name': 'Generators',        'icon': Icons.electric_bolt},
      {'name': 'Lambda Functions',  'icon': Icons.functions},
      {'name': 'List Comprehension','icon': Icons.list_alt},
      {'name': 'Regex',             'icon': Icons.search},
      {'name': 'Multithreading',    'icon': Icons.device_hub},
    ],
  },
  'Java': {
    'Beginner Level': [
      {'name': 'Hello World',    'icon': Icons.play_arrow},
      {'name': 'Variables',      'icon': Icons.storage},
      {'name': 'Data Types',     'icon': Icons.category},
      {'name': 'Operators',      'icon': Icons.calculate},
      {'name': 'Conditions',     'icon': Icons.device_hub},
      {'name': 'For Loop',       'icon': Icons.loop},
      {'name': 'While Loop',     'icon': Icons.replay},
      {'name': 'Arrays',         'icon': Icons.view_list},
      {'name': 'Methods',        'icon': Icons.functions},
      {'name': 'Scanner Input',  'icon': Icons.keyboard},
    ],
    'Intermediate Level': [
      {'name': 'Classes & Objects', 'icon': Icons.class_outlined},
      {'name': 'Constructors',      'icon': Icons.build},
      {'name': 'Inheritance',       'icon': Icons.account_tree},
      {'name': 'Interfaces',        'icon': Icons.settings_ethernet},
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'ArrayList',         'icon': Icons.list},
      {'name': 'HashMap',           'icon': Icons.map},
      {'name': 'String Methods',    'icon': Icons.text_fields},
    ],
    'Advanced Level': [
      {'name': 'Generics',       'icon': Icons.code},
      {'name': 'Streams & Lambda','icon': Icons.water},
      {'name': 'Multithreading', 'icon': Icons.device_hub},
      {'name': 'File I/O',       'icon': Icons.folder_open},
      {'name': 'JDBC',           'icon': Icons.storage},
    ],
  },
  'C Language': {
    'Beginner Level': [
      {'name': 'Hello World',  'icon': Icons.play_arrow},
      {'name': 'Variables',    'icon': Icons.storage},
      {'name': 'Data Types',   'icon': Icons.category},
      {'name': 'Input/Output', 'icon': Icons.keyboard},
      {'name': 'Operators',    'icon': Icons.calculate},
      {'name': 'Conditions',   'icon': Icons.device_hub},
      {'name': 'For Loop',     'icon': Icons.loop},
      {'name': 'While Loop',   'icon': Icons.replay},
      {'name': 'Arrays',       'icon': Icons.view_list},
      {'name': 'Functions',    'icon': Icons.functions},
    ],
    'Intermediate Level': [
      {'name': 'Pointers',       'icon': Icons.arrow_forward},
      {'name': 'Strings',        'icon': Icons.text_fields},
      {'name': 'Structures',     'icon': Icons.layers},
      {'name': 'File Handling',  'icon': Icons.folder_open},
      {'name': 'Dynamic Memory', 'icon': Icons.memory},
      {'name': 'Recursion',      'icon': Icons.replay_circle_filled},
    ],
    'Advanced Level': [
      {'name': 'Linked Lists',   'icon': Icons.link},
      {'name': 'Stacks & Queues','icon': Icons.stacked_bar_chart},
      {'name': 'Bit Manipulation','icon': Icons.settings},
      {'name': 'Preprocessor',   'icon': Icons.code},
    ],
  },
  'HTML & CSS': {
    'Beginner Level': [
      {'name': 'HTML Basics',          'icon': Icons.code},
      {'name': 'Headings & Paragraphs','icon': Icons.text_fields},
      {'name': 'Links & Images',       'icon': Icons.link},
      {'name': 'Lists & Tables',       'icon': Icons.list},
      {'name': 'Forms',                'icon': Icons.assignment},
      {'name': 'CSS Basics',           'icon': Icons.palette},
      {'name': 'Colors & Backgrounds', 'icon': Icons.color_lens},
      {'name': 'Box Model',            'icon': Icons.crop_square},
      {'name': 'Flexbox',              'icon': Icons.view_column},
      {'name': 'Responsive Design',    'icon': Icons.devices},
    ],
    'Intermediate Level': [
      {'name': 'CSS Grid',         'icon': Icons.grid_on},
      {'name': 'CSS Animations',   'icon': Icons.animation},
      {'name': 'CSS Variables',    'icon': Icons.tune},
      {'name': 'Semantic HTML',    'icon': Icons.layers},
      {'name': 'HTML5 APIs',       'icon': Icons.api},
      {'name': 'Media Queries',    'icon': Icons.phone_iphone},
    ],
    'Advanced Level': [
      {'name': 'CSS Preprocessors','icon': Icons.code},
      {'name': 'Web Accessibility','icon': Icons.accessibility},
      {'name': 'SEO Basics',       'icon': Icons.search},
    ],
  },
};

// ─── topic content ────────────────────────────────────────────────────────────

const Map<String, Map<String, String>> _content = {
  // ── PYTHON ──
  'Python': {
    'Hello World':
        'Your first Python program!\n\nCode:\nprint("Hello, World!")\n\nOutput:\nHello, World!\n\n• print() displays text on screen.\n• Python does NOT need semicolons.\n• Very simple and readable syntax!',
    'Variables':
        'Variables store data values.\n\nExamples:\nname = "Alice"\nage = 20\nprice = 9.99\n\n• No need to declare type.\n• Use = to assign value.\n• Variable names are case-sensitive.',
    'Data Types':
        'Python has these main types:\n\n• int   → age = 25\n• float → price = 9.99\n• str   → name = "Alice"\n• bool  → is_active = True\n• list  → nums = [1, 2, 3]\n\nCheck type: type(age)  → <class "int">',
    'Input/Output':
        'Getting input from user:\n\nname = input("Enter name: ")\nprint("Hello", name)\n\n• input() always returns a string.\n• Convert to int: int(input("Age: "))\n• print() shows output on screen.',
    'Operators':
        'Arithmetic:\n+ - * /  //  %  **\n\nExamples:\n5 + 3 = 8\n10 // 3 = 3  (floor division)\n10 % 3 = 1   (remainder)\n2 ** 3 = 8   (power)\n\nComparison: == != > < >= <=\nLogical:    and  or  not',
    'Conditions':
        'if-elif-else:\n\nage = 18\nif age >= 18:\n    print("Adult")\nelif age >= 13:\n    print("Teen")\nelse:\n    print("Child")\n\n• Indentation (4 spaces) is required!\n• elif = else if',
    'For Loop':
        'Repeat over a sequence:\n\nfor i in range(5):\n    print(i)   # 0 1 2 3 4\n\nLoop over list:\nfruits = ["apple","banana"]\nfor f in fruits:\n    print(f)\n\n• range(start, stop, step)\n• break → exit loop\n• continue → skip iteration',
    'While Loop':
        'Repeat while condition is True:\n\ni = 0\nwhile i < 5:\n    print(i)\n    i += 1\n\n• Always update the variable!\n• Infinite loop: while True:\n• Use break to exit.',
    'Lists':
        'Ordered, changeable collection:\n\nfruits = ["apple", "banana", "cherry"]\nprint(fruits[0])    # apple\nfruits.append("mango")\nfruits.remove("banana")\nprint(len(fruits))  # 3\n\nMethods: append, remove, pop, sort, reverse',
    'Functions':
        'Reusable block of code:\n\ndef greet(name):\n    print("Hello", name)\n\ngreet("Alice")   # Hello Alice\n\nWith return:\ndef add(a, b):\n    return a + b\n\nresult = add(3, 4)  # 7',
    'String Methods':
        '"hello".upper()     # HELLO\n"HELLO".lower()     # hello\n"hello".capitalize() # Hello\n"hello world".split() # ["hello","world"]\n"  hi  ".strip()    # hi\n"hello".replace("l","r") # herro\nlen("hello")        # 5',

    // ── Intermediate ──
    'Dictionaries':
        'Introduction:\nDictionary stores key-value pairs like a real dictionary.\n\nConcept:\nkeys must be unique & immutable. Values can be any type.\n\nSyntax:\nperson = {"name": "Alice", "age": 25}\nprint(person["name"])   # Alice\nperson["city"] = "NYC" # add key\ndel person["age"]       # remove key\n\nMethods:\nperson.keys()   # dict_keys(["name","city"])\nperson.values() # dict_values(["Alice","NYC"])\nperson.items()  # key-value pairs\nperson.get("age", 0) # safe access, default 0\n\nLoop:\nfor k, v in person.items():\n    print(k, ":", v)\n\nBest Practices:\n• Use .get() to avoid KeyError.\n• Dict comprehension: {k: v for k,v in items}\n\nCommon Mistake:\nAccessing missing key directly raises KeyError.',

    'Tuples & Sets':
        'Introduction:\nTuple = ordered, immutable. Set = unordered, unique items.\n\nTuple Syntax:\ncoords = (10, 20)\nprint(coords[0])   # 10\nx, y = coords       # unpacking\n# coords[0] = 5    # ERROR – immutable!\n\nWhen to use Tuple:\n• Fixed data (x,y coordinates, RGB color)\n• Multiple return values from function\n\nSet Syntax:\nfruits = {"apple", "banana", "apple"}\nprint(fruits)   # {"apple", "banana"} – no dupe\nfruits.add("mango")\nfruits.remove("banana")\n\nSet Operations:\na = {1,2,3}; b = {2,3,4}\na | b  # union     → {1,2,3,4}\na & b  # intersection → {2,3}\na - b  # difference  → {1}\n\nBest Practices:\n• Use tuple for fixed data, set for membership tests.\n• in operator on sets is O(1) vs O(n) for lists.',

    'File Handling':
        'Introduction:\nRead/write files to store data permanently.\n\nOpen Modes:\nr  → read   w → write (overwrites)\na  → append rb → read binary\n\nRead File:\nwith open("data.txt", "r") as f:\n    content = f.read()          # all text\n    lines = f.readlines()       # list of lines\n\nWrite File:\nwith open("output.txt", "w") as f:\n    f.write("Hello, File!\\n")\n\nAppend File:\nwith open("log.txt", "a") as f:\n    f.write("New entry\\n")\n\nReal-World Use Cases:\n• Save game progress\n• Log application events\n• Read config files\n\nBest Practices:\n• Always use with statement – auto-closes file.\n• Check if file exists: import os; os.path.exists()\n\nCommon Mistake:\nForgetting to close file (use with to prevent).',

    'Exception Handling':
        'Introduction:\nHandle errors gracefully so program doesn\'t crash.\n\nBasic Syntax:\ntry:\n    x = int(input("Number: "))\n    print(10 / x)\nexcept ZeroDivisionError:\n    print("Cannot divide by zero!")\nexcept ValueError:\n    print("Not a valid number!")\nexcept Exception as e:\n    print("Error:", e)\nelse:\n    print("Success!")   # runs if no exception\nfinally:\n    print("Always runs!")\n\nRaise Exception:\nif age < 0:\n    raise ValueError("Age cannot be negative")\n\nCommon Exceptions:\nValueError, TypeError, ZeroDivisionError,\nIndexError, KeyError, FileNotFoundError\n\nBest Practices:\n• Catch specific exceptions, not bare except.\n• Use finally for cleanup (close files, DB).\n\nCommon Mistake:\nUsing bare except: hides all errors.',

    'Classes & Objects':
        'Introduction:\nOOP groups data and behavior into classes.\n\nConcept:\nClass = blueprint. Object = instance of class.\n\nSyntax:\nclass Dog:\n    def __init__(self, name, breed):\n        self.name = name    # instance variable\n        self.breed = breed\n\n    def bark(self):\n        print(f"{self.name} says Woof!")\n\n    def __str__(self):\n        return f"Dog: {self.name}"\n\n# Create objects\ndog1 = Dog("Rex", "Labrador")\ndog2 = Dog("Bella", "Poodle")\ndog1.bark()          # Rex says Woof!\nprint(dog1)          # Dog: Rex\n\nClass Variable vs Instance Variable:\nclass Counter:\n    count = 0            # class variable (shared)\n    def __init__(self):\n        Counter.count += 1\n\nBest Practices:\n• Always define __init__ for initialization.\n• Use __str__ for readable string representation.',

    'Inheritance':
        'Introduction:\nInheritance allows a class to reuse another class\'s code.\n\nConcept:\nChild class inherits attributes and methods of Parent.\n\nSyntax:\nclass Animal:\n    def __init__(self, name):\n        self.name = name\n    def speak(self):\n        print(f"{self.name} makes a sound")\n\nclass Dog(Animal):        # Dog inherits Animal\n    def speak(self):       # override method\n        print(f"{self.name} barks")\n\nclass Cat(Animal):\n    def speak(self):\n        print(f"{self.name} meows")\n\ndog = Dog("Rex")\ndog.speak()   # Rex barks  (overridden)\n\nsuper() Call:\nclass Puppy(Dog):\n    def __init__(self, name, age):\n        super().__init__(name)  # call parent __init__\n        self.age = age\n\nTypes:\n• Single, Multi-level, Multiple inheritance\n\nBest Practices:\n• Prefer composition over deep inheritance.\n• Use super() to call parent methods.',

    'Modules':
        'Introduction:\nModules split code into reusable files.\n\nBuilt-in Modules:\nimport math\nprint(math.sqrt(25))   # 5.0\nprint(math.pi)          # 3.14159\n\nimport random\nprint(random.randint(1, 10))\n\nimport os\nprint(os.getcwd())     # current directory\n\nImport Styles:\nfrom math import sqrt, pi  # specific items\nfrom math import *          # all (not recommended)\nimport math as m            # alias\n\nCreate Your Own Module:\n# myutils.py\ndef greet(name):\n    return f"Hello, {name}!"\n\n# main.py\nimport myutils\nprint(myutils.greet("Alice"))\n\nPackages:\nFolder with __init__.py is a package.\nImport: from mypackage.mymodule import func\n\nBest Practices:\n• Import only what you need.\n• Avoid circular imports.',

    // ── Advanced ──
    'Decorators':
        'Introduction:\nDecorators modify or enhance functions without changing source code.\n\nConcept:\nA decorator is a function that takes a function and returns a new function.\n\nSyntax:\ndef my_decorator(func):\n    def wrapper(*args, **kwargs):\n        print("Before call")\n        result = func(*args, **kwargs)\n        print("After call")\n        return result\n    return wrapper\n\n@my_decorator\ndef greet(name):\n    print(f"Hello, {name}")\n\ngreet("Alice")\n# Before call\n# Hello, Alice\n# After call\n\nReal-World Use Cases:\n• Logging, Timing, Authentication, Caching\n\nBuilt-in Decorators:\n@staticmethod  – method without self\n@classmethod   – method with cls\n@property      – getter/setter\n\nfunctools.wraps:\nfrom functools import wraps\ndef decorator(func):\n    @wraps(func)  # preserve function metadata\n    def wrapper(*args, **kwargs):\n        return func(*args, **kwargs)\n    return wrapper\n\nBest Practices:\n• Always use @wraps to preserve __name__, __doc__.\n• Stack decorators from bottom to top.',

    'Generators':
        'Introduction:\nGenerators produce values lazily – one at a time, saving memory.\n\nConcept:\nUse yield instead of return. Execution pauses at yield.\n\nSyntax:\ndef countdown(n):\n    while n > 0:\n        yield n\n        n -= 1\n\nfor num in countdown(5):\n    print(num)   # 5 4 3 2 1\n\n# Generator uses almost no memory!\n\nGenerator Expression:\nnums = (x**2 for x in range(10))\nprint(next(nums))   # 0\nprint(next(nums))   # 1\n\nReal-World Use Cases:\n• Read large files line by line\n• Infinite data streams\n• Data pipelines\n\n# Read huge file efficiently:\ndef read_large_file(path):\n    with open(path) as f:\n        for line in f:\n            yield line.strip()\n\nBest Practices:\n• Prefer generators over lists for large data.\n• Use itertools for complex generator patterns.\n\nCommon Mistake:\nCalling generator twice – it exhausts after first use.',

    'Lambda Functions':
        'Introduction:\nLambda is an anonymous (no name) single-expression function.\n\nSyntax:\nlambda arguments: expression\n\nExamples:\nsquare = lambda x: x ** 2\nprint(square(4))   # 16\n\nadd = lambda a, b: a + b\nprint(add(3, 5))   # 8\n\nWith map(), filter(), sorted():\nnums = [1, 2, 3, 4, 5]\n\n# map – apply function to each element\nsquares = list(map(lambda x: x**2, nums))\n# [1, 4, 9, 16, 25]\n\n# filter – keep elements matching condition\nevens = list(filter(lambda x: x % 2 == 0, nums))\n# [2, 4]\n\n# sorted – custom sort key\npeople = [("Alice",30),("Bob",25),("Eve",28)]\nsorted_people = sorted(people, key=lambda p: p[1])\n# sorted by age\n\nReal-World Use Cases:\n• Quick one-time functions in callbacks\n• Sorting with custom keys\n\nBest Practices:\n• Use lambda only for simple logic.\n• For complex logic, define a named function.',

    'List Comprehension':
        'Introduction:\nList comprehension creates lists in one concise line.\n\nSyntax:\n[expression for item in iterable if condition]\n\nBasic Examples:\nsquares = [x**2 for x in range(5)]\n# [0, 1, 4, 9, 16]\n\nevens = [x for x in range(10) if x % 2 == 0]\n# [0, 2, 4, 6, 8]\n\nNested Comprehension:\nmatrix = [[i*j for j in range(3)] for i in range(3)]\n\nDict/Set Comprehension:\nsq_dict = {x: x**2 for x in range(5)}\nunique = {x % 3 for x in range(9)}\n\nReal-World Use Cases:\n• Filter & transform data in one line\n• Flatten nested lists\n• Build lookup dictionaries\n\nPerformance:\nList comprehension is ~35% faster than equivalent for-loop.\n\nBest Practices:\n• Keep comprehension simple and readable.\n• For side effects, use a regular for loop.\n\nCommon Mistake:\nOverly complex comprehensions harm readability.',

    'Regex':
        'Introduction:\nRegex (Regular Expressions) find patterns in strings.\n\nImport:\nimport re\n\nKey Functions:\nre.search(pattern, string)  - find first match\nre.findall(pattern, string) - find all matches\nre.sub(pattern, repl, str)  - replace matches\nre.match(pattern, string)   - match at start\n\nCommon Patterns:\n.   - any char         \\d  - digit [0-9]\n\\w  - word char        \\s  - whitespace\n^   - start of string  \$  - end of string\n*   - 0 or more        +   - 1 or more\n?   - 0 or 1           {n} - exactly n times\n\nExamples:\ntext = "Email: user@example.com, age: 25"\n\nemail = re.search(r"[\\w.]+@[\\w]+\\.[a-z]+", text)\nprint(email.group())   # user@example.com\n\nnums = re.findall(r"\\d+", text)\nprint(nums)            # [\'25\']\n\nclean = re.sub(r"\\s+", " ", "too  many   spaces")\n# "too many spaces"\n\nBest Practices:\n• Use raw strings r"pattern" to avoid escape issues.\n• Compile patterns used multiple times: re.compile()',

    'Multithreading':
        'Introduction:\nMultithreading runs multiple tasks concurrently in the same process.\n\nWhen to Use:\n• I/O-bound tasks: file ops, network calls, DB queries\n• NOT for CPU-heavy tasks (use multiprocessing instead)\n\nBasic Thread:\nimport threading\n\ndef download(url):\n    print(f"Downloading {url}")\n\nt1 = threading.Thread(target=download, args=("url1",))\nt2 = threading.Thread(target=download, args=("url2",))\nt1.start(); t2.start()\nt1.join();  t2.join()   # wait for completion\n\nThread Safety – Lock:\nlock = threading.Lock()\ncounter = 0\n\ndef increment():\n    global counter\n    with lock:      # only one thread at a time\n        counter += 1\n\nThreadPoolExecutor (modern):\nfrom concurrent.futures import ThreadPoolExecutor\n\nwith ThreadPoolExecutor(max_workers=4) as ex:\n    results = list(ex.map(download, urls))\n\nGIL Note:\nPython\'s GIL limits true parallelism for CPU tasks.\n\nBest Practices:\n• Use Lock to prevent race conditions.\n• Prefer ThreadPoolExecutor over manual threads.\n• Use multiprocessing for CPU-bound tasks.',
  },

  // ── JAVA ──
  'Java': {
    'Hello World':
        'Every Java program needs a class and main method:\n\npublic class Main {\n    public static void main(String[] args) {\n        System.out.println("Hello, World!");\n    }\n}\n\n• System.out.println() prints with newline.\n• Every statement ends with ;',
    'Variables':
        'Java needs explicit types:\n\nint age = 20;\ndouble price = 9.99;\nString name = "Alice";\nboolean active = true;\nchar grade = \'A\';\n\n• int for whole numbers\n• double for decimals\n• String for text (capital S)',
    'Data Types':
        'Primitive types:\n• byte, short, int, long\n• float, double\n• char\n• boolean\n\nExamples:\nint x = 100;\ndouble pi = 3.14;\nchar c = \'A\';\nboolean flag = true;\n\nString is an Object, not primitive.',
    'Operators':
        'Arithmetic: + - * / % \n\nint a = 10, b = 3;\nSystem.out.println(a + b);  // 13\nSystem.out.println(a % b);  // 1\n\nIncrement: a++  a--\nCompound: a += 5\nComparison: == != > < >= <=\nLogical: && || !',
    'Conditions':
        'if-else if-else:\n\nint score = 75;\nif (score >= 90) {\n    System.out.println("A");\n} else if (score >= 60) {\n    System.out.println("B");\n} else {\n    System.out.println("C");\n}\n\n• Curly braces {} required.\n• Condition inside ()',
    'For Loop':
        'for (init; condition; update):\n\nfor (int i = 0; i < 5; i++) {\n    System.out.println(i);\n}\n\nFor-each loop:\nint[] nums = {1, 2, 3};\nfor (int n : nums) {\n    System.out.println(n);\n}\n\n• break → exit loop\n• continue → skip',
    'While Loop':
        'int i = 0;\nwhile (i < 5) {\n    System.out.println(i);\n    i++;\n}\n\ndo-while (runs at least once):\ndo {\n    System.out.println(i);\n    i++;\n} while (i < 5);',
    'Arrays':
        'Fixed-size collection:\n\nint[] nums = {10, 20, 30};\nSystem.out.println(nums[0]);  // 10\nSystem.out.println(nums.length); // 3\n\nDeclare and fill:\nint[] arr = new int[5];\narr[0] = 100;\n\n• Index starts at 0\n• .length gives size',
    'Methods':
        'static void greet(String name) {\n    System.out.println("Hello " + name);\n}\n\nWith return value:\nstatic int add(int a, int b) {\n    return a + b;\n}\n\n// Call:\ngreet("Alice");\nint sum = add(3, 4);',
    'Scanner Input':
        'import java.util.Scanner;\n\nScanner sc = new Scanner(System.in);\nSystem.out.print("Enter name: ");\nString name = sc.nextLine();\nSystem.out.print("Enter age: ");\nint age = sc.nextInt();\nSystem.out.println("Hello " + name);\n\n• nextLine() → String\n• nextInt() → int\n• nextDouble() → double',
    'Classes & Objects':
        'class Car {\n    String color;\n    int speed;\n\n    void drive() {\n        System.out.println("Driving!");\n    }\n}\n\n// Create object:\nCar myCar = new Car();\nmyCar.color = "Red";\nmyCar.drive();',

    // ── Intermediate ──
    'Constructors':
        'Introduction:\nConstructors initialize objects when they are created.\n\nConcept:\nSame name as class, no return type. Called automatically with new.\n\nSyntax:\nclass Person {\n    String name;\n    int age;\n\n    // Constructor\n    Person(String name, int age) {\n        this.name = name;   // this → current object\n        this.age  = age;\n    }\n\n    void display() {\n        System.out.println(name + ", " + age);\n    }\n}\n\nPerson p = new Person("Alice", 25);\np.display();   // Alice, 25\n\nConstructor Overloading:\nPerson() { this.name = "Unknown"; this.age = 0; }\nPerson(String n) { this.name = n; this.age = 0; }\nPerson(String n, int a) { this.name = n; this.age = a; }\n\nthis() → call another constructor\nPerson(String n) { this(n, 0); }\n\nBest Practices:\n• Always initialize all fields in constructor.\n• Use this() to avoid duplicate initialization code.',

    'Inheritance':
        'Introduction:\nInheritance lets a child class reuse a parent class\'s fields and methods.\n\nSyntax:\nclass Animal {\n    String name;\n    Animal(String n) { this.name = n; }\n    void speak() { System.out.println(name + " makes sound"); }\n}\n\nclass Dog extends Animal {\n    String breed;\n    Dog(String n, String b) {\n        super(n);     // call parent constructor\n        this.breed = b;\n    }\n    @Override\n    void speak() {   // method overriding\n        System.out.println(name + " barks!");\n    }\n}\n\nDog d = new Dog("Rex", "Lab");\nd.speak();   // Rex barks!\n\nsuper keyword:\n• super() → parent constructor\n• super.method() → parent method\n\nTypes in Java:\n• Single, Multi-level (A→B→C)\n• Multiple NOT supported (use interfaces)\n\nBest Practices:\n• Use @Override annotation to catch mistakes.\n• Call super() as first line in child constructor.',

    'Interfaces':
        'Introduction:\nInterface defines a contract – what methods a class MUST implement.\n\nConcept:\nAll methods are abstract (no body) by default.\nA class can implement multiple interfaces.\n\nSyntax:\ninterface Drawable {\n    void draw();           // abstract method\n    default void info() {  // default method (Java 8+)\n        System.out.println("I am drawable");\n    }\n}\n\ninterface Resizable {\n    void resize(int factor);\n}\n\nclass Circle implements Drawable, Resizable {\n    @Override\n    public void draw() { System.out.println("Drawing circle"); }\n    @Override\n    public void resize(int f) { System.out.println("Resize x" + f); }\n}\n\nCircle c = new Circle();\nc.draw();   // Drawing circle\n\nInterface vs Abstract Class:\n• Interface: no state, multiple implementation\n• Abstract class: can have fields & constructors\n\nBest Practices:\n• Name interfaces as adjectives: Runnable, Serializable.\n• Use interfaces for unrelated classes sharing behavior.',

    'Exception Handling':
        'Introduction:\nException handling prevents program crashes on errors.\n\nSyntax:\ntry {\n    int result = 10 / 0;\n} catch (ArithmeticException e) {\n    System.out.println("Error: " + e.getMessage());\n} catch (Exception e) {\n    System.out.println("General error: " + e);\n} finally {\n    System.out.println("Always executes!");\n}\n\nChecked vs Unchecked:\n• Checked: must be declared/caught (IOException, SQLException)\n• Unchecked: runtime errors (NullPointerException, ArrayIndexOutOfBounds)\n\nThrow & Throws:\nvoid setAge(int age) throws IllegalArgumentException {\n    if (age < 0) throw new IllegalArgumentException("Invalid age");\n    this.age = age;\n}\n\nCustom Exception:\nclass InsufficientFundsException extends Exception {\n    InsufficientFundsException(String msg) { super(msg); }\n}\n\nBest Practices:\n• Catch most specific exception first.\n• Never swallow exceptions with empty catch blocks.\n• Use finally for resource cleanup.',

    'ArrayList':
        'Introduction:\nArrayList is a dynamic array that grows automatically.\n\nImport:\nimport java.util.ArrayList;\n\nSyntax:\nArrayList<String> names = new ArrayList<>();\nnames.add("Alice");\nnames.add("Bob");\nnames.add("Charlie");\n\nSystem.out.println(names.get(0));   // Alice\nSystem.out.println(names.size());   // 3\n\nnames.remove("Bob");\nnames.set(0, "Anna");   // replace index 0\n\nLoop:\nfor (String name : names) {\n    System.out.println(name);\n}\n\n// or lambda (Java 8+):\nnames.forEach(n -> System.out.println(n));\n\nUseful Methods:\nadd(item)      remove(item/index)\nget(index)     set(index, item)\nsize()         contains(item)\nclear()        sort(Comparator)\nindexOf(item)  isEmpty()\n\nArrayList vs Array:\n• Array: fixed size. ArrayList: dynamic.\n• ArrayList only holds objects (Integer, String, not int).\n\nBest Practices:\n• Use generics: ArrayList<String>, not raw ArrayList.\n• Use Collections.sort() to sort.',

    'HashMap':
        'Introduction:\nHashMap stores key-value pairs with O(1) average lookup.\n\nImport:\nimport java.util.HashMap;\n\nSyntax:\nHashMap<String, Integer> scores = new HashMap<>();\nscores.put("Alice", 95);\nscores.put("Bob",   87);\nscores.put("Alice", 98);  // overwrites Alice\n\nSystem.out.println(scores.get("Alice"));       // 98\nSystem.out.println(scores.getOrDefault("Eve", 0)); // 0\nSystem.out.println(scores.containsKey("Bob")); // true\nscores.remove("Bob");\n\nIterate:\nfor (Map.Entry<String, Integer> e : scores.entrySet()) {\n    System.out.println(e.getKey() + ": " + e.getValue());\n}\n\nReal-World Use Cases:\n• Word frequency count\n• Cache/lookup tables\n• Student grade tracker\n\nBest Practices:\n• Use getOrDefault() to avoid null.\n• Use LinkedHashMap to maintain insertion order.',

    'String Methods':
        'Introduction:\nJava String is immutable – every modification creates a new String.\n\nCommon Methods:\nString s = "Hello, World!";\n\ns.length()           // 13\ns.charAt(0)          // H\ns.substring(7, 12)   // World\ns.toLowerCase()      // hello, world!\ns.toUpperCase()      // HELLO, WORLD!\ns.trim()             // removes leading/trailing spaces\ns.replace("World","Java") // Hello, Java!\ns.contains("Hello") // true\ns.startsWith("He")  // true\ns.endsWith("!")     // true\ns.indexOf("o")      // 4\ns.split(", ")        // ["Hello", "World!"]\n\nString Comparison:\n// WRONG: s1 == s2 (compares reference)\n// CORRECT:\ns1.equals(s2)\ns1.equalsIgnoreCase(s2)\n\nStringBuilder (mutable, efficient):\nStringBuilder sb = new StringBuilder();\nsb.append("Hello");\nsb.append(" World");\nString result = sb.toString();  // "Hello World"\n\nBest Practices:\n• Use StringBuilder for repeated concatenation in loops.\n• Always use .equals() not == for String comparison.',

    // ── Advanced ──
    'Generics':
        'Introduction:\nGenerics allow classes and methods to work with any type safely.\n\nConcept:\nType parameter <T> acts as a placeholder for real types.\n\nGeneric Class:\nclass Box<T> {\n    private T value;\n    Box(T v) { this.value = v; }\n    T getValue() { return value; }\n}\n\nBox<String>  sBox = new Box<>("Hello");\nBox<Integer> iBox = new Box<>(42);\nSystem.out.println(sBox.getValue()); // Hello\n\nGeneric Method:\nstatic <T extends Comparable<T>> T max(T a, T b) {\n    return a.compareTo(b) > 0 ? a : b;\n}\nSystem.out.println(max(3, 7));     // 7\nSystem.out.println(max("cat","dog")); // dog\n\nBounded Type Parameters:\n<T extends Number>   // T must be Number or subclass\n<T super Integer>    // T must be Integer or superclass\n\nWildcard:\nList<?> any      // unknown type\nList<? extends Number> // Number or subclass\n\nReal-World Use Cases:\n• Collections (ArrayList<T>, HashMap<K,V>)\n• Generic utility methods\n• Type-safe data structures\n\nBest Practices:\n• Use meaningful names: <T> type, <K,V> key-value, <E> element.',

    'Streams & Lambda':
        'Introduction:\nStreams + Lambda enable functional-style data processing (Java 8+).\n\nLambda Syntax:\n(params) -> expression\n(params) -> { statements; }\n\nStream Pipeline:\ncollection.stream()     // create stream\n    .filter(...)         // intermediate op\n    .map(...)            // intermediate op\n    .collect(...)        // terminal op\n\nExamples:\nList<Integer> nums = List.of(1,2,3,4,5,6,7,8,9,10);\n\n// Sum of even squares\nint result = nums.stream()\n    .filter(n -> n % 2 == 0)\n    .mapToInt(n -> n * n)\n    .sum();   // 220\n\n// Collect filtered items\nList<String> names = List.of("Alice","Bob","Anna");\nList<String> aNames = names.stream()\n    .filter(n -> n.startsWith("A"))\n    .sorted()\n    .collect(Collectors.toList());\n// ["Alice", "Anna"]\n\nMethod Reference:\nnums.forEach(System.out::println);\n\nCommon Terminal Ops:\ncollect()  count()  sum()  min()  max()\nanyMatch() allMatch() findFirst() reduce()\n\nBest Practices:\n• Streams are lazy – operations run only when terminal op called.\n• Use parallel stream for large datasets: .parallelStream()',

    'Multithreading':
        'Introduction:\nMultithreading runs multiple tasks concurrently to improve performance.\n\nCreate Thread – Extend Thread:\nclass MyThread extends Thread {\n    public void run() {\n        for (int i=0; i<5; i++)\n            System.out.println("T: " + i);\n    }\n}\nnew MyThread().start();\n\nCreate Thread – Implement Runnable (preferred):\nRunnable task = () -> System.out.println("Running!");\nnew Thread(task).start();\n\nSynchronization:\nclass Counter {\n    private int count = 0;\n    synchronized void increment() { count++; }\n    int getCount() { return count; }\n}\n\nExecutorService (modern):\nExecutorService pool = Executors.newFixedThreadPool(4);\npool.submit(() -> doTask());\npool.shutdown();\n\nThread States:\nNEW → RUNNABLE → BLOCKED/WAITING → TERMINATED\n\nCommon Issues:\n• Race condition: threads read/write same data\n• Deadlock: threads wait for each other\n\nBest Practices:\n• Prefer Runnable/Callable over extending Thread.\n• Use ExecutorService instead of managing threads manually.\n• Minimize synchronized blocks for performance.',

    'File I/O':
        'Introduction:\nJava File I/O reads/writes files using java.io and java.nio packages.\n\nWrite Text File:\nimport java.io.*;\n\ntry (BufferedWriter bw = new BufferedWriter(\n        new FileWriter("output.txt"))) {\n    bw.write("Hello, File!");\n    bw.newLine();\n    bw.write("Second line");\n}\n\nRead Text File:\ntry (BufferedReader br = new BufferedReader(\n        new FileReader("output.txt"))) {\n    String line;\n    while ((line = br.readLine()) != null) {\n        System.out.println(line);\n    }\n}\n\nModern NIO (Java 7+):\nimport java.nio.file.*;\n\n// Write\nFiles.writeString(Path.of("file.txt"), "Hello!");\n\n// Read all lines\nList<String> lines = Files.readAllLines(Path.of("file.txt"));\n\n// Check existence\nboolean exists = Files.exists(Path.of("file.txt"));\n\nReal-World Use Cases:\n• Config file reading\n• CSV/JSON data processing\n• Log file writing\n\nBest Practices:\n• Always use try-with-resources for auto-close.\n• Prefer NIO (java.nio.file) for modern code.',

    'JDBC':
        'Introduction:\nJDBC connects Java applications to relational databases.\n\nSteps:\n1. Load driver  2. Get connection\n3. Create statement  4. Execute query  5. Close\n\nBasic Example:\nimport java.sql.*;\n\nString url = "jdbc:mysql://localhost:3306/mydb";\nString user = "<db_user>";\nString pass = "<db_password>";\n\ntry (Connection con = DriverManager.getConnection(url, user, pass)) {\n    // CREATE table\n    Statement stmt = con.createStatement();\n    stmt.execute("CREATE TABLE IF NOT EXISTS users " +\n                 "(id INT PRIMARY KEY, name VARCHAR(50))");\n\n    // INSERT\n    PreparedStatement ps = con.prepareStatement(\n        "INSERT INTO users VALUES (?, ?)");\n    ps.setInt(1, 1);\n    ps.setString(2, "Alice");\n    ps.executeUpdate();\n\n    // SELECT\n    ResultSet rs = stmt.executeQuery("SELECT * FROM users");\n    while (rs.next()) {\n        System.out.println(rs.getInt("id") + " " + rs.getString("name"));\n    }\n}\n\nPreparedStatement vs Statement:\n• PreparedStatement: prevents SQL injection, faster for repeated queries.\n\nBest Practices:\n• Use PreparedStatement always for user input.\n• Use connection pooling (HikariCP) in production.',
  },

  // ── C LANGUAGE ──
  'C Language': {
    'Hello World':
        '#include <stdio.h>\n\nint main() {\n    printf("Hello, World!\\n");\n    return 0;\n}\n\n• #include <stdio.h> for input/output.\n• main() is entry point.\n• printf() prints text.\n• \\n = newline.',
    'Variables':
        'int age = 20;\nfloat price = 9.99;\nchar grade = \'A\';\nchar name[] = "Alice";\n\n• Must declare type before use.\n• int → whole numbers\n• float → decimal numbers\n• char → single character\n• char[] → string/text',
    'Data Types':
        'int     → 2 or 4 bytes  (42)\nfloat   → 4 bytes       (3.14)\ndouble  → 8 bytes       (3.14159)\nchar    → 1 byte        (\'A\')\n\nFormat specifiers:\n%d → int\n%f → float\n%c → char\n%s → string',
    'Input/Output':
        'Output:\nprintf("Hello\\n");\nprintf("Age: %d\\n", age);\nprintf("Name: %s\\n", name);\n\nInput:\nint age;\nscanf("%d", &age);\n\nchar name[50];\nscanf("%s", name);\n\n• & (address-of) needed for scanf\n• NOT needed for char arrays',
    'Operators':
        'Arithmetic: + - * / %\n\nint a = 10, b = 3;\nprintf("%d\\n", a + b);  // 13\nprintf("%d\\n", a % b);  // 1\n\nIncrement: a++  a--\nCompound:  a += 5\nComparison: == != > < >= <=\nLogical: && || !',
    'Conditions':
        'int age = 18;\nif (age >= 18) {\n    printf("Adult\\n");\n} else if (age >= 13) {\n    printf("Teen\\n");\n} else {\n    printf("Child\\n");\n}\n\n• Use == for comparison (not =)\n• Curly braces {} for blocks',
    'For Loop':
        'for (int i = 0; i < 5; i++) {\n    printf("%d\\n", i);\n}\n// Output: 0 1 2 3 4\n\nLoop over array:\nint nums[] = {10, 20, 30};\nfor (int i = 0; i < 3; i++) {\n    printf("%d\\n", nums[i]);\n}\n\n• break → exit loop\n• continue → skip',
    'While Loop':
        'int i = 0;\nwhile (i < 5) {\n    printf("%d\\n", i);\n    i++;\n}\n\ndo-while:\ndo {\n    printf("%d\\n", i);\n    i++;\n} while (i < 5);\n\n• Always update loop variable!\n• do-while runs at least once.',
    'Arrays':
        'int nums[5] = {10, 20, 30, 40, 50};\nprintf("%d\\n", nums[0]);  // 10\n\nInput into array:\nfor (int i = 0; i < 5; i++) {\n    scanf("%d", &nums[i]);\n}\n\n• Index starts at 0\n• Size must be fixed at declaration',
    'Functions':
        'void greet() {\n    printf("Hello!\\n");\n}\n\nint add(int a, int b) {\n    return a + b;\n}\n\nint main() {\n    greet();\n    int sum = add(3, 4);\n    printf("%d\\n", sum);  // 7\n    return 0;\n}\n\n• Declare function before main() or use prototypes.',
    'Pointers':
        'int x = 10;\nint *ptr = &x;       // ptr holds address of x\nprintf("%d\\n", *ptr); // 10 (dereference)\n*ptr = 20;\nprintf("%d\\n", x);   // 20\n\n• & → address of variable\n• * → value at address\n• Pointers are powerful but need care!',

    // ── Intermediate ──
    'Strings':
        'Introduction:\nC has no built-in String type. Strings are char arrays ending with \\0.\n\nDeclaration:\nchar name[20] = "Alice";\nchar msg[] = "Hello";   // auto-size\n\n#include <string.h>   // for string functions\n\nString Functions:\nstrlen(s)        – length (excludes \\0)\nstrcpy(dst, src) – copy string\nstrcat(dst, src) – concatenate (append)\nstrcmp(s1, s2)   – compare (0 if equal)\nstrchr(s, ch)    – find character\nstrstr(s, sub)   – find substring\n\nExamples:\nchar s1[50] = "Hello";\nchar s2[] = " World";\nstrcat(s1, s2);\nprintf("%s\\n", s1);       // Hello World\nprintf("%d\\n", strlen(s1)); // 11\n\nchar copy[50];\nstrcpy(copy, s1);\n\nif (strcmp(s1, copy) == 0)\n    printf("Strings are equal!\\n");\n\nCommon Mistake:\nchar *s = "Hello"; s[0] = \'h\'; // CRASH! (string literal)\nUse char s[] = "Hello"; instead.\n\nBest Practices:\n• Always ensure destination buffer is large enough.\n• Use strncpy/strncat for safe length-limited operations.',

    'Structures':
        'Introduction:\nStruct groups related variables of different types under one name.\n\nSyntax:\nstruct Student {\n    char name[50];\n    int  age;\n    float gpa;\n};\n\n// Create and use:\nstruct Student s1;\nstrcpy(s1.name, "Alice");\ns1.age = 20;\ns1.gpa = 3.8;\nprintf("%s age %d GPA %.1f\\n", s1.name, s1.age, s1.gpa);\n\ntypedef (alias):\ntypedef struct {\n    char name[50];\n    int  age;\n} Student;   // now use Student without struct keyword\n\nStudent s2 = {"Bob", 22};\n\nPointer to Struct:\nStudent *ptr = &s2;\nprintf("%s\\n", ptr->name);  // arrow operator ->\n// ptr->name is same as (*ptr).name\n\nArray of Structs:\nStudent class[30];\nclass[0] = s1;\n\nReal-World Use Cases:\n• Represent database records, shapes, game objects\n\nBest Practices:\n• Use typedef for cleaner code.\n• Use -> when accessing through pointer.',

    'File Handling':
        'Introduction:\nC reads/writes files using FILE pointer and stdio functions.\n\nOpen Modes:\nr  – read       w  – write (create/overwrite)\na  – append     r+ – read+write\n\nSyntax:\n#include <stdio.h>\n\nFILE *fp = fopen("data.txt", "w");\nif (fp == NULL) {\n    printf("Cannot open file!\\n");\n    return 1;\n}\nfprintf(fp, "Name: Alice\\nAge: 25\\n");\nfclose(fp);\n\nRead File:\nFILE *fp = fopen("data.txt", "r");\nchar line[100];\nwhile (fgets(line, sizeof(line), fp)) {\n    printf("%s", line);\n}\nfclose(fp);\n\nBinary File:\nfwrite(&student, sizeof(Student), 1, fp);  // write\nfread(&student,  sizeof(Student), 1, fp);  // read\n\nReal-World Use Cases:\n• Store records persistently\n• Read configuration files\n• Log program output\n\nBest Practices:\n• Always check if fopen returns NULL.\n• Always fclose() every opened file.',

    'Dynamic Memory':
        'Introduction:\nDynamic memory allocates memory at runtime using the heap.\n\nFunctions (#include <stdlib.h>):\nmalloc(size)        – allocate size bytes (uninitialized)\ncalloc(n, size)     – allocate n*size bytes (zero-initialized)\nrealloc(ptr, size)  – resize allocation\nfree(ptr)           – release memory\n\nExample:\nint n = 5;\nint *arr = (int*)malloc(n * sizeof(int));\nif (arr == NULL) { printf("Alloc failed!\\n"); return 1; }\n\nfor (int i = 0; i < n; i++) arr[i] = i * 10;\nfor (int i = 0; i < n; i++) printf("%d ", arr[i]);\n// 0 10 20 30 40\nfree(arr);   // ALWAYS free!\n\ncalloc Example (zeroed):\nint *buf = (int*)calloc(n, sizeof(int));\n// all elements initialized to 0\n\nrealloc Example:\narr = (int*)realloc(arr, 10 * sizeof(int)); // grow to 10\n\nMemory Leak:\nNot calling free() = memory leak.\nProgram consumes more and more memory.\n\nBest Practices:\n• Always check malloc result != NULL.\n• Every malloc must have a matching free.\n• Set pointer to NULL after free.',

    'Recursion':
        'Introduction:\nRecursion is when a function calls itself to solve smaller subproblems.\n\nKey Parts:\n1. Base case – stops recursion\n2. Recursive case – calls itself with smaller input\n\nFactorial:\nint factorial(int n) {\n    if (n <= 1) return 1;      // base case\n    return n * factorial(n-1); // recursive case\n}\nprintf("%d\\n", factorial(5)); // 120\n\nFibonacci:\nint fib(int n) {\n    if (n <= 1) return n;\n    return fib(n-1) + fib(n-2);\n}\n\nBinary Search (recursive):\nint bsearch(int arr[], int l, int r, int x) {\n    if (l > r) return -1;\n    int mid = (l + r) / 2;\n    if (arr[mid] == x) return mid;\n    if (arr[mid] > x)  return bsearch(arr, l, mid-1, x);\n    return bsearch(arr, mid+1, r, x);\n}\n\nReal-World Use Cases:\n• Tree traversal, file system navigation, parsing\n\nCommon Mistake:\nMissing base case → infinite recursion → stack overflow.\n\nBest Practices:\n• Always define clear base case first.\n• For large inputs, prefer iteration or memoization.',

    // ── Advanced ──
    'Linked Lists':
        'Introduction:\nLinked list is a chain of nodes. Each node holds data + pointer to next node.\n\nNode Structure:\ntypedef struct Node {\n    int data;\n    struct Node *next;\n} Node;\n\nCreate & Insert at head:\nNode* newNode(int val) {\n    Node *n = (Node*)malloc(sizeof(Node));\n    n->data = val; n->next = NULL;\n    return n;\n}\n\nNode *head = NULL;\n// Insert 3 → 2 → 1 at head:\nfor (int i=1; i<=3; i++) {\n    Node *n = newNode(i);\n    n->next = head;\n    head = n;\n}\n\nTraverse:\nNode *cur = head;\nwhile (cur != NULL) {\n    printf("%d ", cur->data);\n    cur = cur->next;\n}   // 3 2 1\n\nDelete node:\nvoid deleteNode(Node **head, int val) {\n    Node *cur=*head, *prev=NULL;\n    while(cur && cur->data!=val) { prev=cur; cur=cur->next; }\n    if(!cur) return;\n    if(!prev) *head = cur->next;\n    else prev->next = cur->next;\n    free(cur);\n}\n\nTypes: Singly, Doubly (prev+next), Circular\n\nBest Practices:\n• Free all nodes when done to prevent memory leaks.\n• Use doubly linked list when traversal in both directions needed.',

    'Stacks & Queues':
        'Introduction:\nStack: LIFO (Last In, First Out). Queue: FIFO (First In, First Out).\n\nStack using Array:\n#define MAX 100\nint stack[MAX], top = -1;\nvoid push(int x) { stack[++top] = x; }\nint  pop()       { return stack[top--]; }\nint  peek()      { return stack[top]; }\nint  isEmpty()   { return top == -1; }\n\npush(10); push(20); push(30);\nprintf("%d\\n", pop());  // 30 (last in, first out)\n\nQueue using Array:\nint queue[MAX], front=0, rear=-1, size=0;\nvoid enqueue(int x) { queue[++rear%MAX]=x; size++; }\nint  dequeue()      { size--; return queue[front++%MAX]; }\nint  qEmpty()       { return size==0; }\n\nenqueue(10); enqueue(20); enqueue(30);\nprintf("%d\\n", dequeue()); // 10 (first in, first out)\n\nReal-World Use Cases:\n• Stack: function call stack, undo/redo, balanced brackets\n• Queue: task scheduling, BFS, printer spooling\n\nBest Practices:\n• Always check isEmpty/isFull before pop/push.\n• Use circular array for efficient queue.',

    'Bit Manipulation':
        'Introduction:\nBit manipulation operates directly on bits for high performance.\n\nBitwise Operators:\n&  AND   |  OR   ^  XOR   ~  NOT\n<< left shift    >> right shift\n\nExamples:\nint a = 12;   // 0000 1100\nint b = 10;   // 0000 1010\n\nprintf("%d\\n", a & b);  // 8  (0000 1000)\nprintf("%d\\n", a | b);  // 14 (0000 1110)\nprintf("%d\\n", a ^ b);  // 6  (0000 0110)\nprintf("%d\\n", ~a);     // -13 (invert all bits)\nprintf("%d\\n", a << 1); // 24 (shift left = *2)\nprintf("%d\\n", a >> 1); // 6  (shift right = /2)\n\nCommon Tricks:\n// Check if bit i is set:\nif (n & (1 << i)) ...\n// Set bit i:\nn |= (1 << i);\n// Clear bit i:\nn &= ~(1 << i);\n// Toggle bit i:\nn ^= (1 << i);\n// Check even/odd:\nif (n & 1) // odd\n// Multiply/divide by 2:\nn << 1; // *2\nn >> 1; // /2\n\nBest Practices:\n• Use unsigned types to avoid sign extension issues.\n• Prefer named constants over magic numbers.',

    'Preprocessor':
        'Introduction:\nPreprocessor processes directives before compilation.\n\nDirectives start with #\n\n#include – include header file:\n#include <stdio.h>   // system header\n#include "mylib.h"  // local header\n\n#define – macro constants:\n#define PI 3.14159\n#define MAX_SIZE 100\nfloat area = PI * r * r;\n\n#define – function-like macro:\n#define SQUARE(x) ((x)*(x))\n#define MAX(a,b)  ((a)>(b)?(a):(b))\nprintf("%d\\n", SQUARE(5));  // 25\n\nConditional Compilation:\n#ifdef DEBUG\n    printf("Debug: value = %d\\n", x);\n#endif\n\n#ifndef MAX_SIZE\n#define MAX_SIZE 100\n#endif\n\n#if, #elif, #else, #endif:\n#if defined(_WIN32)\n    // Windows code\n#elif defined(__linux__)\n    // Linux code\n#endif\n\nHeader Guards (prevent double inclusion):\n#ifndef MYLIB_H\n#define MYLIB_H\n// header content\n#endif\n\nBest Practices:\n• Always use header guards in .h files.\n• Put parens around macro params: #define SQ(x) ((x)*(x))',
  },

  // ── HTML & CSS ──
  'HTML & CSS': {
    'HTML Basics':
        '<!DOCTYPE html>\n<html>\n  <head>\n    <title>My Page</title>\n  </head>\n  <body>\n    <h1>Welcome!</h1>\n    <p>Hello World</p>\n  </body>\n</html>\n\n• Tags come in pairs: <tag>...</tag>\n• <head> = page info\n• <body> = visible content',
    'Headings & Paragraphs':
        'Headings (h1 is biggest):\n<h1>Main Heading</h1>\n<h2>Sub Heading</h2>\n<h3>Small Heading</h3>\n\nParagraph:\n<p>This is a paragraph.</p>\n\nLine break:\n<br>\n\nHorizontal line:\n<hr>\n\n• h1 to h6 available\n• <p> adds spacing above/below',
    'Links & Images':
        'Link:\n<a href="https://google.com">Click Here</a>\n\nOpen in new tab:\n<a href="url" target="_blank">Link</a>\n\nImage:\n<img src="photo.jpg" alt="My Photo" width="200">\n\n• href = destination URL\n• src = image file path\n• alt = description (accessibility)',
    'Lists & Tables':
        'Unordered list (bullets):\n<ul>\n  <li>Apple</li>\n  <li>Banana</li>\n</ul>\n\nOrdered list (numbers):\n<ol>\n  <li>First</li>\n  <li>Second</li>\n</ol>\n\nTable:\n<table border="1">\n  <tr><th>Name</th><th>Age</th></tr>\n  <tr><td>Alice</td><td>20</td></tr>\n</table>',
    'Forms':
        '<form action="/submit" method="POST">\n  <input type="text" placeholder="Name" required>\n  <input type="email" placeholder="Email">\n  <input type="password" placeholder="Password">\n  <select>\n    <option>Option 1</option>\n  </select>\n  <button type="submit">Send</button>\n</form>\n\n• action = where data is sent\n• method = GET or POST',
    'CSS Basics':
        'Inline CSS:\n<p style="color: red;">Hello</p>\n\nInternal CSS:\n<style>\n  p { color: blue; }\n</style>\n\nExternal CSS:\n<link rel="stylesheet" href="style.css">\n\nCSS Syntax:\nselector {\n    property: value;\n}\n\n• External CSS is best practice!',
    'Colors & Backgrounds':
        'p {\n    color: red;\n    color: #FF0000;\n    color: rgb(255, 0, 0);\n}\n\ndiv {\n    background-color: lightblue;\n    background-image: url("bg.jpg");\n    background-size: cover;\n    background-repeat: no-repeat;\n}\n\n• Named colors: red, blue, green\n• Hex: #RRGGBB\n• RGB: rgb(r, g, b)',
    'Box Model':
        'Every element is a box:\n\ndiv {\n    width: 200px;\n    height: 100px;\n    padding: 20px;   /* inside space */\n    border: 2px solid black;\n    margin: 10px;    /* outside space */\n}\n\nBox Model layers (inside→out):\nContent → Padding → Border → Margin\n\n• box-sizing: border-box; includes padding in width',
    'Flexbox':
        '.container {\n    display: flex;\n    justify-content: center;  /* horizontal */\n    align-items: center;      /* vertical */\n    flex-direction: row;      /* or column */\n    gap: 10px;\n}\n\n.item {\n    flex: 1;  /* equal width */\n}\n\n• Flexbox makes layouts easy!\n• Use for navigation bars, cards',
    'Responsive Design':
        '@media (max-width: 600px) {\n    body {\n        font-size: 14px;\n    }\n    .container {\n        flex-direction: column;\n    }\n}\n\nResponsive units:\n• % → relative to parent\n• vw/vh → viewport width/height\n• em/rem → relative to font size\n\n<meta name="viewport" content="width=device-width">',
    'CSS Grid':
        '.container {\n    display: grid;\n    grid-template-columns: 1fr 1fr 1fr;\n    gap: 20px;\n}\n\n.item {\n    grid-column: span 2; /* takes 2 columns */\n}\n\n• 1fr = 1 fraction of space\n• Use for page layouts\n• grid-template-rows for row sizes',

    // ── Intermediate ──
    'CSS Animations':
        'Introduction:\nCSS Animations bring elements to life without JavaScript.\n\nTransitions (simple state change):\n.button {\n    background: blue;\n    transition: background 0.3s ease, transform 0.2s;\n}\n.button:hover {\n    background: darkblue;\n    transform: scale(1.05);\n}\n\n@keyframes (full animation):\n@keyframes slideIn {\n    0%   { transform: translateX(-100%); opacity: 0; }\n    100% { transform: translateX(0);     opacity: 1; }\n}\n.box {\n    animation: slideIn 0.5s ease forwards;\n}\n\nAnimation Properties:\nanimation-name     animation-duration\nanimation-timing-function: ease | linear | ease-in | ease-out\nanimation-delay    animation-iteration-count: infinite\nanimation-direction: normal | reverse | alternate\nanimation-fill-mode: forwards | backwards | both\n\nShorthand:\nanimation: slideIn 1s ease 0.2s infinite alternate;\n\nReal-World Use Cases:\n• Loading spinners, hover effects, page transitions\n• Skeleton loading screens, notification alerts\n\nBest Practices:\n• Use transform & opacity for GPU-accelerated animations.\n• Add prefers-reduced-motion for accessibility.',

    'CSS Variables':
        'Introduction:\nCSS Variables (Custom Properties) store reusable values.\n\nDefine & Use:\n:root {\n    --primary-color: #3498db;\n    --font-size-base: 16px;\n    --spacing-md: 1rem;\n    --border-radius: 8px;\n}\n\n.button {\n    background: var(--primary-color);\n    font-size: var(--font-size-base);\n    padding: var(--spacing-md);\n    border-radius: var(--border-radius);\n}\n\nFallback Value:\ncolor: var(--accent, #ff0000); /* fallback if not set */\n\nScoped Variables:\n.dark-theme {\n    --primary-color: #2c3e50;\n    --text-color: #ecf0f1;\n}\n\nUpdate with JavaScript:\ndocument.documentElement.style\n    .setProperty("--primary-color", "#e74c3c");\n\nDark Mode with Variables:\n@media (prefers-color-scheme: dark) {\n    :root { --bg: #1a1a1a; --text: #ffffff; }\n}\n\nBest Practices:\n• Define all variables in :root for global access.\n• Use semantic names: --color-primary, not --blue.',

    'Semantic HTML':
        'Introduction:\nSemantic HTML uses meaningful tags that describe content purpose.\n\nNon-semantic vs Semantic:\n<div id="header"> vs <header>\n<div id="nav">   vs <nav>\n<div id="main">  vs <main>\n<div id="footer"> vs <footer>\n\nKey Semantic Elements:\n<header>   – top section, logo, nav\n<nav>      – navigation links\n<main>     – primary content (one per page)\n<article>  – self-contained content (blog post)\n<section>  – thematic grouping\n<aside>    – sidebar, related content\n<footer>   – bottom section, copyright\n<figure>   – image with caption\n<figcaption> – caption for figure\n<time datetime="2024-01-01">Jan 1st</time>\n<mark>     – highlighted text\n<details> + <summary> – expandable content\n\nExample Page Structure:\n<header>\n  <nav>...</nav>\n</header>\n<main>\n  <article>\n    <h1>Title</h1>\n    <section>Content</section>\n  </article>\n  <aside>Sidebar</aside>\n</main>\n<footer>...</footer>\n\nBest Practices:\n• Use semantic tags for SEO and accessibility.\n• One <main> per page. One <h1> per page.',

    'HTML5 APIs':
        'Introduction:\nHTML5 introduced powerful browser APIs for rich web apps.\n\nLocalStorage / SessionStorage:\nlocalStorage.setItem("name", "Alice");\nlet name = localStorage.getItem("name");\nlocalStorage.removeItem("name");\n// localStorage persists forever\n// sessionStorage cleared when tab closes\n\nGeolocation:\nnavigator.geolocation.getCurrentPosition(pos => {\n    let lat = pos.coords.latitude;\n    let lon = pos.coords.longitude;\n    console.log(lat, lon);\n});\n\nCanvas API:\n<canvas id="c" width="400" height="300"></canvas>\nconst ctx = document.getElementById("c").getContext("2d");\nctx.fillStyle = "blue";\nctx.fillRect(10, 10, 100, 80);\n\nDrag and Drop:\n<div draggable="true" ondragstart="drag(event)">Item</div>\n<div ondrop="drop(event)" ondragover="event.preventDefault()">Drop Here</div>\n\nFetch API (HTTP requests):\nfetch("https://api.example.com/data")\n    .then(r => r.json())\n    .then(data => console.log(data));\n\nBest Practices:\n• Always check API support: if ("geolocation" in navigator)\n• Use HTTPS for Geolocation and other sensitive APIs.',

    'Media Queries':
        'Introduction:\nMedia queries apply CSS based on device/screen characteristics.\n\nSyntax:\n@media media-type and (feature: value) { }\n\nBreakpoints (common):\n/* Mobile first approach */\n/* default styles = mobile */\n\n@media (min-width: 600px) {   /* tablet */\n    .container { max-width: 768px; }\n}\n@media (min-width: 900px) {   /* desktop */\n    .container { max-width: 1200px; }\n}\n@media (min-width: 1200px) {  /* wide */\n    .container { max-width: 1440px; }\n}\n\nOther Features:\n@media (orientation: landscape) { }\n@media (min-resolution: 2dppx) { }  /* retina */\n@media print { body { font-size: 12pt; } }\n\nFlexbox Responsive Example:\n.nav {\n    display: flex;\n    flex-direction: column;  /* mobile: stack */\n}\n@media (min-width: 600px) {\n    .nav { flex-direction: row; }  /* desktop: row */\n}\n\nViewport Meta Tag (required for mobile):\n<meta name="viewport" content="width=device-width, initial-scale=1">\n\nBest Practices:\n• Use mobile-first (min-width) over desktop-first.\n• Test on real devices and browser DevTools.',

    // ── Advanced ──
    'CSS Preprocessors':
        'Introduction:\nCSS preprocessors add programming features to CSS: variables, nesting, mixins, functions.\n\nPopular Preprocessors: SASS/SCSS, LESS, Stylus\n\nSCSS Syntax (most popular):\n// Variables\nVAR primary: #3498db;\nVAR font-stack: "Roboto", sans-serif;\n\n// Nesting\nnav {\n    background: VAR(primary);\n    ul { list-style: none; }\n    li { display: inline; }\n    a {\n        color: white;\n        &:hover { text-decoration: underline; }\n    }\n}\n\n// Mixin (reusable block)\n@mixin flex-center {\n    display: flex;\n    justify-content: center;\n    align-items: center;\n}\n.card { @include flex-center; }\n\n// Mixin with params:\n@mixin button(VAR-bg, VAR-color: white) {\n    background: VAR-bg;\n    color: VAR-color;\n    padding: 10px 20px;\n    border-radius: 4px;\n}\n.btn-primary { @include button(VAR-primary); }\n\n// Extend/Inherit:\n%base-text { font-family: VAR(font-stack); }\np { @extend %base-text; }\n\n// Functions:\n@function rem(VAR-px) { @return VAR-px / 16px * 1rem; }\nh1 { font-size: rem(32px); }\n\nNote: In SCSS, variables use \$ prefix (e.g. \$primary, \$color).\n\nCompile:\nsass style.scss style.css\n\nBest Practices:\n• Use partial files (_variables.scss) for organization.\n• Don\'t nest more than 3 levels deep.',

    'Web Accessibility':
        'Introduction:\nAccessibility (a11y) ensures websites are usable by everyone, including people with disabilities.\n\nWCAG Guidelines: Level A, AA, AAA\n\nKey Principles (POUR):\n• Perceivable: content is visible/audible\n• Operable: navigable by keyboard\n• Understandable: clear language\n• Robust: works with assistive tech\n\nSemantic HTML (most important):\n<button> not <div class="btn">\n<label for="email">Email</label>\n<input id="email" type="email">\n\nARIA Attributes:\n<button aria-label="Close menu">X</button>\n<nav aria-label="Main navigation">\n<div role="alert">Error message!</div>\n<img src="logo.png" alt="Company Logo">\n<!-- decorative image: alt="" -->\n\nKeyboard Navigation:\na:focus, button:focus {\n    outline: 3px solid #005fcc;\n    outline-offset: 2px;\n}\n/* Never: outline: none without replacement */\n\nColor Contrast:\n• Normal text: min 4.5:1 ratio\n• Large text (18px+): min 3:1 ratio\n\nScreen Reader Tips:\n• Use skip navigation: <a href="#main">Skip to content</a>\n• Use heading hierarchy: h1 → h2 → h3\n• Provide text alternatives for all media\n\nBest Practices:\n• Test with screen readers (NVDA, VoiceOver).\n• Use axe DevTools or Lighthouse for audits.',

    'SEO Basics':
        'Introduction:\nSEO (Search Engine Optimization) improves website visibility in search results.\n\nOn-Page SEO with HTML:\n<!-- Title (most important, 50-60 chars) -->\n<title>Learn Python Online – SmartCoder</title>\n\n<!-- Meta Description (150-160 chars) -->\n<meta name="description" content="Learn Python with interactive lessons, quizzes, and coding practice.">\n\n<!-- Canonical URL (avoid duplicate content) -->\n<link rel="canonical" href="https://example.com/python">\n\n<!-- Open Graph (social sharing) -->\n<meta property="og:title" content="SmartCoder">\n<meta property="og:description" content="Learn to code!">\n<meta property="og:image" content="https://example.com/thumb.jpg">\n\nHeading Structure:\n<h1>Learn Python</h1>       <!-- one per page -->\n<h2>Variables</h2>          <!-- main sections -->\n<h3>Integer Types</h3>      <!-- sub-sections -->\n\nImages:\n<img src="python.png"\n     alt="Python snake logo representing the programming language"\n     loading="lazy">\n\nPerformance (Core Web Vitals):\n• LCP < 2.5s  – Largest Contentful Paint\n• FID < 100ms – First Input Delay\n• CLS < 0.1   – Cumulative Layout Shift\n\nStructured Data (JSON-LD):\n<script type="application/ld+json">\n{ "@type": "Course", "name": "Python Basics" }\n</script>\n\nBest Practices:\n• One <h1> per page, descriptive and keyword-rich.\n• Use HTTPS, fast loading, mobile-friendly design.\n• Write for humans first, search engines second.',
  },
};

// ─── LearningScreen ──────────────────────────────────────────────────────────

class LearningScreen extends StatelessWidget {
  final String language;
  final String level;

  LearningScreen({required this.language, this.level = 'Beginner Level'});

  List<Map<String, dynamic>> _topics() {
    return (_topicsByLangLevel[language]?[level] ?? [])
        .map((t) => t)
        .toList();
  }

  Color _langColor() {
    switch (language) {
      case 'Python':      return const Color(0xFF306998);
      case 'Java':        return const Color(0xFFF89820);
      case 'C Language':  return const Color(0xFF00599C);
      case 'HTML & CSS':  return const Color(0xFFE8431A);
      default:            return const Color(0xFF2196F3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topics = _topics();
    final color  = _langColor();

    return Scaffold(
      appBar: AppBar(
        title: Text('$language – $level'),
        backgroundColor: color,
      ),
      body: topics.isEmpty
          ? const Center(child: Text('Topics coming soon!'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                final name  = topic['name'] as String;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(topic['icon'] as IconData,
                          color: color, size: 28),
                    ),
                    title: Text(name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    subtitle: Text('Tap to learn',
                        style: TextStyle(color: Colors.grey[500])),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: color, size: 16),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicDetailScreen(
                          topic: name,
                          language: language,
                          level: level,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ─── TopicDetailScreen ────────────────────────────────────────────────────────

class TopicDetailScreen extends StatelessWidget {
  final String topic;
  final String language;
  final String level;
  final Color  color;

  const TopicDetailScreen({
    required this.topic,
    required this.language,
    required this.level,
    required this.color,
  });

  String get _bodyText =>
      _content[language]?[topic] ??
      'Content for "$topic" in $language coming soon!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.7)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb, size: 45, color: Colors.amber),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(topic,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(level,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Content box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.4), width: 1.5),
              ),
              child: Text(
                _bodyText,
                style: const TextStyle(
                    fontSize: 15, height: 1.8,
                    fontFamily: 'monospace', color: Colors.black87),
              ),
            ),
            const SizedBox(height: 28),
            // Understood button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle),
                label: const Text('Understood!',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () async {
                  await UserDataManager.markTopicCompleted(
                      '${language}_${topic}_read');
                  await UserDataManager.addPoints(20);
                  await UserDataManager.updateStreak();
                  await UserDataManager.checkAndUnlockAchievements();
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// ─── Quiz Questions Data ─────────────────────────────────────────────────────

const Map<String, Map<String, List<Map<String, dynamic>>>> _quizData = {
  'Python': {
    'Hello World': [
      {'q': 'How do you print in Python?', 'options': ['print("Hello")', 'echo "Hello"', 'console.log("Hello")', 'printf("Hello")'], 'correct': 0},
      {'q': 'Python needs semicolons at end of line?', 'options': ['No', 'Yes', 'Sometimes', 'Always'], 'correct': 0},
      {'q': 'What does print() do?', 'options': ['Displays output', 'Takes input', 'Deletes data', 'Saves file'], 'correct': 0},
      {'q': 'Which is correct Python print?', 'options': ['print("Hi")', 'Print("Hi")', 'PRINT("Hi")', 'println("Hi")'], 'correct': 0},
    ],
    'Variables': [
      {'q': 'How to create a variable in Python?', 'options': ['name = "Ali"', 'var name = "Ali"', 'String name = "Ali"', 'let name = "Ali"'], 'correct': 0},
      {'q': 'Which is a valid variable name?', 'options': ['my_name', '123name', 'my-name', 'my name'], 'correct': 0},
      {'q': 'Python needs type declaration?', 'options': ['No', 'Yes', 'Only for int', 'Only for string'], 'correct': 0},
      {'q': 'What is x = 5?', 'options': ['Variable assignment', 'Comparison', 'Function call', 'Import'], 'correct': 0},
    ],
    'Data Types': [
      {'q': 'What type is "Hello"?', 'options': ['str', 'int', 'bool', 'list'], 'correct': 0},
      {'q': 'What type is 25?', 'options': ['int', 'str', 'float', 'bool'], 'correct': 0},
      {'q': 'What type is 3.14?', 'options': ['float', 'int', 'str', 'double'], 'correct': 0},
      {'q': 'What type is True?', 'options': ['bool', 'str', 'int', 'none'], 'correct': 0},
    ],
    'Input/Output': [
      {'q': 'How to get user input in Python?', 'options': ['input()', 'scan()', 'read()', 'get()'], 'correct': 0},
      {'q': 'input() returns which type?', 'options': ['str', 'int', 'float', 'bool'], 'correct': 0},
      {'q': 'How to print variable name?', 'options': ['print(name)', 'print("name")', 'echo name', 'show(name)'], 'correct': 0},
      {'q': 'Convert input to int?', 'options': ['int(input())', 'input(int)', 'integer(input())', 'toInt(input())'], 'correct': 0},
    ],
    'Operators': [
      {'q': 'What is 10 % 3?', 'options': ['1', '3', '0', '10'], 'correct': 0},
      {'q': 'What is 2 ** 3?', 'options': ['8', '6', '9', '5'], 'correct': 0},
      {'q': 'What is 10 // 3?', 'options': ['3', '3.33', '1', '0'], 'correct': 0},
      {'q': 'Which checks equality?', 'options': ['==', '=', '!=', '=>'], 'correct': 0},
    ],
    'Conditions': [
      {'q': 'Python uses elif for?', 'options': ['else if', 'end if', 'exit if', 'error if'], 'correct': 0},
      {'q': 'What runs when if is False?', 'options': ['else', 'then', 'when', 'default'], 'correct': 0},
      {'q': 'Indentation in Python is?', 'options': ['Required', 'Optional', 'Not needed', 'Only for loops'], 'correct': 0},
      {'q': 'Which is correct if syntax?', 'options': ['if x > 5:', 'if (x > 5)', 'if x > 5 then', 'if{x > 5}'], 'correct': 0},
    ],
    'For Loop': [
      {'q': 'range(5) gives?', 'options': ['0,1,2,3,4', '1,2,3,4,5', '0,1,2,3,4,5', '1,2,3,4'], 'correct': 0},
      {'q': 'How to exit a loop early?', 'options': ['break', 'exit', 'stop', 'end'], 'correct': 0},
      {'q': 'How to skip an iteration?', 'options': ['continue', 'skip', 'pass', 'next'], 'correct': 0},
      {'q': 'for i in range(3) runs how many times?', 'options': ['3', '4', '2', '0'], 'correct': 0},
    ],
    'While Loop': [
      {'q': 'while True: creates?', 'options': ['Infinite loop', 'Runs once', 'Error', 'Nothing'], 'correct': 0},
      {'q': 'What stops a while loop?', 'options': ['break or condition False', 'continue', 'pass', 'return'], 'correct': 0},
      {'q': 'i += 1 means?', 'options': ['i = i + 1', 'i = 1', 'i + 1', 'i = i - 1'], 'correct': 0},
      {'q': 'Which is correct while syntax?', 'options': ['while i < 5:', 'while (i < 5)', 'while i < 5 do', 'loop i < 5:'], 'correct': 0},
    ],
    'Lists': [
      {'q': 'How to access first item?', 'options': ['list[0]', 'list[1]', 'list.first()', 'list(0)'], 'correct': 0},
      {'q': 'How to add item to list?', 'options': ['list.append(x)', 'list.add(x)', 'list.push(x)', 'list.insert(x)'], 'correct': 0},
      {'q': 'How to get list length?', 'options': ['len(list)', 'list.length', 'list.size()', 'count(list)'], 'correct': 0},
      {'q': 'Lists in Python use?', 'options': ['[ ]', '{ }', '( )', '< >'], 'correct': 0},
    ],
    'Functions': [
      {'q': 'How to define a function?', 'options': ['def myFunc():', 'function myFunc()', 'func myFunc()', 'void myFunc()'], 'correct': 0},
      {'q': 'How to return a value?', 'options': ['return value', 'send value', 'give value', 'output value'], 'correct': 0},
      {'q': 'How to call a function?', 'options': ['myFunc()', 'call myFunc()', 'run myFunc()', 'start myFunc()'], 'correct': 0},
      {'q': 'Parameters go in?', 'options': ['parentheses ()', 'brackets []', 'braces {}', 'angle <>'], 'correct': 0},
    ],
    'String Methods': [
      {'q': '"hello".upper() gives?', 'options': ['HELLO', 'Hello', 'hello', 'hELLO'], 'correct': 0},
      {'q': '"  hi  ".strip() gives?', 'options': ['hi', '  hi  ', 'hi  ', '  hi'], 'correct': 0},
      {'q': 'How to get string length?', 'options': ['len("hello")', '"hello".length', '"hello".size()', 'count("hello")'], 'correct': 0},
      {'q': '"hello world".split() gives?', 'options': ['["hello","world"]', '"hello","world"', 'hello world', 'error'], 'correct': 0},
    ],
    'Dictionaries': [
      {'q': 'Dictionary stores?', 'options': ['Key-value pairs', 'Ordered list', 'Unique values', 'Fixed data'], 'correct': 0},
      {'q': 'How to safely access a key?', 'options': ['dict.get(key)', 'dict[key]', 'dict.find(key)', 'dict.fetch(key)'], 'correct': 0},
      {'q': 'How to get all keys?', 'options': ['dict.keys()', 'dict.all()', 'keys(dict)', 'dict.list()'], 'correct': 0},
      {'q': 'Delete a key from dict?', 'options': ['del dict[key]', 'dict.delete(key)', 'remove(dict, key)', 'dict.pop(key)'], 'correct': 0},
    ],
    'Tuples & Sets': [
      {'q': 'Tuple is?', 'options': ['Immutable sequence', 'Mutable sequence', 'Unordered unique', 'Key-value pairs'], 'correct': 0},
      {'q': 'Set removes?', 'options': ['Duplicates', 'Ordered items', 'All items', 'None'], 'correct': 0},
      {'q': 'Tuple uses?', 'options': ['( )', '[ ]', '{ }', '< >'], 'correct': 0},
      {'q': 'Set intersection operator?', 'options': ['&', '|', '-', '^'], 'correct': 0},
    ],
    'File Handling': [
      {'q': 'Open file in Python?', 'options': ['open("file", "r")', 'file.open("r")', 'read("file")', 'load("file")'], 'correct': 0},
      {'q': 'Best way to open files?', 'options': ['with statement', 'try-except', 'open and close', 'import'], 'correct': 0},
      {'q': 'Write mode in Python?', 'options': ['"w"', '"r"', '"a"', '"x"'], 'correct': 0},
      {'q': 'Read all lines from file?', 'options': ['f.readlines()', 'f.read()', 'f.readline()', 'f.lines()'], 'correct': 0},
    ],
    'Exception Handling': [
      {'q': 'How to handle errors in Python?', 'options': ['try-except', 'if-else', 'while-catch', 'handle-error'], 'correct': 0},
      {'q': 'finally block runs?', 'options': ['Always', 'Only on error', 'Only on success', 'Never'], 'correct': 0},
      {'q': 'How to raise an exception?', 'options': ['raise ValueError("msg")', 'throw ValueError("msg")', 'error ValueError("msg")', 'signal ValueError("msg")'], 'correct': 0},
      {'q': 'ZeroDivisionError occurs when?', 'options': ['Dividing by zero', 'Adding strings', 'Index out of range', 'File not found'], 'correct': 0},
    ],
    'Classes & Objects': [
      {'q': '__init__ method is?', 'options': ['Constructor', 'Destructor', 'Static method', 'Class method'], 'correct': 0},
      {'q': 'self refers to?', 'options': ['Current object', 'Class itself', 'Parent class', 'Module'], 'correct': 0},
      {'q': 'Create object in Python?', 'options': ['obj = MyClass()', 'obj = new MyClass()', 'obj = MyClass.create()', 'obj = create(MyClass)'], 'correct': 0},
      {'q': 'Class variable is shared by?', 'options': ['All objects', 'Only one object', 'Parent class', 'No object'], 'correct': 0},
    ],
    'Inheritance': [
      {'q': 'How to inherit a class in Python?', 'options': ['class Dog(Animal):', 'class Dog extends Animal:', 'class Dog inherits Animal:', 'class Dog : Animal:'], 'correct': 0},
      {'q': 'super() calls?', 'options': ['Parent class method', 'Child class method', 'Static method', 'Class method'], 'correct': 0},
      {'q': 'Method overriding means?', 'options': ['Redefine parent method in child', 'Delete parent method', 'Call parent method', 'Add new method'], 'correct': 0},
      {'q': 'Python supports multiple inheritance?', 'options': ['Yes', 'No', 'Only single', 'Only double'], 'correct': 0},
    ],
    'Modules': [
      {'q': 'How to import a module?', 'options': ['import math', '#include math', 'using math', 'require math'], 'correct': 0},
      {'q': 'Import specific function?', 'options': ['from math import sqrt', 'import math.sqrt', 'use math.sqrt', 'get math.sqrt'], 'correct': 0},
      {'q': 'Import with alias?', 'options': ['import numpy as np', 'import numpy = np', 'numpy as np', 'alias numpy np'], 'correct': 0},
      {'q': 'Random number 1-10?', 'options': ['random.randint(1,10)', 'random.random(10)', 'rand(1,10)', 'random(1,10)'], 'correct': 0},
    ],
    'Decorators': [
      {'q': 'Decorator syntax in Python?', 'options': ['@decorator_name', '#decorator_name', '!decorator_name', '&decorator_name'], 'correct': 0},
      {'q': 'Decorator is a function that?', 'options': ['Takes and returns a function', 'Deletes a function', 'Copies a function', 'Renames a function'], 'correct': 0},
      {'q': '@staticmethod decorator means?', 'options': ['No self parameter', 'Takes cls parameter', 'Returns nothing', 'Deletes method'], 'correct': 0},
      {'q': 'functools.wraps preserves?', 'options': ['Function metadata', 'Function code', 'Function arguments', 'Function return value'], 'correct': 0},
    ],
    'Generators': [
      {'q': 'Generator uses which keyword?', 'options': ['yield', 'return', 'produce', 'output'], 'correct': 0},
      {'q': 'Generator advantage is?', 'options': ['Memory efficient', 'Faster code', 'Easier syntax', 'More readable'], 'correct': 0},
      {'q': 'Get next value from generator?', 'options': ['next(gen)', 'gen.next()', 'yield(gen)', 'gen.get()'], 'correct': 0},
      {'q': 'Generator expression uses?', 'options': ['( ) parentheses', '[ ] brackets', '{ } braces', '< > angles'], 'correct': 0},
    ],
    'Lambda Functions': [
      {'q': 'Lambda is?', 'options': ['Anonymous function', 'Named function', 'Class method', 'Module'], 'correct': 0},
      {'q': 'Lambda syntax?', 'options': ['lambda x: x*2', 'def lambda x: x*2', 'anonymous x: x*2', 'func x: x*2'], 'correct': 0},
      {'q': 'filter() with lambda?', 'options': ['Keeps matching elements', 'Transforms elements', 'Sorts elements', 'Counts elements'], 'correct': 0},
      {'q': 'map() with lambda?', 'options': ['Applies function to each element', 'Filters elements', 'Reduces elements', 'Sorts elements'], 'correct': 0},
    ],
    'List Comprehension': [
      {'q': 'List comprehension syntax?', 'options': ['[x for x in range(5)]', '{x for x in range(5)}', '(x for x in range(5))', '<x for x in range(5)>'], 'correct': 0},
      {'q': 'Filter in comprehension uses?', 'options': ['if condition', 'where condition', 'filter condition', 'when condition'], 'correct': 0},
      {'q': 'List comprehension vs for loop?', 'options': ['Comprehension is faster', 'For loop is faster', 'Same speed', 'Depends on data'], 'correct': 0},
      {'q': 'Dict comprehension uses?', 'options': ['{k: v for k,v in items}', '[k: v for k,v in items]', '(k: v for k,v in items)', '<k: v for k,v in items>'], 'correct': 0},
    ],
    'Regex': [
      {'q': 'Import regex in Python?', 'options': ['import re', 'import regex', 'from regex import *', 'use re'], 'correct': 0},
      {'q': 'Find all matches?', 'options': ['re.findall()', 're.search()', 're.match()', 're.find()'], 'correct': 0},
      {'q': '\\d in regex matches?', 'options': ['Digit 0-9', 'Any character', 'Word character', 'Whitespace'], 'correct': 0},
      {'q': 'Raw string for regex?', 'options': ['r"pattern"', 'raw"pattern"', 'regex"pattern"', 'r(pattern)'], 'correct': 0},
    ],
    'Multithreading': [
      {'q': 'Import for threading?', 'options': ['import threading', 'import thread', 'import multithread', 'import parallel'], 'correct': 0},
      {'q': 'Start a thread?', 'options': ['t.start()', 't.run()', 't.begin()', 't.execute()'], 'correct': 0},
      {'q': 'Prevent race conditions?', 'options': ['threading.Lock()', 'threading.Block()', 'threading.Mutex()', 'threading.Guard()'], 'correct': 0},
      {'q': 'Python GIL limits?', 'options': ['True parallelism for CPU tasks', 'All threading', 'I/O operations', 'Memory access'], 'correct': 0},
    ],
  },

  'Java': {
    'Hello World': [
      {'q': 'Java print statement?', 'options': ['System.out.println()', 'print()', 'console.log()', 'echo()'], 'correct': 0},
      {'q': 'Entry point of Java program?', 'options': ['main()', 'start()', 'run()', 'init()'], 'correct': 0},
      {'q': 'Every Java statement ends with?', 'options': [';', '.', ',', ':'], 'correct': 0},
      {'q': 'println vs print?', 'options': ['println adds newline', 'print adds newline', 'Same thing', 'println is faster'], 'correct': 0},
    ],
    'Variables': [
      {'q': 'Java variable declaration?', 'options': ['int age = 20;', 'age = 20', 'var age = 20', 'let age = 20'], 'correct': 0},
      {'q': 'Type for decimal numbers?', 'options': ['double', 'int', 'String', 'char'], 'correct': 0},
      {'q': 'Type for text in Java?', 'options': ['String', 'str', 'text', 'char'], 'correct': 0},
      {'q': 'Type for whole numbers?', 'options': ['int', 'float', 'double', 'long'], 'correct': 0},
    ],
    'Data Types': [
      {'q': 'Which is NOT a primitive type?', 'options': ['String', 'int', 'boolean', 'char'], 'correct': 0},
      {'q': 'boolean holds?', 'options': ['true/false', '0 or 1', 'yes or no', 'on or off'], 'correct': 0},
      {'q': 'char holds?', 'options': ['Single character', 'Multiple chars', 'Integer', 'Boolean'], 'correct': 0},
      {'q': 'double vs float?', 'options': ['double has more precision', 'float has more precision', 'Same', 'double is integer'], 'correct': 0},
    ],
    'Operators': [
      {'q': 'a++ means?', 'options': ['a = a + 1', 'a + 1', 'a = 1', 'a * a'], 'correct': 0},
      {'q': 'Logical AND in Java?', 'options': ['&&', '&', 'AND', 'and'], 'correct': 0},
      {'q': 'Not equal operator?', 'options': ['!=', '<>', 'NOT=', '=/='], 'correct': 0},
      {'q': 'a += 5 means?', 'options': ['a = a + 5', 'a + 5', 'a = 5', 'a = a * 5'], 'correct': 0},
    ],
    'Conditions': [
      {'q': 'Java if syntax?', 'options': ['if (x > 5) {}', 'if x > 5:', 'if x > 5 then', 'if[x > 5]'], 'correct': 0},
      {'q': 'else if in Java?', 'options': ['else if', 'elif', 'elseif', 'otherwise'], 'correct': 0},
      {'q': 'Condition must be in?', 'options': ['parentheses ()', 'brackets []', 'braces {}', 'quotes ""'], 'correct': 0},
      {'q': 'Block of code goes in?', 'options': ['braces {}', 'parentheses ()', 'brackets []', 'indentation'], 'correct': 0},
    ],
    'For Loop': [
      {'q': 'Java for loop syntax?', 'options': ['for(int i=0;i<5;i++)', 'for i in range(5)', 'for(i=0 to 5)', 'loop 5 times'], 'correct': 0},
      {'q': 'For-each syntax?', 'options': ['for(int n : nums)', 'for n in nums', 'foreach(n in nums)', 'for each n nums'], 'correct': 0},
      {'q': 'i++ in for loop?', 'options': ['Increases i by 1', 'Decreases i by 1', 'Resets i', 'Stops loop'], 'correct': 0},
      {'q': 'break in Java loop?', 'options': ['Exits the loop', 'Skips iteration', 'Continues loop', 'Restarts loop'], 'correct': 0},
    ],
    'While Loop': [
      {'q': 'Java while syntax?', 'options': ['while(i < 5)', 'while i < 5:', 'while(i < 5):', 'while i < 5'], 'correct': 0},
      {'q': 'do-while runs at least?', 'options': ['Once', 'Twice', 'Zero times', 'Five times'], 'correct': 0},
      {'q': 'Difference: while vs do-while?', 'options': ['do-while checks after', 'while checks after', 'Same', 'do-while is faster'], 'correct': 0},
      {'q': 'Infinite loop in Java?', 'options': ['while(true)', 'while(1)', 'loop()', 'forever()'], 'correct': 0},
    ],
    'Arrays': [
      {'q': 'Declare int array in Java?', 'options': ['int[] arr = new int[5]', 'array int[5]', 'int arr(5)', 'new array[5]'], 'correct': 0},
      {'q': 'First element index?', 'options': ['0', '1', '-1', '2'], 'correct': 0},
      {'q': 'Array size?', 'options': ['arr.length', 'arr.size()', 'len(arr)', 'arr.count'], 'correct': 0},
      {'q': 'Array size is?', 'options': ['Fixed', 'Dynamic', 'Unlimited', 'Zero'], 'correct': 0},
    ],
    'Methods': [
      {'q': 'void means?', 'options': ['No return value', 'Returns int', 'Returns String', 'Empty method'], 'correct': 0},
      {'q': 'How to call a method?', 'options': ['object.method()', 'call method()', 'run method()', 'method.call()'], 'correct': 0},
      {'q': 'Return keyword does?', 'options': ['Sends value back', 'Prints value', 'Stores value', 'Deletes value'], 'correct': 0},
      {'q': 'static method can be called?', 'options': ['Without object', 'Only with object', 'Only in main', 'Never'], 'correct': 0},
    ],
    'Scanner Input': [
      {'q': 'Scanner import?', 'options': ['import java.util.Scanner', 'import Scanner', 'include Scanner', 'use Scanner'], 'correct': 0},
      {'q': 'Read String with Scanner?', 'options': ['sc.nextLine()', 'sc.nextString()', 'sc.getString()', 'sc.readLine()'], 'correct': 0},
      {'q': 'Read int with Scanner?', 'options': ['sc.nextInt()', 'sc.getInt()', 'sc.readInt()', 'sc.parseInt()'], 'correct': 0},
      {'q': 'Scanner reads from?', 'options': ['System.in', 'System.out', 'File', 'Network'], 'correct': 0},
    ],
    'Classes & Objects': [
      {'q': 'Class is a?', 'options': ['Blueprint', 'Variable', 'Loop', 'Function'], 'correct': 0},
      {'q': 'Create object in Java?', 'options': ['new ClassName()', 'create ClassName()', 'make ClassName()', 'ClassName.new()'], 'correct': 0},
      {'q': 'Class variables are called?', 'options': ['Fields/Attributes', 'Methods', 'Constructors', 'Parameters'], 'correct': 0},
      {'q': 'Class functions are called?', 'options': ['Methods', 'Fields', 'Variables', 'Objects'], 'correct': 0},
    ],
    'Constructors': [
      {'q': 'Constructor name must be?', 'options': ['Same as class name', 'Different from class', 'Lowercase', 'Starting with get'], 'correct': 0},
      {'q': 'Constructor has return type?', 'options': ['No return type', 'void', 'int', 'boolean'], 'correct': 0},
      {'q': 'this.name in constructor refers to?', 'options': ['Instance variable', 'Local variable', 'Static variable', 'Parameter'], 'correct': 0},
      {'q': 'this() in constructor calls?', 'options': ['Another constructor', 'Parent constructor', 'Static method', 'Main method'], 'correct': 0},
    ],
    'Inheritance': [
      {'q': 'Keyword to inherit in Java?', 'options': ['extends', 'implements', 'inherits', 'super'], 'correct': 0},
      {'q': 'Call parent constructor?', 'options': ['super()', 'parent()', 'this()', 'base()'], 'correct': 0},
      {'q': '@Override annotation?', 'options': ['Marks overridden method', 'Creates new method', 'Deletes method', 'Makes method static'], 'correct': 0},
      {'q': 'Java supports multiple inheritance via?', 'options': ['Interfaces', 'extends', 'super', 'abstract'], 'correct': 0},
    ],
    'Interfaces': [
      {'q': 'Keyword to implement interface?', 'options': ['implements', 'extends', 'uses', 'inherits'], 'correct': 0},
      {'q': 'Interface methods are by default?', 'options': ['Abstract', 'Final', 'Static', 'Private'], 'correct': 0},
      {'q': 'Class can implement how many interfaces?', 'options': ['Multiple', 'Only one', 'Two maximum', 'None'], 'correct': 0},
      {'q': 'default method in interface (Java 8+)?', 'options': ['Has a body', 'Has no body', 'Is abstract', 'Is private'], 'correct': 0},
    ],
    'Exception Handling': [
      {'q': 'Java exception handling keyword?', 'options': ['try-catch', 'try-except', 'handle-error', 'attempt-fail'], 'correct': 0},
      {'q': 'Checked exceptions must be?', 'options': ['Caught or declared', 'Ignored', 'Thrown only', 'Logged only'], 'correct': 0},
      {'q': 'throw keyword does?', 'options': ['Throws an exception', 'Catches exception', 'Declares exception', 'Handles exception'], 'correct': 0},
      {'q': 'NullPointerException is?', 'options': ['Unchecked exception', 'Checked exception', 'Error', 'Warning'], 'correct': 0},
    ],
    'ArrayList': [
      {'q': 'ArrayList import?', 'options': ['import java.util.ArrayList', 'import java.ArrayList', 'import ArrayList', 'import util.ArrayList'], 'correct': 0},
      {'q': 'Add item to ArrayList?', 'options': ['list.add(item)', 'list.append(item)', 'list.push(item)', 'list.insert(item)'], 'correct': 0},
      {'q': 'ArrayList size?', 'options': ['list.size()', 'list.length', 'list.count()', 'len(list)'], 'correct': 0},
      {'q': 'ArrayList vs Array?', 'options': ['ArrayList is dynamic', 'Array is dynamic', 'Same thing', 'ArrayList is slower'], 'correct': 0},
    ],
    'HashMap': [
      {'q': 'HashMap stores?', 'options': ['Key-value pairs', 'Ordered list', 'Unique values', 'Sorted data'], 'correct': 0},
      {'q': 'Add to HashMap?', 'options': ['map.put(key, val)', 'map.add(key, val)', 'map.set(key, val)', 'map.insert(key, val)'], 'correct': 0},
      {'q': 'Get value safely from HashMap?', 'options': ['map.getOrDefault(key, 0)', 'map.get(key)', 'map.find(key)', 'map.fetch(key)'], 'correct': 0},
      {'q': 'Iterate HashMap entries?', 'options': ['map.entrySet()', 'map.entries()', 'map.pairs()', 'map.items()'], 'correct': 0},
    ],
    'String Methods': [
      {'q': 'Java String is?', 'options': ['Immutable', 'Mutable', 'Primitive', 'Array'], 'correct': 0},
      {'q': 'Compare strings correctly in Java?', 'options': ['s1.equals(s2)', 's1 == s2', 's1.compare(s2)', 's1.same(s2)'], 'correct': 0},
      {'q': 'Get substring in Java?', 'options': ['s.substring(0, 5)', 's.slice(0, 5)', 's.sub(0, 5)', 's.part(0, 5)'], 'correct': 0},
      {'q': 'Efficient string concatenation?', 'options': ['StringBuilder', 'String +', 'StringBuffer only', 'concat()'], 'correct': 0},
    ],
    'Generics': [
      {'q': 'Generic type parameter symbol?', 'options': ['<T>', '[T]', '{T}', '(T)'], 'correct': 0},
      {'q': '<T extends Number> means?', 'options': ['T must be Number or subclass', 'T must extend class', 'T is integer only', 'T is any type'], 'correct': 0},
      {'q': 'Benefit of generics?', 'options': ['Type safety at compile time', 'Faster execution', 'Less memory', 'More methods'], 'correct': 0},
      {'q': 'Wildcard in generics?', 'options': ['?', '*', 'T', 'E'], 'correct': 0},
    ],
    'Streams & Lambda': [
      {'q': 'Java Stream is available since?', 'options': ['Java 8', 'Java 5', 'Java 11', 'Java 6'], 'correct': 0},
      {'q': 'Lambda syntax in Java?', 'options': ['(x) -> x*2', 'lambda x: x*2', 'def x: x*2', 'x => x*2'], 'correct': 0},
      {'q': 'Stream terminal operation?', 'options': ['collect()', 'filter()', 'map()', 'sorted()'], 'correct': 0},
      {'q': 'Method reference example?', 'options': ['System.out::println', 'System.out.println', '::println', 'System::println'], 'correct': 0},
    ],
    'Multithreading': [
      {'q': 'Preferred way to create thread?', 'options': ['Implement Runnable', 'Extend Thread', 'Use static', 'Use lambda only'], 'correct': 0},
      {'q': 'synchronized keyword prevents?', 'options': ['Race conditions', 'Compilation errors', 'Memory leaks', 'Deadlocks'], 'correct': 0},
      {'q': 'ExecutorService is used for?', 'options': ['Thread pool management', 'File I/O', 'Network calls', 'Database'], 'correct': 0},
      {'q': 'Deadlock in Java occurs when?', 'options': ['Threads wait for each other', 'Thread runs forever', 'Thread crashes', 'Thread starts'], 'correct': 0},
    ],
    'File I/O': [
      {'q': 'Best practice for file I/O?', 'options': ['try-with-resources', 'try-catch only', 'finally block only', 'No special handling'], 'correct': 0},
      {'q': 'Modern Java file API?', 'options': ['java.nio.file.Files', 'java.io.File', 'java.util.File', 'java.fs.File'], 'correct': 0},
      {'q': 'Write text file in Java (NIO)?', 'options': ['Files.writeString()', 'File.write()', 'FileWriter.write()', 'PrintWriter.print()'], 'correct': 0},
      {'q': 'BufferedReader is better than FileReader because?', 'options': ['Buffered reading is faster', 'More methods', 'Less memory', 'Easier syntax'], 'correct': 0},
    ],
    'JDBC': [
      {'q': 'JDBC connects Java to?', 'options': ['Relational databases', 'File system', 'Web services', 'Memory'], 'correct': 0},
      {'q': 'PreparedStatement prevents?', 'options': ['SQL injection', 'Memory leaks', 'Thread issues', 'Null pointers'], 'correct': 0},
      {'q': 'ResultSet.next() does?', 'options': ['Moves to next row', 'Closes connection', 'Executes query', 'Commits transaction'], 'correct': 0},
      {'q': 'Connection URL format?', 'options': ['jdbc:mysql://host:port/db', 'mysql://host:port/db', 'db://host:port/mysql', 'host:port/mysql/jdbc'], 'correct': 0},
    ],
  },

  'C Language': {
    'Hello World': [
      {'q': 'C print function?', 'options': ['printf()', 'print()', 'cout()', 'echo()'], 'correct': 0},
      {'q': 'Required header for printf?', 'options': ['#include <stdio.h>', '#include <iostream>', '#include <print.h>', 'no header'], 'correct': 0},
      {'q': 'Entry point in C?', 'options': ['main()', 'start()', 'begin()', 'run()'], 'correct': 0},
      {'q': 'Newline character in C?', 'options': ['\\n', '\\t', '\\r', '\\n\\r'], 'correct': 0},
    ],
    'Variables': [
      {'q': 'Declare integer in C?', 'options': ['int x = 5;', 'var x = 5;', 'x = 5;', 'integer x = 5;'], 'correct': 0},
      {'q': 'Type for decimal in C?', 'options': ['float', 'int', 'char', 'decimal'], 'correct': 0},
      {'q': 'Type for single character?', 'options': ['char', 'string', 'text', 'letter'], 'correct': 0},
      {'q': 'C needs type declaration?', 'options': ['Yes always', 'No', 'Only sometimes', 'Only for int'], 'correct': 0},
    ],
    'Data Types': [
      {'q': 'Format specifier for int?', 'options': ['%d', '%f', '%c', '%s'], 'correct': 0},
      {'q': 'Format specifier for float?', 'options': ['%f', '%d', '%c', '%s'], 'correct': 0},
      {'q': 'Format specifier for string?', 'options': ['%s', '%d', '%f', '%c'], 'correct': 0},
      {'q': 'double vs float in C?', 'options': ['double has more precision', 'float has more precision', 'Same', 'double is integer'], 'correct': 0},
    ],
    'Input/Output': [
      {'q': 'Read integer with scanf?', 'options': ['scanf("%d", &x)', 'scanf("%d", x)', 'input("%d", x)', 'read(x)'], 'correct': 0},
      {'q': '& in scanf means?', 'options': ['Address of variable', 'Value of variable', 'AND operator', 'Reference'], 'correct': 0},
      {'q': 'printf shows output on?', 'options': ['Screen', 'File', 'Memory', 'Network'], 'correct': 0},
      {'q': '%d in printf means?', 'options': ['Integer', 'Float', 'String', 'Character'], 'correct': 0},
    ],
    'Operators': [
      {'q': 'Remainder operator in C?', 'options': ['%', '/', '//', '**'], 'correct': 0},
      {'q': 'a++ means?', 'options': ['a = a + 1', 'a + 1', 'a = 1', 'a * a'], 'correct': 0},
      {'q': 'Equal comparison in C?', 'options': ['==', '=', '!=', '==='], 'correct': 0},
      {'q': 'Logical AND in C?', 'options': ['&&', '&', 'AND', 'and'], 'correct': 0},
    ],
    'Conditions': [
      {'q': 'C if syntax?', 'options': ['if (x > 5) {}', 'if x > 5:', 'if x > 5 then', 'if[x > 5]'], 'correct': 0},
      {'q': 'else if in C?', 'options': ['else if', 'elif', 'elseif', 'otherwise'], 'correct': 0},
      {'q': 'switch-case used for?', 'options': ['Multiple conditions', 'Loops', 'Functions', 'Arrays'], 'correct': 0},
      {'q': 'break in switch-case?', 'options': ['Exits the case', 'Continues next case', 'Restarts switch', 'Ignored'], 'correct': 0},
    ],
    'For Loop': [
      {'q': 'C for loop syntax?', 'options': ['for(int i=0;i<5;i++)', 'for i in range(5)', 'for(i=0 to 5)', 'loop 5 times'], 'correct': 0},
      {'q': 'i++ in for loop?', 'options': ['Increases i by 1', 'Decreases i', 'Resets i', 'Stops loop'], 'correct': 0},
      {'q': 'break statement?', 'options': ['Exits loop', 'Skips iteration', 'Restarts loop', 'Nothing'], 'correct': 0},
      {'q': 'continue statement?', 'options': ['Skips to next iteration', 'Exits loop', 'Restarts loop', 'Stops program'], 'correct': 0},
    ],
    'While Loop': [
      {'q': 'C while syntax?', 'options': ['while(i < 5)', 'while i < 5:', 'while i < 5 do', 'loop(i < 5)'], 'correct': 0},
      {'q': 'do-while checks condition?', 'options': ['After execution', 'Before execution', 'During execution', 'Never'], 'correct': 0},
      {'q': 'Infinite loop in C?', 'options': ['while(1)', 'while(true)', 'loop()', 'forever()'], 'correct': 0},
      {'q': 'Loop variable must be?', 'options': ['Updated in loop', 'Static', 'Global', 'Constant'], 'correct': 0},
    ],
    'Arrays': [
      {'q': 'Declare array in C?', 'options': ['int arr[5]', 'array int[5]', 'int arr(5)', 'new int[5]'], 'correct': 0},
      {'q': 'First element index?', 'options': ['0', '1', '-1', '2'], 'correct': 0},
      {'q': 'Access element at index 2?', 'options': ['arr[2]', 'arr(2)', 'arr{2}', 'arr.2'], 'correct': 0},
      {'q': 'Array size in C is?', 'options': ['Fixed at declaration', 'Dynamic', 'Unlimited', 'Automatic'], 'correct': 0},
    ],
    'Functions': [
      {'q': 'void function returns?', 'options': ['Nothing', 'int', 'String', 'bool'], 'correct': 0},
      {'q': 'Function must be declared?', 'options': ['Before use or prototype', 'After use', 'Anywhere', 'Inside main'], 'correct': 0},
      {'q': 'return statement does?', 'options': ['Sends value back', 'Prints value', 'Stores value', 'Deletes value'], 'correct': 0},
      {'q': 'main() returns?', 'options': ['int (0 for success)', 'void', 'String', 'bool'], 'correct': 0},
    ],
    'Pointers': [
      {'q': '& operator gives?', 'options': ['Address of variable', 'Value of variable', 'AND operation', 'Nothing'], 'correct': 0},
      {'q': '* in pointer declaration?', 'options': ['Pointer variable', 'Multiply', 'Dereference only', 'Nothing'], 'correct': 0},
      {'q': '*ptr gives?', 'options': ['Value at address', 'Address', 'Pointer itself', 'Error'], 'correct': 0},
      {'q': 'int *ptr = &x means?', 'options': ['ptr stores address of x', 'ptr = x value', 'ptr is int', 'x is pointer'], 'correct': 0},
    ],
    'Strings': [
      {'q': 'C strings end with?', 'options': ['\\0 null character', ';', '.', '"'], 'correct': 0},
      {'q': 'String length function in C?', 'options': ['strlen()', 'length()', 'size()', 'count()'], 'correct': 0},
      {'q': 'Copy string in C?', 'options': ['strcpy(dst, src)', 'copy(dst, src)', 'str = str2', 'memcopy(dst, src)'], 'correct': 0},
      {'q': 'Compare strings in C?', 'options': ['strcmp(s1, s2)', 's1 == s2', 'compare(s1, s2)', 's1.equals(s2)'], 'correct': 0},
    ],
    'Structures': [
      {'q': 'Keyword to define structure in C?', 'options': ['struct', 'class', 'object', 'type'], 'correct': 0},
      {'q': 'Access struct member via pointer?', 'options': ['ptr->member', 'ptr.member', '*ptr.member', 'ptr[member]'], 'correct': 0},
      {'q': 'typedef struct allows?', 'options': ['Using type without struct keyword', 'Multiple inheritance', 'Dynamic sizing', 'Polymorphism'], 'correct': 0},
      {'q': 'Struct stores?', 'options': ['Mixed data types together', 'Same data types only', 'Key-value pairs', 'Functions only'], 'correct': 0},
    ],
    'File Handling': [
      {'q': 'Open file in C?', 'options': ['fopen("file", "r")', 'open("file")', 'file("file", "r")', 'read("file")'], 'correct': 0},
      {'q': 'Check if file opened successfully?', 'options': ['fp == NULL', 'fp == 0', 'fp == false', 'fp.error()'], 'correct': 0},
      {'q': 'Close file in C?', 'options': ['fclose(fp)', 'close(fp)', 'fp.close()', 'end(fp)'], 'correct': 0},
      {'q': 'Read line from file in C?', 'options': ['fgets(buf, size, fp)', 'fread(buf, fp)', 'fscan(fp, buf)', 'readline(fp)'], 'correct': 0},
    ],
    'Dynamic Memory': [
      {'q': 'Allocate memory in C?', 'options': ['malloc(size)', 'new(size)', 'alloc(size)', 'mem(size)'], 'correct': 0},
      {'q': 'Free allocated memory?', 'options': ['free(ptr)', 'delete ptr', 'release(ptr)', 'dealloc(ptr)'], 'correct': 0},
      {'q': 'calloc vs malloc?', 'options': ['calloc initializes to zero', 'malloc initializes to zero', 'Same thing', 'calloc is faster'], 'correct': 0},
      {'q': 'Memory leak occurs when?', 'options': ['malloc without free', 'Using free twice', 'Null pointer', 'Stack overflow'], 'correct': 0},
    ],
    'Recursion': [
      {'q': 'Recursion requires?', 'options': ['Base case to stop', 'Large array', 'Global variables', 'Pointers'], 'correct': 0},
      {'q': 'Missing base case causes?', 'options': ['Infinite recursion', 'Faster execution', 'Memory save', 'No issue'], 'correct': 0},
      {'q': 'Factorial of 5 is?', 'options': ['120', '25', '60', '15'], 'correct': 0},
      {'q': 'Recursion uses which data structure internally?', 'options': ['Stack', 'Queue', 'Heap', 'Array'], 'correct': 0},
    ],
    'Linked Lists': [
      {'q': 'Linked list node contains?', 'options': ['Data and next pointer', 'Data only', 'Pointer only', 'Array'], 'correct': 0},
      {'q': 'Insert at head of linked list?', 'options': ['new->next = head; head = new', 'head = new', 'new->next = NULL', 'head->next = new'], 'correct': 0},
      {'q': 'Traverse linked list ends when?', 'options': ['cur == NULL', 'cur == 0', 'cur == head', 'cur == tail'], 'correct': 0},
      {'q': 'Free linked list nodes to prevent?', 'options': ['Memory leak', 'Stack overflow', 'Null pointer', 'Segfault'], 'correct': 0},
    ],
    'Stacks & Queues': [
      {'q': 'Stack follows?', 'options': ['LIFO', 'FIFO', 'Random', 'Sorted'], 'correct': 0},
      {'q': 'Queue follows?', 'options': ['FIFO', 'LIFO', 'Random', 'Sorted'], 'correct': 0},
      {'q': 'Push adds to stack?', 'options': ['Top', 'Bottom', 'Middle', 'Random'], 'correct': 0},
      {'q': 'Dequeue removes from queue?', 'options': ['Front', 'Rear', 'Middle', 'Top'], 'correct': 0},
    ],
    'Bit Manipulation': [
      {'q': 'Bitwise AND operator?', 'options': ['&', '&&', '|', '^'], 'correct': 0},
      {'q': 'Left shift << multiplies by?', 'options': ['2', '10', '8', '16'], 'correct': 0},
      {'q': 'Check if number is odd?', 'options': ['n & 1', 'n % 2', 'n | 1', 'n ^ 1'], 'correct': 0},
      {'q': 'XOR of number with itself?', 'options': ['0', '1', 'Same number', 'Error'], 'correct': 0},
    ],
    'Preprocessor': [
      {'q': 'Preprocessor directives start with?', 'options': ['#', '@', '!', '\$'], 'correct': 0},
      {'q': '#define creates?', 'options': ['Macro/constant', 'Variable', 'Function', 'Loop'], 'correct': 0},
      {'q': 'Header guards prevent?', 'options': ['Double inclusion', 'Compilation errors', 'Memory leaks', 'Linker errors'], 'correct': 0},
      {'q': '#ifdef checks?', 'options': ['If macro is defined', 'If file exists', 'If condition is true', 'If function exists'], 'correct': 0},
    ],
  },

  'HTML & CSS': {
    'HTML Basics': [
      {'q': 'HTML stands for?', 'options': ['HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyper Transfer Markup'], 'correct': 0},
      {'q': 'Visible content goes in?', 'options': ['<body>', '<head>', '<title>', '<html>'], 'correct': 0},
      {'q': 'Page title goes in?', 'options': ['<title>', '<head>', '<body>', '<header>'], 'correct': 0},
      {'q': 'Tags come in?', 'options': ['Pairs', 'Singles', 'Triples', 'Any number'], 'correct': 0},
    ],
    'Headings & Paragraphs': [
      {'q': 'Biggest heading tag?', 'options': ['<h1>', '<h6>', '<heading>', '<big>'], 'correct': 0},
      {'q': 'Paragraph tag?', 'options': ['<p>', '<para>', '<text>', '<paragraph>'], 'correct': 0},
      {'q': 'Line break tag?', 'options': ['<br>', '<lb>', '<break>', '<newline>'], 'correct': 0},
      {'q': 'Horizontal line tag?', 'options': ['<hr>', '<hl>', '<line>', '<hline>'], 'correct': 0},
    ],
    'Links & Images': [
      {'q': 'Link tag?', 'options': ['<a>', '<link>', '<url>', '<href>'], 'correct': 0},
      {'q': 'Link destination attribute?', 'options': ['href', 'src', 'link', 'url'], 'correct': 0},
      {'q': 'Image tag?', 'options': ['<img>', '<image>', '<pic>', '<photo>'], 'correct': 0},
      {'q': 'Image source attribute?', 'options': ['src', 'href', 'link', 'path'], 'correct': 0},
    ],
    'Lists & Tables': [
      {'q': 'Unordered list tag?', 'options': ['<ul>', '<ol>', '<list>', '<items>'], 'correct': 0},
      {'q': 'List item tag?', 'options': ['<li>', '<item>', '<it>', '<list-item>'], 'correct': 0},
      {'q': 'Table row tag?', 'options': ['<tr>', '<row>', '<td>', '<th>'], 'correct': 0},
      {'q': 'Table header cell?', 'options': ['<th>', '<td>', '<tr>', '<thead>'], 'correct': 0},
    ],
    'Forms': [
      {'q': 'Form tag?', 'options': ['<form>', '<input>', '<submit>', '<field>'], 'correct': 0},
      {'q': 'Text input?', 'options': ['<input type="text">', '<text>', '<input>', '<field type="text">'], 'correct': 0},
      {'q': 'Submit button?', 'options': ['<button type="submit">', '<submit>', '<button>', '<input type="button">'], 'correct': 0},
      {'q': 'form method attribute?', 'options': ['GET or POST', 'PUT or DELETE', 'SEND or RECEIVE', 'READ or WRITE'], 'correct': 0},
    ],
    'CSS Basics': [
      {'q': 'CSS stands for?', 'options': ['Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'Coded Style Sheets'], 'correct': 0},
      {'q': 'Inline CSS uses?', 'options': ['style attribute', '<style> tag', 'external file', 'class attribute'], 'correct': 0},
      {'q': 'External CSS linked with?', 'options': ['<link>', '<style>', '<css>', '<script>'], 'correct': 0},
      {'q': 'CSS property-value separator?', 'options': [':', '=', ';', ','], 'correct': 0},
    ],
    'Colors & Backgrounds': [
      {'q': 'Text color property?', 'options': ['color', 'text-color', 'font-color', 'foreground'], 'correct': 0},
      {'q': 'Background color property?', 'options': ['background-color', 'bg-color', 'background', 'back-color'], 'correct': 0},
      {'q': 'Hex color format?', 'options': ['#RRGGBB', 'rgb()', 'hsl()', 'color()'], 'correct': 0},
      {'q': 'RGB color format?', 'options': ['rgb(r,g,b)', '#RRGGBB', 'color(r,g,b)', 'hsl(h,s,l)'], 'correct': 0},
    ],
    'Box Model': [
      {'q': 'Space inside border?', 'options': ['padding', 'margin', 'border', 'gap'], 'correct': 0},
      {'q': 'Space outside border?', 'options': ['margin', 'padding', 'border', 'gap'], 'correct': 0},
      {'q': 'Box model order inside→out?', 'options': ['Content→Padding→Border→Margin', 'Margin→Border→Padding→Content', 'Border→Padding→Content→Margin', 'Padding→Content→Margin→Border'], 'correct': 0},
      {'q': 'box-sizing: border-box means?', 'options': ['Padding included in width', 'Padding excluded', 'Margin included', 'Border ignored'], 'correct': 0},
    ],
    'Flexbox': [
      {'q': 'Enable flexbox?', 'options': ['display: flex', 'flex: true', 'flexbox: on', 'display: flexbox'], 'correct': 0},
      {'q': 'Horizontal alignment?', 'options': ['justify-content', 'align-items', 'flex-direction', 'align-content'], 'correct': 0},
      {'q': 'Vertical alignment?', 'options': ['align-items', 'justify-content', 'flex-align', 'vertical-align'], 'correct': 0},
      {'q': 'Change flex direction?', 'options': ['flex-direction', 'flex-flow', 'direction', 'flex-axis'], 'correct': 0},
    ],
    'Responsive Design': [
      {'q': 'Media query syntax?', 'options': ['@media (max-width: 600px)', '@responsive 600px', '@screen 600px', '@mobile 600px'], 'correct': 0},
      {'q': 'Viewport meta tag goes in?', 'options': ['<head>', '<body>', '<html>', '<footer>'], 'correct': 0},
      {'q': '% unit is relative to?', 'options': ['Parent element', 'Screen', 'Root element', 'Body'], 'correct': 0},
      {'q': 'vw unit means?', 'options': ['Viewport width', 'Very wide', 'View window', 'Vertical width'], 'correct': 0},
    ],
    'CSS Grid': [
      {'q': 'Enable CSS Grid?', 'options': ['display: grid', 'grid: true', 'display: css-grid', 'layout: grid'], 'correct': 0},
      {'q': '1fr in grid means?', 'options': ['1 fraction of space', '1 pixel', '1 percent', '1 row'], 'correct': 0},
      {'q': 'grid-template-columns defines?', 'options': ['Column widths', 'Row heights', 'Gap size', 'Column count only'], 'correct': 0},
      {'q': 'grid-column: span 2 means?', 'options': ['Takes 2 columns', 'Skip 2 columns', 'Offset 2', 'Start at 2'], 'correct': 0},
    ],
    'CSS Animations': [
      {'q': 'CSS keyframes start with?', 'options': ['@keyframes', '@animation', '@frames', '@motion'], 'correct': 0},
      {'q': 'transition property animates?', 'options': ['State changes (hover etc)', 'All properties always', 'Only colors', 'Only position'], 'correct': 0},
      {'q': 'animation-iteration-count: infinite means?', 'options': ['Loops forever', 'Runs once', 'Runs twice', 'Never runs'], 'correct': 0},
      {'q': 'GPU-accelerated animation properties?', 'options': ['transform and opacity', 'color and background', 'width and height', 'margin and padding'], 'correct': 0},
    ],
    'CSS Variables': [
      {'q': 'CSS variable definition starts with?', 'options': ['--variable-name', '\$variable-name', '@variable-name', '#variable-name'], 'correct': 0},
      {'q': 'Use CSS variable?', 'options': ['var(--name)', '--name', '\$(name)', '@name'], 'correct': 0},
      {'q': 'Global CSS variables defined in?', 'options': [':root', 'body', 'html', '*'], 'correct': 0},
      {'q': 'CSS variable fallback syntax?', 'options': ['var(--name, fallback)', 'var(--name || fallback)', 'var(--name ?? fallback)', 'var(--name, default: fallback)'], 'correct': 0},
    ],
    'Semantic HTML': [
      {'q': '<article> tag is for?', 'options': ['Self-contained content', 'Navigation links', 'Page header', 'Sidebar'], 'correct': 0},
      {'q': '<nav> tag is for?', 'options': ['Navigation links', 'Main content', 'Article', 'Footer'], 'correct': 0},
      {'q': 'How many <main> per page?', 'options': ['One', 'Two', 'Unlimited', 'Zero'], 'correct': 0},
      {'q': 'Semantic HTML benefits?', 'options': ['SEO and accessibility', 'Faster loading', 'Less code', 'More features'], 'correct': 0},
    ],
    'HTML5 APIs': [
      {'q': 'localStorage vs sessionStorage?', 'options': ['localStorage persists, sessionStorage clears on close', 'Same thing', 'sessionStorage persists longer', 'localStorage clears on close'], 'correct': 0},
      {'q': 'Canvas API uses element?', 'options': ['<canvas>', '<draw>', '<svg>', '<graphic>'], 'correct': 0},
      {'q': 'Fetch API returns?', 'options': ['Promise', 'JSON directly', 'String', 'Array'], 'correct': 0},
      {'q': 'Geolocation API gets?', 'options': ['Device location coordinates', 'IP address', 'Time zone', 'Screen size'], 'correct': 0},
    ],
    'Media Queries': [
      {'q': 'Mobile-first approach uses?', 'options': ['min-width', 'max-width', 'screen-width', 'device-width'], 'correct': 0},
      {'q': 'Breakpoint for tablet (common)?', 'options': ['600px', '320px', '1200px', '1920px'], 'correct': 0},
      {'q': '@media print targets?', 'options': ['Print stylesheets', 'Mobile devices', 'Tablets', 'High-res screens'], 'correct': 0},
      {'q': 'Viewport meta tag is required for?', 'options': ['Mobile responsiveness', 'SEO only', 'Animation', 'Grid layout'], 'correct': 0},
    ],
    'CSS Preprocessors': [
      {'q': 'Most popular CSS preprocessor?', 'options': ['SASS/SCSS', 'LESS', 'Stylus', 'PostCSS'], 'correct': 0},
      {'q': 'SCSS variable prefix?', 'options': ['\$', '--', '@', '#'], 'correct': 0},
      {'q': '@mixin in SCSS is for?', 'options': ['Reusable code blocks', 'Variables', 'Imports', 'Loops'], 'correct': 0},
      {'q': 'Include a mixin in SCSS?', 'options': ['@include mixin-name', '@use mixin-name', '@apply mixin-name', '@import mixin-name'], 'correct': 0},
    ],
    'Web Accessibility': [
      {'q': 'WCAG stands for?', 'options': ['Web Content Accessibility Guidelines', 'Web Coding and Graphics', 'Website Content Audit Guide', 'Web CSS and Grid'], 'correct': 0},
      {'q': 'alt attribute on images is for?', 'options': ['Screen readers and SEO', 'Image styling', 'Image sizing', 'Image loading'], 'correct': 0},
      {'q': 'Minimum color contrast ratio (normal text)?', 'options': ['4.5:1', '2:1', '3:1', '7:1'], 'correct': 0},
      {'q': 'ARIA label is used for?', 'options': ['Describe elements for screen readers', 'CSS styling', 'Animation', 'Layout'], 'correct': 0},
    ],
    'SEO Basics': [
      {'q': 'Most important SEO tag?', 'options': ['<title>', '<meta>', '<h1>', '<canonical>'], 'correct': 0},
      {'q': 'Meta description ideal length?', 'options': ['150-160 chars', '50-60 chars', '200+ chars', 'Any length'], 'correct': 0},
      {'q': 'Canonical URL prevents?', 'options': ['Duplicate content issues', 'Slow loading', '404 errors', 'Bad design'], 'correct': 0},
      {'q': 'LCP (Largest Contentful Paint) should be?', 'options': ['Under 2.5s', 'Under 5s', 'Under 1s', 'Under 10s'], 'correct': 0},
    ],
  },
};

// ─── TopicQuizScreen ──────────────────────────────────────────────────────────

class TopicQuizScreen extends StatefulWidget {
  final String topic;
  final String language;
  final Color color;

  const TopicQuizScreen({
    required this.topic,
    required this.language,
    required this.color,
  });

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showFeedback = false;
  bool _isCorrect = false;
  late List<Map<String, dynamic>> _shuffled;

  @override
  void initState() {
    super.initState();
    _shuffled = _buildShuffled();
  }

  List<Map<String, dynamic>> _buildShuffled() {
    final rng = Random();
    final raw = (_quizData[widget.language]?[widget.topic] ?? []);
    return raw.map((q) {
      final opts        = List<String>.from(q['options'] as List);
      final correctText = opts[q['correct'] as int];
      opts.shuffle(rng);
      return {
        'q':       q['q'],
        'options': opts,
        'correct': opts.indexOf(correctText),
      };
    }).toList();
  }

  List<Map<String, dynamic>> get _questions => _shuffled;

  void _check() {
    final q = _questions[_current];
    final correct = q['options'][q['correct']];
    setState(() {
      _showFeedback = true;
      _isCorrect = _selected == correct;
      if (_isCorrect) _score++;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (_current < _questions.length - 1) {
        setState(() {
          _current++;
          _selected = null;
          _showFeedback = false;
        });
      } else {
        _finish();
      }
    });
  }

  Future<void> _finish() async {
    final pct = (_score / _questions.length * 100).toInt();
    if (pct >= 60) {
      await UserDataManager.markTopicCompleted(
          '${widget.language}_${widget.topic}_quiz');
      await UserDataManager.addPoints(_score * 5);
    }
    await UserDataManager.updateStreak();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => _QuizResultScreen(
          topic: widget.topic,
          score: _score,
          total: _questions.length,
          color: widget.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
            title: Text('${widget.topic} Quiz'),
            backgroundColor: widget.color),
        body: const Center(child: Text('No questions available yet!')),
      );
    }

    final q = _questions[_current];
    final options = q['options'] as List;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      appBar: AppBar(
        title: Text('${widget.topic} Quiz'),
        backgroundColor: widget.color,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${_current + 1}/${_questions.length}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_current + 1) / _questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(widget.color),
            minHeight: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Score badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Question ${_current + 1}',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey[600])),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Score: $_score',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Question
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      q['q'] as String,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Options
                  ...List.generate(options.length, (i) {
                    final opt = options[i] as String;
                    final isSelected = _selected == opt;
                    final isCorrectOpt = i == q['correct'];

                    Color btnColor = Colors.white;
                    if (_showFeedback) {
                      if (isCorrectOpt) btnColor = const Color(0xFF4CAF50);
                      if (isSelected && !_isCorrect)
                        btnColor = const Color(0xFFFF4B4B);
                    } else if (isSelected) {
                      btnColor = widget.color.withAlpha(180);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                          foregroundColor:
                              isSelected || (_showFeedback && isCorrectOpt)
                                  ? Colors.white
                                  : Colors.black87,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: widget.color, width: 1.5),
                          ),
                          elevation: 3,
                        ),
                        onPressed: _showFeedback
                            ? null
                            : () => setState(() => _selected = opt),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.grey.shade400),
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + i),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(opt,
                                    style: const TextStyle(fontSize: 15))),
                            if (_showFeedback && isCorrectOpt)
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                            if (_showFeedback && isSelected && !_isCorrect)
                              const Icon(Icons.cancel, color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // CHECK button
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: (_selected == null || _showFeedback) ? null : _check,
              child: const Text('CHECK',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Quiz Result Screen ───────────────────────────────────────────────────────

class _QuizResultScreen extends StatelessWidget {
  final String topic;
  final int score;
  final int total;
  final Color color;

  const _QuizResultScreen({
    required this.topic,
    required this.score,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (score / total * 100).toInt();
    final passed = pct >= 60;

    return Scaffold(
      backgroundColor: passed ? const Color(0xFF4CAF50) : const Color(0xFFFF9800),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  passed ? Icons.emoji_events : Icons.refresh,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  passed ? 'Great Job!' : 'Keep Practicing!',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(topic,
                    style: const TextStyle(
                        fontSize: 18, color: Colors.white70)),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text('$score / $total',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: passed
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFFF9800))),
                      Text('$pct% Correct',
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey[600])),
                      if (passed) ...[
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 28),
                            const SizedBox(width: 8),
                            Text('+${score * 5} Points',
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber)),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: color,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.home),
                        label: const Text('Home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: color,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () => Navigator.of(context)
                            .popUntil((r) => r.isFirst),
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
