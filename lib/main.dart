import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SmartCoder());
}

class SmoothPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  SmoothPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            );
            final slide = Tween<Offset>(
              begin: Offset(0.05, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
          transitionDuration: Duration(milliseconds: 400),
        );
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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
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