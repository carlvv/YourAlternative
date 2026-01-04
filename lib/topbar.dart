import 'package:flutter/material.dart';
import 'package:youralternative/pages/filter.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/theme/app_theme.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String _searchText = '';
  bool _isFilterActive = false;

  void _onSearchChanged(BuildContext context, String text) {
    setState(() {
      _searchText = text;
    });
    Entry? entry;
    try {
      entry = catalog.firstWhere((element) => element.name == text);
    } catch (e) {
      entry = null;
    }
    List<Entry> resList = [];
    if (entry != null) {
      Entry? last = history.lastOrNull;
      if (last == null) {
        history.add(entry);
      } else if (last.name != text) {
        history.add(entry);
      }

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

  void _onFilterPressed(BuildContext context) {
    setState(() {
      _isFilterActive = !_isFilterActive;
    });
    Navigator.pushNamed(context, "/filterpage");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Your Alternative",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            "Finde bessere Alternativen",
            style: TextStyle(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              IconButton(
                onPressed: () => _onFilterPressed(context),
                icon: Icon(
                  Icons.tune,
                  color: _isFilterActive ? Colors.blue : null,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TextField(
                  onSubmitted: (value) => _onSearchChanged(context, value),
                  decoration: const InputDecoration(
                    hintText: "Suche nach Alternativen",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
