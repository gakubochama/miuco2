import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';
import 'top.dart';

class signupQuestions extends ConsumerWidget {
  const signupQuestions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final infoText = ref.watch(infoTextProvider);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/sample.png'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'アンケート項目1'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(questionnaire1Provider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'アンケート項目2'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(questionnaire2Provider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'アンケート項目3'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(questionnaire3Provider.notifier).state = value;
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('登録する'),
                  onPressed: () async {
                    try {
                      final user = (await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      ))
                          .user;
                      if (user != null) {
                        print("認証ok");
                      } else {
                        print("認証失敗");
                      }
                      // FireStoreに新規登録ユーザーの情報を書き込む
                      await FirebaseFirestore.instance.collection("users").add({
                        "name": name,
                        "email": email,
                        "password": password,
                        "createAt": Timestamp.now(),
                      });

                      // ユーザー情報を更新
                      ref.read(userProvider.state).state = user;
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return top();
                        }),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      ref.read(infoTextProvider.notifier).state =
                          "登録に失敗しました：${e.toString()}";
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
