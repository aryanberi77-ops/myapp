// This is a basic Flutter widget test. It checks if a simple counter app works correctly.
// The test uses WidgetTester to interact with the UI, like tapping buttons and reading text.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Step 1: Build the app and render the first frame
    await tester.pumpWidget(const MainApp());

    // Step 2: Make sure the counter starts at 0
    expect(find.text('0'), findsOneWidget); // Text '0' should appear once
    expect(find.text('1'), findsNothing); // Text '1' should not exist yet

    // Step 3: Tap the + icon to increase the counter
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Updates the UI after the tap

    // Step 4: Now the counter should show 1 instead of 0
    expect(find.text('0'), findsNothing); // 0 should be gone
    expect(find.text('1'), findsOneWidget); // 1 should now appear
  });
}
