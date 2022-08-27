import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'res/init.dart';

void main() {
  runApp(const ProviderScope(child: Nptools()));
}

class Nptools extends StatelessWidget {
  const Nptools({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const init();
  }
}
