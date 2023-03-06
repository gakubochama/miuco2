import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'music.dart';

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
                height: 40,
                child: Text(
                  "music",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            child: music(), //音楽
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                height: 40,
                child: Text(
                  "story",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            child: music(), //音楽
          ),
        ],
      ),
    );
  }
}
