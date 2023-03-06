/// Flutter
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CloudStorageService {
  /// UserIDの取得
  //final userID = FirebaseAuth.instance.currentUser?.uid ?? '';

/*
  void uploadPicture() async {
    try {
      /// 画像を選択
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      File file = File(image!.path);

      /// Firebase Cloud Storageにアップロード
      String uploadName = 'image.png';
      final storageRef =
          FirebaseStorage.instance.ref().child('users/$userID/$uploadName');
      final task = await storageRef.putFile(file);
    } catch (e) {
      print(e);
    }
  }
*/

  /// 画像のダウンロード
  Future<Uint8List?> downloadPicture(String name) async {
    try {
      /// 参照の作成
      final storageRef =
          FirebaseStorage.instance.ref().child("music/$name.png");

      /// 画像をメモリに保存し、Uint8Listへ変換
      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await storageRef.getData(oneMegabyte);
      return data;
    } catch (e) {
      print(e);
    }
  }
/*
  /// 画像の削除
  void deletePicture(WidgetRef ref, String name) async {
    /// 参照の作成
    String deleteName = 'image.png';
    final storageRef =
        FirebaseStorage.instance.ref().child('users/$userID/$deleteName');

    /// Cloud Storageから削除
    await storageRef.delete();

    /// メモリから削除
    ref.read(imageStateProvider.state).state = null;
  }
*/
/*
  void uploadMusic() async {
    try {
      /// 画像を選択
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      File file = File(image!.path);

      /// Firebase Cloud Storageにアップロード
      String uploadName = 'image.png';
      final storageRef =
          FirebaseStorage.instance.ref().child('users/$userID/$uploadName');
      final task = await storageRef.putFile(file);
    } catch (e) {
      print(e);
    }
  }
*/

  /// 音楽のダウンロード
  Future<Uint8List?> downloadMusic(WidgetRef ref, String name) async {
    try {
      /// 参照の作成
      final storageRef =
          FirebaseStorage.instance.ref().child("music/$name.mp3");

      /// 画像をメモリに保存し、Uint8Listへ変換
      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await storageRef.getData(oneMegabyte);
      return data;
    } catch (e) {
      print(e);
    }
  }
/*
  /// 画像の削除
  void deleteMusic(WidgetRef ref) async {
    /// 参照の作成
    String deleteName = 'image.png';
    final storageRef =
        FirebaseStorage.instance.ref().child('users/$userID/$deleteName');

    /// Cloud Storageから削除
    await storageRef.delete();

    /// メモリから削除
    ref.read(imageStateProvider.state).state = null;
  }
 */
}
