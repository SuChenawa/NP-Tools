import 'package:flutter/material.dart';

import '../res/init.dart';

class random_dick_length extends StatelessWidget {
  const random_dick_length({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Random_dick-length',
      body: Center(
        child: Text('Random_dick-length',
            style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
