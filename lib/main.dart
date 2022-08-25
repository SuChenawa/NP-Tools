import 'package:flutter/material.dart';
import 'res/init.dart';

void main() {
  runApp(Nptools());
}

class Nptools extends StatelessWidget {
  const Nptools({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return init();
  }
}
