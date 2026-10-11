import 'package:flutter/material.dart';

import 'screens/evergreen_sign_in_screen.dart';
import 'theme/evergreen_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evergreen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: EvergreenColors.accent,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: EvergreenColors.backgroundBottom,
        // No Material ripple, highlight or hover anywhere in the app.
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const EvergreenSignInScreen(),
    );
  }
}
