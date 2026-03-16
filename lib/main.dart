import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'auth_database.dart';

void main() {
  runApp(SmartCoder());
}

class SmoothPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  SmoothPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 350),
        );
}

class SmartCoder extends StatelessWidget {
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
      home: SplashScreen(),
    );
  }
}
