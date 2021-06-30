import 'package:bots/stores/global.store.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Widget build(BuildContext context) {
    if (GlobalStore.to.isLoading) {
      return IgnorePointer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
