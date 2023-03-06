import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class situation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: <Widget>[_situationItem("瞑想"), _situationItem("寝かしつけ")],
      ),
    );
  }

  Widget _situationItem(String title) {
    return GestureDetector(
      child: Container(
        child: ElevatedButton(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            print(title);
          },
        ),
      ),
    );
  }
}
