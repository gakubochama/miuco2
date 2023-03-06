import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_view.dart';
import 'provider.dart';

class signupUsers extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orange), //背景の色
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(25)), //余白
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 15))),
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return mainView();
                  }),
                );
              },
              child: const Text('完了'),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/sample.png'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ユーザ名'),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(left: 80),
                width: 300,
                color: Colors.white,
                child: DropdownButton<String>(
                  hint: Text('言語環境'),
                  items: const [
                    DropdownMenuItem(
                      child: Text('日本語'),
                      value: '日本語',
                    ),
                    DropdownMenuItem(
                      child: Text('英語'),
                      value: '英語',
                    ),
                    DropdownMenuItem(
                      child: Text('中国語'),
                      value: '中国語',
                    ),
                  ],
                  onChanged: (String? value) => ref
                      .read(isSelectedLanguageProvider.notifier)
                      .state = value!,
                  value: ref.watch(isSelectedLanguageProvider),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(left: 80),
                width: 300,
                color: Colors.white,
                child: DropdownButton<String>(
                  hint: Text('その他設定'),
                  items: const [
                    DropdownMenuItem(
                      child: Text('1'),
                      value: '1',
                    ),
                    DropdownMenuItem(
                      child: Text('2'),
                      value: '2',
                    ),
                    DropdownMenuItem(
                      child: Text('3'),
                      value: '3',
                    ),
                  ],
                  onChanged: (String? value) => ref
                      .read(isSelectedSettingProvider.notifier)
                      .state = value!,
                  value: ref.watch(isSelectedSettingProvider),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
