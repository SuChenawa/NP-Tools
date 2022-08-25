import 'package:flutter/material.dart';
import 'res/Listdata.dart';
import 'package:nptools/plugins/random_dick_length.dart';

void main() {
  runApp(Nptools());
}

class Nptools extends StatelessWidget {
  const Nptools({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Toolsbar'),
          leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
          ),
          actions: const [
            IconButton(
              onPressed: null,
              tooltip: 'Search',
              icon: Icon(Icons.search),
            )
          ],
        ),
        // body: HomeContentdata(),
        body: ToolsList(),
      ),
      theme: ThemeData.dark(),
    );
  }
}

class ToolsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuContent();
  }
}
