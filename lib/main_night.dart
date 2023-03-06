import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class mainNight extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.mode_night,
        ),
      ),
    );
  }
}
