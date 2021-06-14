import 'package:bots/modules/bottom.nav.bar/views/bottom.nav.bar.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}
