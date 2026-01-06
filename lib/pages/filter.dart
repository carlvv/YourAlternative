import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

double filterEnergieSlider = 1;
bool filterEnergieCheck = false;

bool filteroledCheck = false;
bool filterledCheck = false;
bool filterplasmaCheck = false;

bool filterPreisCheck = false;
double filterPreisVonSlider = 29.99;
double filterPreisBisSlider = 1499.99;

bool filterDatenschutzfreundlich = false;

bool filterBewertungCheck = false;
double filterBewertungSlider = 5;

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> indexToEnergie = ["A", "A+", "A++", "A+++", "A+++"];

  void _resetAll() {
    setState(() {
      filterEnergieSlider = 1;
      filterEnergieCheck = false;

      filteroledCheck = false;
      filterledCheck = false;
      filterplasmaCheck = false;

      filterPreisCheck = false;
      filterPreisVonSlider = 29.99;
      filterPreisBisSlider = 1499.99;

      filterDatenschutzfreundlich = false;

      filterBewertungCheck = false;
      filterBewertungSlider = 5;
    });
  }

  Widget _sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _pillButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context, true),
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        child: const Text(
          "Filter anwenden",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: surface,
              borderRadius: const BorderRadius.vertical(
                //top: Radius.circular(22),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 10, 10),
                  child: Row(
                    children: [
                      Text(
                        "Filter",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: onSurface,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context, false),
                        icon: const Icon(Icons.close),
                        splashRadius: 22,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: _resetAll,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text("Alle zurücksetzen"),
                    ),
                  ),
                ),
                const Divider(height: 1),
                Flexible(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
                    children: [
                      _sectionTitle(Icons.energy_savings_leaf, "Energieklasse"),
                      Row(
                        children: [
                          Checkbox(
                            value: filterEnergieCheck,
                            onChanged: (v) =>
                                setState(() => filterEnergieCheck = v ?? false),
                          ),
                          Expanded(
                            child: Opacity(
                              opacity: filterEnergieCheck ? 1 : 0.45,
                              child: Slider(
                                value: filterEnergieSlider,
                                min: 0,
                                max: 4,
                                divisions: 4,
                                label:
                                    indexToEnergie[filterEnergieSlider.round()],
                                onChanged: filterEnergieCheck
                                    ? (value) => setState(
                                        () => filterEnergieSlider = value,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),

                      _sectionTitle(Icons.tv, "Bildschirmtechnologie"),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("OLED"),
                        value: filteroledCheck,
                        onChanged: (v) =>
                            setState(() => filteroledCheck = v ?? false),
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("LED"),
                        value: filterledCheck,
                        onChanged: (v) =>
                            setState(() => filterledCheck = v ?? false),
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Plasma"),
                        value: filterplasmaCheck,
                        onChanged: (v) =>
                            setState(() => filterplasmaCheck = v ?? false),
                      ),

                      _sectionTitle(Icons.euro, "Preis"),
                      Row(
                        children: [
                          Checkbox(
                            value: filterPreisCheck,
                            onChanged: (v) =>
                                setState(() => filterPreisCheck = v ?? false),
                          ),
                          Expanded(
                            child: Opacity(
                              opacity: filterPreisCheck ? 1 : 0.45,
                              child: Slider(
                                value: filterPreisVonSlider,
                                max: 1499.99,
                                min: 29.99,
                                label: "${filterPreisVonSlider.round()}",
                                onChanged: filterPreisCheck
                                    ? (value) {
                                        setState(() {
                                          filterPreisVonSlider = value;
                                          if (filterPreisVonSlider >
                                              filterPreisBisSlider) {
                                            filterPreisBisSlider =
                                                filterPreisVonSlider;
                                          }
                                        });
                                      }
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Opacity(
                              opacity: filterPreisCheck ? 1 : 0.45,
                              child: Slider(
                                value: filterPreisBisSlider,
                                max: 1499.99,
                                min: 29.99,
                                label: "${filterPreisBisSlider.round()}",
                                onChanged: filterPreisCheck
                                    ? (value) {
                                        setState(() {
                                          filterPreisBisSlider = value;
                                          if (filterPreisBisSlider <
                                              filterPreisVonSlider) {
                                            filterPreisVonSlider =
                                                filterPreisBisSlider;
                                          }
                                        });
                                      }
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),

                      _sectionTitle(Icons.shield_outlined, "Datenschutz"),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Datenschutzfreundlich"),
                        value: filterDatenschutzfreundlich,
                        onChanged: (v) => setState(
                          () => filterDatenschutzfreundlich = v ?? false,
                        ),
                      ),

                      _sectionTitle(Icons.lock_outline, "Sicherheit"),
                      const Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Text(
                          "Verschlüsselung",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),

                      _sectionTitle(Icons.star_outline, "Bewertung"),
                      Row(
                        children: [
                          Checkbox(
                            value: filterBewertungCheck,
                            onChanged: (v) => setState(
                              () => filterBewertungCheck = v ?? false,
                            ),
                          ),
                          Expanded(
                            child: Opacity(
                              opacity: filterBewertungCheck ? 1 : 0.45,
                              child: Slider(
                                value: filterBewertungSlider,
                                max: 5,
                                min: 1,
                                divisions: 4,
                                label: filterBewertungSlider.round().toString(),
                                onChanged: filterBewertungCheck
                                    ? (value) => setState(
                                        () => filterBewertungSlider = value,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 90),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 16),
                  child: _pillButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
