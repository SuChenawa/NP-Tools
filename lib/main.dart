import 'package:flutter/material.dart';
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
        body: MenuContent(),
      ),
      theme: ThemeData.dark(),
    );
  }
}

class HomeContentdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 110, 110)),
        child: const Text(
          'data',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const <Widget>[
        ListTile(
          title: Text('data'),
          subtitle: Text('subtitle'),
          leading: Icon(Icons.home),
        ),
        ListTile(
          title: Text('data'),
          subtitle: Text('subtitle'),
          leading: Icon(Icons.rule_rounded),
        ),
        ListTile(
          title: Text('Settings'),
          subtitle: Text('subtitle'),
          leading: Icon(Icons.settings),
        ),
      ],
    );
  }
}
