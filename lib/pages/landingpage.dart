import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YourAlternative"),
        centerTitle: true,
        leading: IconButton(
          onPressed:() => {
            print(catalog[0])
          }, 
          icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}

class ReclentlyViewed extends StatefulWidget {
  const ReclentlyViewed({super.key});

  @override
  State<ReclentlyViewed> createState() => _ReclentlyViewedState();
}

class _ReclentlyViewedState extends State<ReclentlyViewed> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}