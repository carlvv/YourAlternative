import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final List<Entry> entries =
        ModalRoute.of(context)!.settings.arguments as List<Entry>;

    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            title: Text(entry.name),
            subtitle: Text(entry.price.toString()),
            trailing: Text(entry.rating.toString()),
          );
        },
      ),
    );
  }
}