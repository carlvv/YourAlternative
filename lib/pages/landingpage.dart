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
      appBar: AppBar(title: Text("YourAlternative")),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "YourAlternative",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "v1.0.0",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimaryContainer.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.tune,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                "Filter",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "/filterpage");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                "Alle Produkte",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CatalogPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                "DEBUG: Redraw",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: TextField(
                onSubmitted: (value) => onSearchChanged(context, value),
                decoration: const InputDecoration(
                  hintText: "Suche nach Alternativen",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
          alternativeEntry.energieklasse != null &&
          alternativeEntry.energieklasse!.split("+").length ==
              filterEnergieSlider) {
        return true;
      }

      if (filterPreisCheck &&
          !(alternativeEntry.price >= filterPreisVonSlider &&
              alternativeEntry.price <= filterPreisBisSlider)) {
        return true;
      }
      if (filteroledCheck &&
          alternativeEntry.bildschirmtechnologie != null &&
          alternativeEntry.bildschirmtechnologie != "OLED") {
        return true;
      }
      if (filterledCheck &&
          alternativeEntry.bildschirmtechnologie != null &&
          alternativeEntry.bildschirmtechnologie != "LED") {
        return true;
      }
      if (filterplasmaCheck &&
          alternativeEntry.bildschirmtechnologie != null &&
          alternativeEntry.bildschirmtechnologie != "PLASMA") {
        return true;
      }
      if (filterDatenschutzfreundlich &&
          alternativeEntry.datenschutzfreundlich != null &&
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
              IconButton(
                onPressed: () {
                  onSearchChanged(context, title);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: catalog.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = catalog[index];
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
