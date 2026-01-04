import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';
import 'package:youralternative/topbar.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Entry> entries =
        ModalRoute.of(context)!.settings.arguments as List<Entry>;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(),
            Padding(padding: EdgeInsets.all(12.0), child: Text("Ergebnisse")),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return EntryCard(entry: entries[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EntryCard extends StatelessWidget {
  final Entry entry;
  const EntryCard({Key? key, required this.entry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (entry.advertisement) const Icon(Icons.star),
                if (entry.advertisement) const SizedBox(width: 4),
                if (entry.advertisement) const Text("Gesponsertes Ergebnis"),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.star),
                    const SizedBox(width: 4),
                    Text(
                      "${entry.rating}/5",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              entry.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(entry.description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                if (entry.datenschutzfreundlich != null)
                  Chip(
                    avatar: Icon(
                      entry.datenschutzfreundlich! ? Icons.check : Icons.close,
                    ),
                    label: const Text("Datenschutzfreundlich"),
                  ),
                if (entry.energieklasse != null)
                  Chip(
                    avatar: const Icon(Icons.energy_savings_leaf),
                    label: Text(entry.energieklasse!),
                  ),
                if (entry.bildschirmtechnologie != null)
                  Chip(
                    avatar: const Icon(Icons.tv),
                    label: Text(entry.bildschirmtechnologie!),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
