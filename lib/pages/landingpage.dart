import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void onFilterPressed() {
    print("Filter");
  }

  void onSearchChanged(BuildContext context,  text) {
    print("Search");
    List<Entry> resList = [];
    for (int i = 0; i < catalog.length; i++) {
      if (catalog[i].name == text) {
        resList = catalog[i].adjecent;
        break;
      }
    }
    Navigator.pushNamed(context, "/searchresults", arguments: resList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YourAlternative"), centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: onFilterPressed,
                icon: const Icon(Icons.menu),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (text) => onSearchChanged(context, text),
                ),
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
  List<Entry> _historyItems = []; // Store Entry objects instead of Widgets

  void addToHistory(Entry newItem) {
    setState(() {
      _historyItems.add(newItem); // Add the Entry object to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _historyItems.length,
      itemBuilder: (context, index) {
        final item = _historyItems[index];
        return Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: Text(item.name)),
              Expanded(child: Text(item.price.toString())),
              Expanded(child: Text(item.rating.toString())),
            ],
          ),
        );
      },
    );
  }
}
