import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'signup_top.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: miuco(),
    ),
  );
}

class miuco extends StatelessWidget {
  const miuco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miuco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signupTop(),
    );
  }
}
