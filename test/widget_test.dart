import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_screen/app.dart';
import 'package:login_screen/components/evergreen/evergreen_components.dart';

void main() {
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const App());
  }

  testWidgets('Sign in with empty fields shows validation errors', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.ensureVisible(find.text('Sign In'));
    await tester.tap(find.text('Sign In'));
    await tester.pump();
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Valid sign in shows a confirmation', (tester) async {
    await pumpApp(tester);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'khalil@gmail.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
    await tester.ensureVisible(find.text('Sign In'));
    await tester.tap(find.text('Sign In'));
    await tester.pump();
    expect(find.text('Signed in as khalil@gmail.com'), findsOneWidget);
  });

  testWidgets('Remember switch toggles', (tester) async {
    await pumpApp(tester);

    final knob = find.byType(AnimatedAlign);
    await tester.ensureVisible(find.text('Remember'));
    expect(tester.widget<AnimatedAlign>(knob).alignment, Alignment.centerLeft);
    await tester.tap(find.text('Remember'));
    await tester.pumpAndSettle();
    expect(tester.widget<AnimatedAlign>(knob).alignment, Alignment.centerRight);
  });

  testWidgets('Tapping a social button shows a message', (tester) async {
    await pumpApp(tester);

    // Social buttons are Facebook, Instagram, Google; Google is the last one.
    final google = find.byType(CircleIconButton).last;
    await tester.ensureVisible(google);
    await tester.tap(google);
    await tester.pump();
    expect(find.text('Continue with Google'), findsOneWidget);
  });
}
