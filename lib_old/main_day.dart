import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'music.dart';
import 'situation.dart';

class mainDay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 100,
                child: Text(
                  "Good Day",
                  style: TextStyle(
                    fontSize: 70.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 30,
                child: ElevatedButton(
                  child: Text(
                    "おすすめの曲",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    print("おすすめの曲");
                  },
                ),
              ),
              Container(
                height: 30,
                child: ElevatedButton(
                  child: Text(
                    "最近再生した曲",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    print("最近再生した曲");
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 250,
            child: music(), //音楽
          ),
          Row(
            children: <Widget>[
              Container(
                height: 30,
                child: Text(
                  "シチュエーションを選ぶ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            child: situation(), //シチュエーション
          ),
        ],
      ),
    );
  }
}
