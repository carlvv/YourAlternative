import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/pages/landingpage.dart';

void main() {
  prepareData();
  runApp(const YourAlternativeApp());
}


class YourAlternativeApp extends StatelessWidget {
  const YourAlternativeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourAlternative',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true
      ),
      home: const LandingPage()
    );
  }
}
