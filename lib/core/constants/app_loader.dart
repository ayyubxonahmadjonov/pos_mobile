/*
    @author Suxrob Sattorov, 1/18/2025, 1:44 PM
*/

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader extends StatelessWidget {
  Color? color;
  Color? secondRingColor;
  Color? thirdRingColor;
  double? size;

  AppLoader({
    super.key,
    this.color,
    this.secondRingColor,
    this.thirdRingColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: color ?? Colors.white,
        secondRingColor: secondRingColor ?? Colors.white70,
        thirdRingColor: thirdRingColor ?? Colors.white60,
        size: size ?? 50,
      ),
    );
  }
}
