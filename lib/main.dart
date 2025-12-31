import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/pages/landingpage.dart';
import 'package:youralternative/pages/searchresults.dart';

import 'dart:math';



void main() {
  prepareData();
  Random random = Random();
  for (int i = 0; i < 10; i++) {
    history.add(catalog[random.nextInt(catalog.length)]);
  }
  runApp(const YourAlternativeApp());
}

class YourAlternativeApp extends StatelessWidget {
  const YourAlternativeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourAlternative',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light(), useMaterial3: true),
      home: const LandingPage(),
      routes: {
        "/landingpage":(context) => const LandingPage(),
        "/searchresults":(context) => const SearchResultsPage(),
      },
    );
  }
}
