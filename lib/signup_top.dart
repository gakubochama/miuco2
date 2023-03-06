import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login.dart';
import 'signup_mail.dart';

class signupTop extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('はじめる'),
                  onPressed: () async {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return signupMail();
                      }),
                    );
                  },
                ),
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'アカウントをお持ちの方は',
                      ),
                      TextSpan(
                        text: 'ログイン',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return login();
                              }),
                            );
                          },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 200),
              Container(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: 'ご利用を開始またはログインすることで、'),
                      TextSpan(
                        text: '利用規約',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'および',
                      ),
                      TextSpan(
                        text: 'プライバシーポリシー',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: 'に同意したものとみなされます。'),
                    ],
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
