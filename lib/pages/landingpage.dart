import 'package:flutter/material.dart';
import 'package:youralternative/theme/app_theme.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/pages/filter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarLanding(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("YourAlternative"))),
            ListTile(
              leading: Icon(Icons.tune),
              title: Text("Filter"),
              onTap: () {
                Navigator.pushNamed(context, "/filterpage");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) => onSearchChanged(context, value),
                decoration: const InputDecoration(
                  hintText: "Suche nach Alternativen",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 10),
                const Text(
                  "Suchverlauf",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: history.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = history[index];
                  return HistoryTile(title: item.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onSearchChanged(BuildContext context, String text) {
  Entry? entry;
  try {
    entry = catalog.firstWhere((element) => element.name == text);
  } catch (e) {
    entry = null;
  }
  List<Entry> resList = [];
  if (entry != null) {
    if (history.isEmpty || history.last.name != text) {
      history.add(entry);
    }
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
  }
  Navigator.pushNamed(context, "/searchresultspage", arguments: resList);
}

class HistoryTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HistoryTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadii.card),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadii.card),
          boxShadow: AppShadows.soft,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(onPressed: () {
                onSearchChanged(context, title);
              }, icon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
