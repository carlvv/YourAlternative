import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/pages/filter.dart';
import 'package:youralternative/pages/landingpage.dart';
import 'package:youralternative/pages/searchresults.dart';
import 'package:youralternative/theme/app_theme.dart';

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
      /*theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        iconTheme: IconThemeData(
          size: 16
        )
      ),*/
      theme: buildAppTheme(),
      home: const LandingPage(),
      routes: {
        "/landingpage": (context) => const LandingPage(),
        "/searchresultspage": (context) => const SearchResultsPage(),
        "/filterpage": (context) => const FilterPage(),
      },
    );
  }
}
