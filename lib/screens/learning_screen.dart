import 'package:flutter/material.dart';

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
            {"name": "Pointers", "icon": Icons.arrow_forward},
            {"name": "Memory", "icon": Icons.memory},
            {"name": "Structures", "icon": Icons.account_box},
            {"name": "File I/O", "icon": Icons.folder},
            {"name": "Functions", "icon": Icons.functions},
          ]
        };
      case 'HTML':
        return {
          'topics': [
            {"name": "Tags", "icon": Icons.code},
            {"name": "CSS Styling", "icon": Icons.palette},
            {"name": "Forms", "icon": Icons.assignment},
            {"name": "Layout", "icon": Icons.dashboard},
            {"name": "Responsive", "icon": Icons.phone_android},
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
          "Pointers": "Pointers store memory addresses!\n\nExample in C:\nint x = 10;\nint *ptr = &x;\n\nPointers are very powerful in C.",
          "Memory": "Memory management is important in C!\n\nExample in C:\nint *arr = malloc(5 * sizeof(int));\nfree(arr);\n\nAlways free allocated memory.",
          "Structures": "Structures group related data!\n\nExample in C:\nstruct Person {\n    char name[50];\n    int age;\n};\n\nStructures organize data.",
          "File I/O": "File operations let us read/write files!\n\nExample in C:\nFILE *file = fopen(\"data.txt\", \"r\");\nfclose(file);\n\nAlways close files after use.",
          "Functions": "Functions break code into smaller parts!\n\nExample in C:\nint add(int a, int b) {\n    return a + b;\n}\n\nFunctions make code reusable.",
        };
      case 'HTML':
        return {
          "Tags": "HTML tags structure web content!\n\nExample in HTML:\n<h1>Hello World</h1>\n<p>This is a paragraph</p>\n\nTags have opening and closing parts.",
          "CSS Styling": "CSS makes websites look beautiful!\n\nExample:\n<style>\nh1 { color: blue; }\n</style>\n\nCSS controls colors, fonts, and layout.",
          "Forms": "Forms collect user input!\n\nExample in HTML:\n<form>\n  <input type=\"text\" name=\"name\">\n  <button>Submit</button>\n</form>\n\nForms are interactive.",
          "Layout": "Layout organizes content on the page!\n\nExample in HTML:\n<div>\n  <header>Top</header>\n  <main>Content</main>\n</div>\n\nDivs group elements together.",
          "Responsive": "Responsive design works on all devices!\n\nExample in CSS:\n@media (max-width: 600px) {\n  .container { width: 100%; }\n}\n\nMedia queries adapt to screen size.",
        };
      default:
        return {};
    }
  }

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
          "Pointers": "Pointers store memory addresses!\n\nExample in C:\nint x = 10;\nint *ptr = &x;\n\nPointers are very powerful in C.",
          "Memory": "Memory management is important in C!\n\nExample in C:\nint *arr = malloc(5 * sizeof(int));\nfree(arr);\n\nAlways free allocated memory.",
          "Structures": "Structures group related data!\n\nExample in C:\nstruct Person {\n    char name[50];\n    int age;\n};\n\nStructures organize data.",
          "File I/O": "File operations let us read/write files!\n\nExample in C:\nFILE *file = fopen(\"data.txt\", \"r\");\nfclose(file);\n\nAlways close files after use.",
          "Functions": "Functions break code into smaller parts!\n\nExample in C:\nint add(int a, int b) {\n    return a + b;\n}\n\nFunctions make code reusable.",
        };
      case 'HTML':
        return {
          "Tags": "HTML tags structure web content!\n\nExample in HTML:\n<h1>Hello World</h1>\n<p>This is a paragraph</p>\n\nTags have opening and closing parts.",
          "CSS Styling": "CSS makes websites look beautiful!\n\nExample:\n<style>\nh1 { color: blue; }\n</style>\n\nCSS controls colors, fonts, and layout.",
          "Forms": "Forms collect user input!\n\nExample in HTML:\n<form>\n  <input type=\"text\" name=\"name\">\n  <button>Submit</button>\n</form>\n\nForms are interactive.",
          "Layout": "Layout organizes content on the page!\n\nExample in HTML:\n<div>\n  <header>Top</header>\n  <main>Content</main>\n</div>\n\nDivs group elements together.",
          "Responsive": "Responsive design works on all devices!\n\nExample in CSS:\n@media (max-width: 600px) {\n  .container { width: 100%; }\n}\n\nMedia queries adapt to screen size.",
        };
      default:
        return {};
    }
  }

  Map<String, String> getContentForLevel() {
    if (level.contains("Intermediate")) {
      return getIntermediateContent(language);
    } else if (level.contains("Advanced")) {
      return getAdvancedContent(language);
    } else {
      return getBeginnerContent(language);
    }
  }

  Map<String, String> getIntermediateContent(String language) {
    switch (language) {
      case 'Python':
        return {
          "Variables": "Variables can store different types and be changed!\n\nExample:\nx = 10\nx = x + 5  # Now x is 15\n\nSwap values:\na, b = 5, 10\na, b = b, a  # Now a=10, b=5",
          "Data Types": "Python has many data types:\n\n• int: 42\n• float: 3.14\n• str: 'Hello'\n• bool: True/False\n• list: [1, 2, 3]\n• dict: {'name': 'John'}\n\nConvert types:\nnum = int('42')",
          "Loops": "Different types of loops:\n\nfor loop:\nfor i in range(5):\n    print(i)\n\nwhile loop:\ncount = 0\nwhile count < 5:\n    print(count)\n    count += 1\n\nUse 'break' and 'continue'",
          "Lists": "Lists have useful methods:\n\nfruits = ['apple', 'banana']\nfruits.append('orange')\nfruits.remove('banana')\nfruits[0]  # First item\nlen(fruits)  # Length\n\nSlicing:\nfruits[0:2]",
          "Functions": "Functions with parameters and return:\n\ndef add(a, b):\n    return a + b\n\nresult = add(5, 3)\n\nDefault parameters:\ndef greet(name='User'):\n    print(f'Hello {name}')",
        };
      case 'Java':
        return {
          "Classes": "Classes with constructors and methods:\n\nclass Car {\n    String color;\n    int speed;\n    \n    Car(String c, int s) {\n        color = c;\n        speed = s;\n    }\n    \n    void drive() {\n        System.out.println(\"Driving at \" + speed);\n    }\n}",
          "Objects": "Creating and using objects:\n\nCar myCar = new Car(\"red\", 60);\nmyCar.drive();\n\nCar[] cars = new Car[3];\ncars[0] = new Car(\"blue\", 80);\n\nObjects have state and behavior.",
          "Inheritance": "Inheritance with super keyword:\n\nclass Animal {\n    void eat() { System.out.println(\"Eating\"); }\n}\n\nclass Dog extends Animal {\n    void bark() { System.out.println(\"Barking\"); }\n}\n\nDog d = new Dog();\nd.eat(); d.bark();",
          "Methods": "Method overloading and static methods:\n\nclass Calculator {\n    static int add(int a, int b) { return a + b; }\n    static double add(double a, double b) { return a + b; }\n}\n\nint result = Calculator.add(5, 3);",
          "Arrays": "Multi-dimensional arrays:\n\nint[][] matrix = new int[3][3];\nmatrix[0][0] = 1;\n\nfor(int i=0; i<3; i++) {\n    for(int j=0; j<3; j++) {\n        System.out.print(matrix[i][j]);\n    }\n}",
        };
      case 'C':
        return {
          "Pointers": "Pointer arithmetic and arrays:\n\nint arr[] = {1, 2, 3, 4, 5};\nint *ptr = arr;\n\nfor(int i=0; i<5; i++) {\n    printf(\"%d \", *(ptr + i));\n}\n\nPointers and arrays are related.",
          "Memory": "Dynamic memory allocation:\n\nint *arr = malloc(5 * sizeof(int));\nif(arr != NULL) {\n    for(int i=0; i<5; i++) {\n        arr[i] = i * 2;\n    }\n    free(arr);\n}\n\nAlways check malloc return.",
          "Structures": "Structures with functions:\n\nstruct Student {\n    char name[50];\n    int age;\n    float marks;\n};\n\nvoid printStudent(struct Student s) {\n    printf(\"Name: %s, Age: %d\", s.name, s.age);\n}",
          "File I/O": "Reading and writing files:\n\nFILE *file = fopen(\"data.txt\", \"w\");\nif(file != NULL) {\n    fprintf(file, \"Hello World\");\n    fclose(file);\n}\n\nfile = fopen(\"data.txt\", \"r\");\nchar buffer[100];\nfgets(buffer, 100, file);",
          "Functions": "Function pointers and recursion:\n\nint factorial(int n) {\n    if(n <= 1) return 1;\n    return n * factorial(n-1);\n}\n\nint (*func_ptr)(int) = factorial;\nint result = func_ptr(5);",
        };
      case 'HTML':
        return {
          "Tags": "Semantic HTML tags:\n\n<article>\n  <header>\n    <h1>Article Title</h1>\n  </header>\n  <section>\n    <p>Content here</p>\n  </section>\n  <footer>\n    <p>Footer info</p>\n  </footer>\n</article>\n\nSemantic tags give meaning.",
          "CSS Styling": "CSS selectors and properties:\n\n.container {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n}\n\n#header {\n  background: linear-gradient(45deg, blue, red);\n}\n\np:hover {\n  color: red;\n}",
          "Forms": "Advanced form elements:\n\n<form>\n  <select name=\"country\">\n    <option value=\"us\">USA</option>\n    <option value=\"in\">India</option>\n  </select>\n  <textarea name=\"message\" rows=\"4\"></textarea>\n  <input type=\"range\" min=\"0\" max=\"100\">\n</form>",
          "Layout": "CSS Grid and Flexbox:\n\n.grid-container {\n  display: grid;\n  grid-template-columns: 1fr 2fr 1fr;\n  gap: 20px;\n}\n\n.flex-container {\n  display: flex;\n  flex-direction: column;\n  justify-content: space-between;\n}",
          "Responsive": "Advanced responsive design:\n\n@media (max-width: 768px) {\n  .container {\n    flex-direction: column;\n  }\n}\n\n@media (min-width: 1200px) {\n  .container {\n    max-width: 1140px;\n  }\n}\n\nUse relative units like em, rem, %",
        };
      default:
        return {};
    }
  }

  Map<String, String> getAdvancedContent(String language) {
    switch (language) {
      case 'Python':
        return {
          "Variables": "Advanced variable concepts:\n\nGlobal vs Local:\nglobal_var = 10\n\ndef func():\n    local_var = 20\n    global global_var\n    global_var = 30\n\nMultiple assignment:\nx = y = z = 0\na, b, *rest = [1, 2, 3, 4, 5]",
          "Data Types": "Advanced data structures:\n\nSets (unique items):\nmy_set = {1, 2, 3}\n\nTuples (immutable):\nmy_tuple = (1, 2, 3)\n\nDictionaries:\nperson = {\n    'name': 'John',\n    'age': 25,\n    'skills': ['Python', 'Java']\n}",
          "Loops": "Advanced loop techniques:\n\nList comprehension:\nsquares = [x**2 for x in range(10)]\n\nEnumerate:\nfor i, val in enumerate(['a', 'b']):\n    print(f'{i}: {val}')\n\nZip:\nfor x, y in zip([1,2], ['a','b']):\n    print(x, y)",
          "Lists": "Advanced list operations:\n\nList comprehension:\nevens = [x for x in range(10) if x % 2 == 0]\n\nMap and filter:\nnums = [1, 2, 3, 4]\nsquared = list(map(lambda x: x**2, nums))\nevens = list(filter(lambda x: x%2==0, nums))\n\nSorting:\nnums.sort()\nsorted_nums = sorted(nums)",
          "Functions": "Advanced function concepts:\n\nLambda functions:\nsquare = lambda x: x**2\n\nDecorators:\ndef decorator(func):\n    def wrapper():\n        print('Before')\n        func()\n        print('After')\n    return wrapper\n\n*args and **kwargs:\ndef func(*args, **kwargs):\n    print(args, kwargs)",
        };
      case 'Java':
        return {
          "Classes": "Abstract classes and interfaces:\n\nabstract class Animal {\n    abstract void makeSound();\n    void sleep() { System.out.println(\"Sleeping\"); }\n}\n\ninterface Flyable {\n    void fly();\n}\n\nclass Bird extends Animal implements Flyable {\n    void makeSound() { System.out.println(\"Chirp\"); }\n    public void fly() { System.out.println(\"Flying\"); }\n}",
          "Objects": "Object serialization and cloning:\n\nclass Person implements Serializable, Cloneable {\n    String name;\n    int age;\n    \n    @Override\n    public Object clone() throws CloneNotSupportedException {\n        return super.clone();\n    }\n}\n\nPerson p1 = new Person();\nPerson p2 = (Person) p1.clone();",
          "Inheritance": "Multiple inheritance with interfaces:\n\ninterface A { void methodA(); }\ninterface B { void methodB(); }\n\nclass C implements A, B {\n    public void methodA() { }\n    public void methodB() { }\n}\n\nJava supports multiple inheritance through interfaces.",
          "Methods": "Generic methods and annotations:\n\npublic class Utility {\n    @SafeVarargs\n    public static <T> void printArray(T... array) {\n        for(T element : array) {\n            System.out.println(element);\n        }\n    }\n}\n\nUtility.printArray(1, 2, 3, 4, 5);",
          "Arrays": "Collections Framework:\n\nList<String> list = new ArrayList<>();\nlist.add(\"Java\");\nlist.add(\"Python\");\n\nMap<String, Integer> map = new HashMap<>();\nmap.put(\"Java\", 25);\nmap.put(\"Python\", 30);\n\nfor(Map.Entry<String, Integer> entry : map.entrySet()) {\n    System.out.println(entry.getKey() + \": \" + entry.getValue());\n}",
        };
      case 'C':
        return {
          "Pointers": "Function pointers and void pointers:\n\nvoid* generic_ptr;\nint x = 10;\ngeneric_ptr = &x;\nint* int_ptr = (int*)generic_ptr;\n\nint (*operation)(int, int);\nint add(int a, int b) { return a + b; }\noperation = add;\nint result = operation(5, 3);",
          "Memory": "Memory management and memory leaks:\n\nint* create_array(int size) {\n    int* arr = malloc(size * sizeof(int));\n    if(arr == NULL) {\n        printf(\"Memory allocation failed\");\n        exit(1);\n    }\n    return arr;\n}\n\nvoid cleanup(int* arr) {\n    free(arr);\n    arr = NULL;\n}",
          "Structures": "Nested structures and unions:\n\nstruct Address {\n    char street[100];\n    char city[50];\n};\n\nstruct Person {\n    char name[50];\n    struct Address addr;\n};\n\nunion Data {\n    int i;\n    float f;\n    char str[20];\n};\n\nUnions share memory space.",
          "File I/O": "Binary file operations:\n\nstruct Student {\n    char name[50];\n    int age;\n};\n\nFILE* file = fopen(\"students.dat\", \"wb\");\nstruct Student s = {\"John\", 20};\nfwrite(&s, sizeof(struct Student), 1, file);\nfclose(file);\n\nfile = fopen(\"students.dat\", \"rb\");\nfread(&s, sizeof(struct Student), 1, file);",
          "Functions": "Variadic functions and macros:\n\n#include <stdarg.h>\n\nint sum(int count, ...) {\n    va_list args;\n    va_start(args, count);\n    int total = 0;\n    for(int i = 0; i < count; i++) {\n        total += va_arg(args, int);\n    }\n    va_end(args);\n    return total;\n}\n\n#define MAX(a, b) ((a) > (b) ? (a) : (b))",
        };
      case 'HTML':
        return {
          "Tags": "HTML5 semantic elements:\n\n<main>\n  <article>\n    <header>\n      <h1>Article Title</h1>\n      <time datetime=\"2024-01-01\">January 1, 2024</time>\n    </header>\n    <section>\n      <p>Article content...</p>\n    </section>\n    <aside>\n      <p>Related links</p>\n    </aside>\n  </article>\n</main>",
          "CSS Styling": "Advanced CSS features:\n\n:root {\n  --primary-color: #3498db;\n  --secondary-color: #2ecc71;\n}\n\n.card {\n  background: var(--primary-color);\n  transform: translateY(-5px);\n  transition: all 0.3s ease;\n  box-shadow: 0 10px 20px rgba(0,0,0,0.1);\n}\n\n.card:hover {\n  transform: translateY(-10px);\n}",
          "Forms": "Advanced form validation:\n\n<form novalidate>\n  <input type=\"email\" required \n         pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}\$\">\n  <input type=\"tel\" pattern=\"[0-9]{3}-[0-9]{3}-[0-9]{4}\">\n  <input type=\"date\" min=\"2024-01-01\" max=\"2024-12-31\">\n  <datalist id=\"browsers\">\n    <option value=\"Chrome\">\n    <option value=\"Firefox\">\n  </datalist>\n</form>",
          "Layout": "CSS Grid advanced layouts:\n\n.grid-container {\n  display: grid;\n  grid-template-areas: \n    \"header header header\"\n    \"sidebar main aside\"\n    \"footer footer footer\";\n  grid-template-rows: auto 1fr auto;\n  grid-template-columns: 200px 1fr 200px;\n  min-height: 100vh;\n}\n\n.header { grid-area: header; }",
          "Responsive": "Advanced responsive techniques:\n\n.container {\n  width: min(90%, 1200px);\n  margin-inline: auto;\n}\n\n@container (min-width: 400px) {\n  .card {\n    display: flex;\n  }\n}\n\n@supports (display: grid) {\n  .layout {\n    display: grid;\n  }\n}\n\nUse container queries and feature queries.",
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final topicContent = getContentForLevel();

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
