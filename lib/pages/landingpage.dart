import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YourAlternative"),
        centerTitle: true,
        leading: IconButton(
          onPressed:() => {}, 
          icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}