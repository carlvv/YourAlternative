import 'package:flutter/material.dart';
import 'package:youralternative/theme/app_theme.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/pages/filter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void onFilterPressed(BuildContext context) {
    Navigator.pushNamed(context, "/filterpage");
  }

  void onSearchChanged(BuildContext context, text) {
    Entry? entry;
    try {
      entry = catalog.firstWhere((element) => element.name == text);
    } catch (e) {
      entry = null;
    }
    List<Entry> resList = [];
    if (entry != null) {
    history.add(entry);
      resList.addAll(entry.adjecent);
      resList.removeWhere((alternativeEntry) {
        if (filterEnergieCheck &&
            alternativeEntry.name.allMatches("+").length !=
                filterEnergieSlider) {
          return true;
        }
        if (filterPreisCheck &&
            !(alternativeEntry.price >= filterPreisVonSlider &&
                alternativeEntry.price <= filterPreisBisSlider)) {
          return true;
        }
        if (filteroledCheck &&
            alternativeEntry.bildschirmtechnologie != "OLED") {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Your Alternative",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                "Finde bessere Alternativen",
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  _filterButton(() => onFilterPressed(context)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => onSearchChanged(context, value),
                      decoration: const InputDecoration(
                        hintText: "Suche nach Alternativen",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 20),
                  const SizedBox(width: 10),
                  const Text(
                    "Recently Searched",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                    return HistoryTile(
                      title: item.name,
                      onTap: () => onSearchChanged(context, item.name),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterButton(VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Ink(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: AppShadows.soft,
        ),
        child: const Icon(Icons.tune, size: 22),
      ),
    );
  }
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
              const Icon(Icons.search, size: 18, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({super.key});

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  List<Entry> _historyItems = [];

  void addToHistory(Entry newItem) {
    setState(() {
      _historyItems.add(newItem);
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
*/
