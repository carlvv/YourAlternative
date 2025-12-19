import 'package:flutter/material.dart';
import 'package:youralternative/common.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void onFilterPressed() {
    print("Filter");
  }

  void onSearchPressed() {
    print("Search");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YourAlternative"),
        centerTitle: true,
        /*leading: IconButton(
          onPressed: () => {print(catalog[0])},
          icon: Icon(Icons.arrow_back),
        ),*/
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: onFilterPressed, icon: Icon(Icons.menu)),
              Container(width: 20, child: TextField()),
              IconButton(
                onPressed: onSearchPressed,
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
          Row(children: [ReclentlyViewed()]),
        ],
      ),

      /*
       Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: onFilterPressed, icon: Icon(Icons.menu)),
            Container(width: 20, child: TextField()),
            IconButton(
              onPressed: onSearchPressed,
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),*/
    );
  }
}

class ReclentlyViewed extends StatefulWidget {
  const ReclentlyViewed({super.key});

  @override
  State<ReclentlyViewed> createState() => _ReclentlyViewedState();
}

class _ReclentlyViewedState extends State<ReclentlyViewed> {
  @override
  Widget build(BuildContext context) {
    //von array / datei lesen
    //irgendwie mit Row() oder so
    List<Widget> historyWidgets = [];
    for (int i = 0; i < history.length; i++) {
      print(history[i].toString());
      historyWidgets.add(
        Row(
          children: [
            Text(history[i].name),
            Text(history[i].price.toString()),
            Text(history[i].rating.toString()),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      );
    }

    return Column(children: historyWidgets);
  }
}
