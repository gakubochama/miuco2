import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider((ref) {
  return FirebaseAuth.instance.currentUser;
});

// エラー情報の受け渡しを行うためのProvider
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// 氏名の受け渡しを行うためのProvider
final nameProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

// アンケート項目1の回答の受け渡しを行うためのProvider
final questionnaire1Provider = StateProvider.autoDispose((ref) {
  return '';
});

// アンケート項目2の回答の受け渡しを行うためのProvider
final questionnaire2Provider = StateProvider.autoDispose((ref) {
  return '';
});

// アンケート項目3の回答の受け渡しを行うためのProvider
final questionnaire3Provider = StateProvider.autoDispose((ref) {
  return '';
});

// メッセージの受け渡しを行うためのProvider
final messageTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// StreamProviderを使うことでStreamも扱うことができる
final postsQueryProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('posts')
      .orderBy('date')
      .snapshots();
});

// for dropdownbutton in signup_users.dart
final isSelectedLanguageProvider = StateProvider.autoDispose<String?>((ref) {
  return '日本語';
});

final isSelectedSettingProvider = StateProvider.autoDispose<String?>((ref) {
  return '1';
});

// to implement bottomNavigationBar
enum ViewType { home, day, night, premium }

final mainHomeProvider =
    StateProvider.autoDispose<ViewType>((ref) => ViewType.home);

final
