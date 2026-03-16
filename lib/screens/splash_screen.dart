import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../main.dart';
import 'dart:math';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF8C42), Color(0xFFFFB74D)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo container - rounded square like app icon
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF1E4A4A), Color(0xFF0D2B2B)],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF00FFCC).withOpacity(0.3),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CustomPaint(
                        painter: BinaryBackgroundPainter(),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Left bracket
                            Positioned(
                              left: 10,
                              child: Text(
                                '{',
                                style: TextStyle(
                                  fontSize: 90,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF00FFCC),
                                  shadows: [
                                    Shadow(
                                      color: Color(0xFF00FFCC),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Right bracket
                            Positioned(
                              right: 10,
                              child: Text(
                                '}',
                                style: TextStyle(
                                  fontSize: 90,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF00FFCC),
                                  shadows: [
                                    Shadow(
                                      color: Color(0xFF00FFCC),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // 3D Pixel Bear
                            CustomPaint(
                              size: Size(100, 110),
                              painter: PixelBearPainter(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 36),

                  Text(
                    'Smart Coder',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Learn. Code. Create. Succeed.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 60),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEF5350),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          SmoothPageRoute(page: LoginScreen()),
                        );
                      },
                      child: Text(
                        'Get Started',
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
            ),
          ),
        ),
      ),
    );
  }
}

// Binary code background painter
class BinaryBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF00FFCC).withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final random = Random(42);
    final textStyle = TextStyle(
      color: Color(0xFF00FFCC).withOpacity(0.25),
      fontSize: 9,
      fontFamily: 'monospace',
    );

    for (double y = 0; y < size.height; y += 11) {
      for (double x = 0; x < size.width; x += 8) {
        final bit = random.nextBool() ? '1' : '0';
        final tp = TextPainter(
          text: TextSpan(text: bit, style: textStyle),
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(canvas, Offset(x, y));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 3D Pixel Bear Painter
class PixelBearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double px = size.width / 10;

    void drawPixel(double col, double row, Color color) {
      final paint = Paint()..color = color;
      canvas.drawRect(
        Rect.fromLTWH(col * px, row * px, px - 0.5, px - 0.5),
        paint,
      );
    }

    // Shadow/dark side color
    const Color body = Color(0xFFE8A020);
    const Color dark = Color(0xFFB87010);
    const Color light = Color(0xFFF5C040);
    const Color nose = Color(0xFF8B4513);
    const Color eye = Color(0xFF2C1A0A);
    const Color ear = Color(0xFFD4901A);

    // Bear pixel grid (10x11 grid)
    // Ears
    drawPixel(1, 0, ear); drawPixel(2, 0, ear);
    drawPixel(7, 0, ear); drawPixel(8, 0, ear);
    drawPixel(1, 1, ear); drawPixel(2, 1, ear);
    drawPixel(7, 1, ear); drawPixel(8, 1, ear);

    // Head top
    for (int i = 2; i <= 7; i++) drawPixel(i.toDouble(), 1, body);
    for (int i = 1; i <= 8; i++) drawPixel(i.toDouble(), 2, i <= 5 ? light : dark);
    for (int i = 1; i <= 8; i++) drawPixel(i.toDouble(), 3, i <= 5 ? body : dark);

    // Eyes row
    drawPixel(1, 4, body); drawPixel(2, 4, eye); drawPixel(3, 4, body);
    drawPixel(4, 4, body); drawPixel(5, 4, body);
    drawPixel(6, 4, eye); drawPixel(7, 4, dark); drawPixel(8, 4, dark);

    // Nose row
    for (int i = 1; i <= 5; i++) drawPixel(i.toDouble(), 5, body);
    drawPixel(3, 5, nose); drawPixel(4, 5, nose);
    for (int i = 6; i <= 8; i++) drawPixel(i.toDouble(), 5, dark);

    // Mouth row
    for (int i = 1; i <= 5; i++) drawPixel(i.toDouble(), 6, body);
    drawPixel(2, 6, nose); drawPixel(5, 6, nose);
    for (int i = 6; i <= 8; i++) drawPixel(i.toDouble(), 6, dark);

    // Body top
    for (int i = 1; i <= 8; i++) drawPixel(i.toDouble(), 7, i <= 5 ? body : dark);
    for (int i = 0; i <= 9; i++) drawPixel(i.toDouble(), 8, i <= 5 ? light : dark);
    for (int i = 0; i <= 9; i++) drawPixel(i.toDouble(), 9, i <= 5 ? body : dark);

    // Feet
    drawPixel(1, 10, body); drawPixel(2, 10, body);
    drawPixel(7, 10, dark); drawPixel(8, 10, dark);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
