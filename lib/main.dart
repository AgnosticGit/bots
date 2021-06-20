import 'package:bots/models/task.model.dart';
import 'package:bots/modules/bottom.nav.bar/views/bottom.nav.bar.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: AppColors.mainAppColor),
      home: BottomNavBar(),
    );
  }
}
