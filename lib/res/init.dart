import 'package:flutter/material.dart';
import 'List/Listdata.dart';

class ToolsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuContent();
  }
}

class init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
