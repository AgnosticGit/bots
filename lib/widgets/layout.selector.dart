import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutSelector extends StatelessWidget {
  const LayoutSelector({
    this.mobileLayout,
    this.tabletLayout,
  }) : assert(mobileLayout != null || tabletLayout != null);

  final Widget? mobileLayout;
  final Widget? tabletLayout;

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    if (width < height) {
      if (mobileLayout == null) return tabletLayout!;
      return mobileLayout!;
    } else {
      if (tabletLayout == null) return mobileLayout!;
      return tabletLayout!;
    }
  }
}
