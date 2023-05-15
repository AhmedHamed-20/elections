import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/constant.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefaultFirebaseOptions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
