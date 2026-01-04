import 'package:flutter/material.dart';
import 'package:youralternative/topbar.dart';

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
  final List<String> indexToEnergie = ["A", "A+", "A++", "A+++", "A++++"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Column(
            children: [
              Text("Energieklasse"),
              Row(
                children: [
                  Checkbox(
                    value: filterEnergieCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        filterEnergieCheck = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Slider(
                      //year2023: false,
                      value: filterEnergieSlider,
                      min: 0,
                      max: 4,
                      divisions: 5,
                      label: indexToEnergie[filterEnergieSlider.round()-1],
                      onChanged: (double value) {
                        setState(() {
                          filterEnergieSlider = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text("Bildschirmtechnologie"),
              Center(
                child: Row(
                  children: [
                    Text("OLED"),
                    Checkbox(
                      value: filteroledCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          filteroledCheck = value!;
                        });
                      },
                    ),
                    Text("LED"),
                    Checkbox(
                      value: filterledCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          filterledCheck = value!;
                        });
                      },
                    ),
                    Text("Plasma"),
                    Checkbox(
                      value: filterplasmaCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          filterplasmaCheck = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text("Preis"),
              Row(
                children: [
                  Checkbox(
                    value: filterPreisCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        filterPreisCheck = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Slider(
                      //year2023: false,
                      value: filterPreisVonSlider,
                      //TODO nicht reactive auf die aktuellen filter
                      max: 1499.99,
                      min: 29.99,
                      label: filterPreisVonSlider.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          filterPreisVonSlider = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      //year2023: false,
                      value: filterPreisBisSlider,
                      //TODO nicht reactive auf die aktuellen filter
                      max: 1499.99,
                      min: 29.99,
                      label: filterPreisBisSlider.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          filterPreisBisSlider = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text("Datenschutzfreundlich"),
              Row(
                children: [
                  Checkbox(
                    value: filterDatenschutzfreundlich,
                    onChanged: (bool? value) {
                      setState(() {
                        filterDatenschutzfreundlich = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text("Bewertung"),
              Row(
                children: [
                  Checkbox(
                    value: filterBewertungCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        filterBewertungCheck = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Slider(
                      //year2023: false,
                      value: filterBewertungSlider,
                      max: 5,
                      min: 1,
                      divisions: 5,
                      label: filterBewertungSlider.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          filterBewertungSlider = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
