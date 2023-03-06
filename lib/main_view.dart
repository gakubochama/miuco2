import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miuco/provider.dart';

import 'main_day.dart';
import 'main_home.dart';
import 'main_night.dart';
import 'main_premium.dart';

class mainView extends ConsumerWidget {
  bool searchBoolean = false;
  final widgets = [
    mainHome(),
    mainDay(),
    mainNight(),
    mainPremium(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(mainHomeProvider.state);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text(view.state.name),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.face,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: widgets[view.state.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "day"),
          BottomNavigationBarItem(icon: Icon(Icons.mode_night), label: "night"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "premium"),
        ],
        currentIndex: view.state.index,
        onTap: (int index) => view.update((state) => ViewType.values[index]),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
