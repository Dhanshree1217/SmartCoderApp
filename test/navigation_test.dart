import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_coder/main.dart';

void main() {
  testWidgets('full app navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const CodeMastiApp());

    // Start screen
    expect(find.text('CodeMasti'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    // tap get started
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // welcome screen
    expect(find.text('Welcome!'), findsOneWidget);
    await tester.tap(find.text('Sign Up with Email'));
    await tester.pumpAndSettle();

    // level selection
    expect(find.text('Choose Your Level'), findsOneWidget);
    // pick Beginner
    await tester.tap(find.text('Start').first);
    await tester.pumpAndSettle();

    // language selection
    expect(find.text('Pick a Language'), findsOneWidget);
    await tester.tap(find.text('Start').first);
    await tester.pumpAndSettle();

    // dashboard should appear
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Learn Python'), findsOneWidget);
  });
}