import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cloud_storage.dart';

class music extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = [
      _musicItem("bed_time"),
      _musicItem("calming_down"),
      _musicItem("nap_time"),
      _musicItem("sleep_with_me"),
      _musicItem("wake_up"),
    ];
    return Scaffold(
      body: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        children: data,
      ),
    );
  }

  Widget _musicItem(String name) {
    final Future<Uint8List?> imagedata = CloudStorageService().downloadPicture(name)
    return Container(
      child: Image.asset(
        imagedata,
        fit: BoxFit.cover,
      ),
    );
  }
}
