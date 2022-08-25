import 'package:flutter/material.dart';

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const <Widget>[
        ListTile(
          title: Text('Home'),
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
