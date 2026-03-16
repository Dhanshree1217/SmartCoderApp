import 'package:flutter_test/flutter_test.dart';
import 'package:smart_coder/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(SmartCoderApp());

    // Check if Splash screen text is visible
    expect(find.text("CodeMasti 🚀"), findsOneWidget);
  });
}         
