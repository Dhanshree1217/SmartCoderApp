import 'package:flutter/material.dart';
import '../user_data_manager.dart';

class TopicQuizScreen extends StatefulWidget {
  final String topic;
  final String language;

  TopicQuizScreen({required this.topic, required this.language});

  @override
  _TopicQuizScreenState createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;
  String? selectedAnswer;
  bool answerSubmitted = false;

  Map<String, List<Map<String, dynamic>>> getQuizQuestions(String language, String topic) {
    switch (language) {
      case 'C':
        switch (topic) {
          case 'Hello World':
            return {
              'questions': [
                {
                  'question': 'C प्रोग्राम कोणत्या function ने सुरू होतो?',
                  'options': ['start()', 'main()', 'begin()', 'run()'],
                  'correct': 1
                },
                {
                  'question': 'printf() function काय करतो?',
                  'options': ['Input घेतो', 'Output दाखवतो', 'File वाचतो', 'Memory allocate करतो'],
                  'correct': 1
                },
                {
                  'question': '"Hello World" print करण्यासाठी कोणता command वापरतात?',
                  'options': ['print("Hello World")', 'cout << "Hello World"', 'printf("Hello World")', 'echo "Hello World"'],
                  'correct': 2
                }
              ]
            };
          case 'Variables':
            return {
              'questions': [
                {
                  'question': 'C मध्ये integer variable declare करण्यासाठी कोणता keyword वापरतात?',
                  'options': ['integer', 'int', 'number', 'num'],
                  'correct': 1
                },
                {
                  'question': 'float variable काय store करतो?',
                  'options': ['Whole numbers', 'Decimal numbers', 'Characters', 'Text'],
                  'correct': 1
                },
                {
                  'question': 'char variable काय store करतो?',
                  'options': ['Numbers', 'Decimal values', 'Single character', 'Multiple characters'],
                  'correct': 2
                }
              ]
            };
          case 'Data Types':
            return {
              'questions': [
                {
                  'question': 'कोणता data type whole numbers साठी वापरतात?',
                  'options': ['float', 'char', 'int', 'string'],
                  'correct': 2
                },
                {
                  'question': '3.14 हे value कोणत्या data type मध्ये store करावे?',
                  'options': ['int', 'float', 'char', 'bool'],
                  'correct': 1
                },
                {
                  'question': "'A' हे value कोणत्या data type मध्ये store करावे?",
                  'options': ['int', 'float', 'char', 'string'],
                  'correct': 2
                }
              ]
            };
          default:
            return {'questions': []};
        }
      case 'HTML':
        switch (topic) {
          case 'HTML Basics':
            return {
              'questions': [
                {
                  'question': 'HTML चा full form काय आहे?',
                  'options': ['Hyper Text Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyperlink Text Management Language'],
                  'correct': 0
                },
                {
                  'question': 'HTML document कोणत्या tag ने सुरू होतो?',
                  'options': ['<head>', '<body>', '<html>', '<title>'],
                  'correct': 2
                },
                {
                  'question': 'Web page चे title कोणत्या tag मध्ये लिहितात?',
                  'options': ['<head>', '<title>', '<body>', '<h1>'],
                  'correct': 1
                }
              ]
            };
          case 'Headings & Paragraphs':
            return {
              'questions': [
                {
                  'question': 'सर्वात मोठे heading कोणते आहे?',
                  'options': ['<h6>', '<h3>', '<h1>', '<h2>'],
                  'correct': 2
                },
                {
                  'question': 'Paragraph लिहिण्यासाठी कोणता tag वापरतात?',
                  'options': ['<para>', '<p>', '<paragraph>', '<text>'],
                  'correct': 1
                },
                {
                  'question': '<h3> tag काय दर्शवतो?',
                  'options': ['Paragraph', 'Link', 'Heading level 3', 'Image'],
                  'correct': 2
                }
              ]
            };
          case 'Links & Images':
            return {
              'questions': [
                {
                  'question': 'Link बनवण्यासाठी कोणता tag वापरतात?',
                  'options': ['<link>', '<a>', '<url>', '<href>'],
                  'correct': 1
                },
                {
                  'question': 'Image दाखवण्यासाठी कोणता tag वापरतात?',
                  'options': ['<image>', '<img>', '<pic>', '<photo>'],
                  'correct': 1
                },
                {
                  'question': 'Link चा URL कोणत्या attribute मध्ये लिहितात?',
                  'options': ['src', 'href', 'url', 'link'],
                  'correct': 1
                }
              ]
            };
          default:
            return {'questions': []};
        }
      default:
        return {'questions': []};
    }
  }

  List<Map<String, dynamic>> get currentQuestions {
    return getQuizQuestions(widget.language, widget.topic)['questions'] ?? [];
  }

  void submitAnswer() {
    if (selectedAnswer == null) return;
    
    setState(() {
      answerSubmitted = true;
      if (int.parse(selectedAnswer!) == currentQuestions[currentQuestionIndex]['correct']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < currentQuestions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        answerSubmitted = false;
      } else {
        showResult = true;
      }
    });
  }

  void finishQuiz() async {
    await UserDataManager.markTopicCompleted('${widget.language}_${widget.topic}_quiz');
    await UserDataManager.addPoints(score * 10);
    await UserDataManager.updateStreak();
    await UserDataManager.checkAndUnlockAchievements();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          backgroundColor: Color(0xFF2196F3),
        ),
        body: Center(
          child: Text(
            "या topic साठी quiz अजून तयार नाही",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    if (showResult) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Result"),
          backgroundColor: Color(0xFF2196F3),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                score >= currentQuestions.length * 0.7 ? Icons.celebration : Icons.thumb_up,
                size: 100,
                color: score >= currentQuestions.length * 0.7 ? Colors.green : Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                "तुमचा Score: $score/${currentQuestions.length}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                score >= currentQuestions.length * 0.7 ? "छान! तुम्ही पास झालात!" : "अजून practice करा!",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: finishQuiz,
                child: Text("पूर्ण केले"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final question = currentQuestions[currentQuestionIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.topic} Quiz"),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / currentQuestions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
            ),
            SizedBox(height: 20),
            Text(
              "प्रश्न ${currentQuestionIndex + 1}/${currentQuestions.length}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF2196F3)),
              ),
              child: Text(
                question['question'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: question['options'].length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedAnswer == index.toString();
                  bool isCorrect = index == question['correct'];
                  bool showColors = answerSubmitted;
                  
                  Color cardColor = Colors.white;
                  if (showColors) {
                    if (isCorrect) {
                      cardColor = Colors.green[100]!;
                    } else if (isSelected && !isCorrect) {
                      cardColor = Colors.red[100]!;
                    }
                  } else if (isSelected) {
                    cardColor = Colors.blue[100]!;
                  }
                  
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Card(
                      color: cardColor,
                      elevation: isSelected ? 4 : 2,
                      child: ListTile(
                        title: Text(
                          question['options'][index],
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: showColors && isCorrect 
                              ? Colors.green 
                              : showColors && isSelected && !isCorrect
                                  ? Colors.red
                                  : Color(0xFF2196F3),
                          child: Text(
                            String.fromCharCode(65 + index), // A, B, C, D
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: showColors && isCorrect 
                            ? Icon(Icons.check, color: Colors.green)
                            : showColors && isSelected && !isCorrect
                                ? Icon(Icons.close, color: Colors.red)
                                : null,
                        onTap: answerSubmitted ? null : () {
                          setState(() {
                            selectedAnswer = index.toString();
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!answerSubmitted)
                  ElevatedButton(
                    onPressed: selectedAnswer != null ? submitAnswer : null,
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2196F3),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                if (answerSubmitted)
                  ElevatedButton(
                    onPressed: nextQuestion,
                    child: Text(currentQuestionIndex < currentQuestions.length - 1 ? "पुढे" : "पूर्ण करा"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}