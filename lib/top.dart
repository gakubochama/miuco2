import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signup_users.dart';

class top extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("どなたが使いますか？"),
              ),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.topLeft,
                width: 500,
                height: 500,
                child: SizedBox(
                  width: 200, //横幅
                  height: 50, //高さ
                  child: FloatingActionButton(
                    onPressed: () async {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return signupUsers();
                        }),
                      );
                    },
                    backgroundColor: Colors.blue,
                    child: const Text(
                      '追加する',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
