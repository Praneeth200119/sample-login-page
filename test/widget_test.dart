import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ihl/views/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

void main() {
  testWidgets('Test text widgets', (WidgetTester tester) async {
    // Set up providers for testing
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          // Add your providers here as needed
          Provider<ConnectivityStatus>.value(
            value: ConnectivityStatus.CONNECTED, // Provide a mock value
          ),
        ],
        child: MaterialApp(
          home: WelcomePage(),
        ),
      ),
    );

    // Find and verify the "hCare" text
    expect(find.text('Welcome to'), findsOneWidget);
    expect(find.text('hCare'), findsOneWidget);


    // expect(find.text('New to IHL?'), findsOneWidget);

    // expect(find.text('New to IHL?'), findsOneWidget);

    // Find the GestureDetector that wraps the "New to IHL" text
    // final gestureDetectorFinder = find.byType(GestureDetector);
    //
    // // Simulate a tap on the GestureDetector
    // await tester.tap(gestureDetectorFinder);
    // await tester.pump();

    final newuserGestureDetectorFinder = find.byKey(Key('newuser'));
    expect(newuserGestureDetectorFinder, findsOneWidget);

    await tester.tap(newuserGestureDetectorFinder);
    await tester.pump();

    final signInGestureDetectorFinder = find.byKey(Key('signin'));
    expect(signInGestureDetectorFinder, findsOneWidget);

    // Add a small delay before tapping
    // await Future.delayed(Duration(milliseconds: 10));

    // Tap the "Sign In" widget
    await tester.tap(signInGestureDetectorFinder);
    await tester.pump();

  });

  // Add more test cases as needed
}
