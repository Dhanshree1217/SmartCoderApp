import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SmartCoder());
}

class SmartCoder extends StatelessWidget {
  Future<bool> checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Coder",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFF8C42),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFFF8C42),
          secondary: Color(0xFFFFB380),
        ),
      ),
      home: FutureBuilder<bool>(
        future: checkAutoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          
          if (snapshot.data == true) {
            return FutureBuilder<String>(
              future: SharedPreferences.getInstance().then((prefs) => prefs.getString('userName') ?? 'User'),
              builder: (context, nameSnapshot) {
                if (nameSnapshot.hasData) {
                  return HomeScreen(userName: nameSnapshot.data!);
                }
                return SplashScreen();
              },
            );
          }
          
          return SplashScreen();
        },
      ),
    );
  }
}