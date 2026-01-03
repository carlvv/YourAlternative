import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

import 'package:youralternative/pages/filter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void onFilterPressed(BuildContext context) {
    Navigator.pushNamed(context, "/filterpage");
  }

  void onSearchChanged(BuildContext context, text) {
    print("Search");
    Entry entry = catalog.firstWhere((element) => element.name == text);
    List<Entry> resList = [];

    resList.addAll(entry.adjecent);
    resList.removeWhere((alternativeEntry) {
      if (filterEnergieCheck &&
          alternativeEntry.name.allMatches("+").length != filterEnergieSlider) {
        return true;
      }
      if (filterPreisCheck &&
          !(alternativeEntry.price >= filterPreisVonSlider &&
              alternativeEntry.price <= filterPreisBisSlider)) {
        return true;
      }
      if (filteroledCheck && alternativeEntry.bildschirmtechnologie != "OLED") {
        return true;
      }
      if (filterledCheck && alternativeEntry.bildschirmtechnologie != "LED") {
        return true;
      }
      if (filterplasmaCheck &&
          alternativeEntry.bildschirmtechnologie != "PLASMA") {
        return true;
      }
      if (filterDatenschutzfreundlich &&
          (alternativeEntry.datenschutzfreundlich != true)) {
        return true;
      }
      if (filterBewertungCheck &&
          alternativeEntry.rating != filterBewertungSlider.round()) {
        return true;
      }
      return false;
    });

    Navigator.pushNamed(context, "/searchresultspage", arguments: resList);
  }

  void onSearchSubmit(BuildContext context, text) {}

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
                onPressed: () => onFilterPressed(context),
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
