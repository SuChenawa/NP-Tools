import 'package:flutter/material.dart';
import 'package:nptools/plugins/testpage.dart';
import 'package:nptools/res/pages/Tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nptools/plugins/random_dick_length.dart';

// ignore: camel_case_types
class init extends StatelessWidget {
  const init({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NPtools',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 主页面
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return SplitView(
      menu: const Menu(),
      content: selectedPageBuilder(context),
      breakpoint: 600,
      menuWidth: 240,
    );
  }
}

// 分栏视图
class SplitView extends StatelessWidget {
  const SplitView({
    Key? key,
    required this.menu,
    required this.content,
    this.breakpoint = 600,
    this.menuWidth = 240,
  }) : super(key: key);
  final Widget menu;
  final Widget content;
  final double breakpoint;
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= breakpoint) {
      // 宽屏情况下，直接显示菜单页
      return Row(
        children: [
          SizedBox(
            width: menuWidth,
            child: menu,
          ),
          Container(width: 0.5, color: Colors.black),
          Expanded(child: content),
        ],
      );
    } else {
      // 窄屏情况下收缩菜单页到抽屉中
      return Scaffold(
        body: content,
        drawer: SizedBox(
          width: menuWidth,
          child: Drawer(
            child: menu,
          ),
        ),
      );
    }
  }
}

// 菜单页
class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  // 选中页面选项，并触发状态，跳转到相应页面
  void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(selectedPageNameProvider.state).state != pageName) {
      ref.read(selectedPageNameProvider.state).state = pageName;
      // dismiss the drawer of the ancestor Scaffold if we have one
      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监视状态改变触发重绘
    final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(title: const Text('MENU')),
      body: ListView(
        children: <Widget>[
          for (var pageName in _availablePages.keys)
            PageListTile(
              // 3. pass the selectedPageName as an argument
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
        ],
      ),
    );
  }
}

// 主页页面模版
class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
  }) : super(key: key);
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        // 3. add a non-null leading argument if we have a drawer
        leading: hasDrawer
            ? IconButton(
                icon: const Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        title: Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // 依赖 selectedPageNameProvider 状态变化
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  // 返回相应页面的工厂函数
  return _availablePages[selectedPageKey]!;
});

// make this a `StateProvider` so we can change its value
final selectedPageNameProvider = StateProvider<String>((ref) {
  // default value
  return _availablePages.keys.first;
});
// a map of ("page name", WidgetBuilder) pairs
final _availablePages = <String, WidgetBuilder>{
  'Random_dick_length': (_) => const random_dick_length(),
  'TestPage': (_) => const secondpage(),
};
