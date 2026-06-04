import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'duolingo_home_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final languages = [
    {"name": "Python", "emoji": "🐍", "color": Color.fromARGB(255, 85, 162, 225), "desc": "Popular & Easy to Learn"},
    {"name": "Java", "emoji": "☕", "color": Color(0xFFF89820), "desc": "Enterprise Standard"},
    {"name": "C Language", "emoji": "C", "color": Color.fromARGB(255, 122, 186, 234), "desc": "Foundation of Programming"},
    {"name": "HTML & CSS", "emoji": "🌐", "color": Color(0xFFE34C26), "desc": "Build Websites"},
  ];

  Future<void> selectLanguage(BuildContext context, String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DuolingoHomeScreen(language: language),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 216, 112, 38), Color(0xFFD2691E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.language, size: 80, color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      "Choose Your Language",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Start your coding journey!",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 16),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () => selectLanguage(context, languages[index]["name"] as String),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  (languages[index]["color"] as Color).withOpacity(0.8),
                                  (languages[index]["color"] as Color),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      languages[index]["emoji"] as String,
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        languages[index]["name"] as String,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        languages[index]["desc"] as String,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
