import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class mainHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.home,
        ),
      ),
    );
  }
}
