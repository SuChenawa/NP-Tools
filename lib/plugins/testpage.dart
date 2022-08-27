import 'package:flutter/material.dart';
import 'package:nptools/res/init.dart';

// ignore: camel_case_types
class secondpage extends StatelessWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'TestPage',
      body: Center(
        child: Text('测试', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
