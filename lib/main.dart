import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tail/pages/index.dart';
import 'package:tail/pages/onboarding_page.dart';
import 'package:tail/themes/theme_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();

    bool seen = prefs.getBool("seenOnboarding") ?? false;
    return !seen;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: FutureBuilder(
        future: isFirstTime(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          return snapshot.data! ? OnboardingPage() : LoginRegisterPage();
        },
      ),
    );
  }
}
