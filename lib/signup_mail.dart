import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';
import 'signup_questions.dart';

class signupMail extends ConsumerWidget {
  const signupMail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/sample.png'),
              TextFormField(
                decoration: const InputDecoration(labelText: '氏名'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(nameProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(emailProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード(８文字以上)'),
                obscureText: true,
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(passwordProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('次へ'),
                  onPressed: () async {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return signupQuestions();
                      }),
                    );
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
