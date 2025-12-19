import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void onFilterPressed() {
    print("Filter");
  }

  void onSearchPressed() {
    print("Search");
  }

  //expanded um das widget zu füllen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YourAlternative"), centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: onFilterPressed, icon: const Icon(Icons.menu)),
              const Expanded(child: TextField()),
              IconButton(
                onPressed: onSearchPressed,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const Expanded(child: RecentlyViewed()),
        ],
      ),
    );
  }
}

class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({super.key});

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> historyWidgets = [];
    for (int i = 0; i < history.length; i++) {
      historyWidgets.add(
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: Text(history[i].name)),
              Expanded(child: Text(history[i].price.toString())),
              Expanded(child: Text(history[i].rating.toString())),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: historyWidgets,
    );
  }
}
