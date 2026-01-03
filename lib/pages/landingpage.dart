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
    List<Entry> resList = [];
    for (Entry entry in catalog) {
      if (entry.name == text) {
        if (filterEnergieCheck &&
            entry.name.allMatches("+").length != filterEnergieSlider) {
          break;
        }

        if (filterPreisCheck && entry.price < filterPreisVonSlider ||
            entry.price > filterPreisBisSlider) {
          break;
        }

        if (entry.bildschirmtechnologie != null &&
            entry.bildschirmtechnologie != "OLED" &&
            filteroledCheck) {
          break;
        }

        if (entry.bildschirmtechnologie != null &&
            entry.bildschirmtechnologie != "LED" &&
            filterledCheck) {
          break;
        }

        if (entry.bildschirmtechnologie != null &&
            entry.bildschirmtechnologie != "PLASMA" &&
            filterplasmaCheck) {
          break;
        }

        if (entry.datenschutzfreundlich != null &&
            entry.datenschutzfreundlich != true &&
            filterDatenschutzfreundlich) {
          break;
        }

        resList = entry.adjecent;
        break;
      }
    }
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
              IconButton(onPressed: null, icon: Icon(Icons.arrow_forward)),
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
