import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

extension WidgetExt on Widget {
  Expanded wrapExpanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Container wrapContainer({
    double radius = 8.0,
    Color? color,
  }) =>
      Container(
        alignment: Alignment.centerLeft,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: color ?? AppColors.lightGrey,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: this,
      );

  Visibility visibility({bool visible = true}) => Visibility(
        visible: visible,
        child: this,
      );

  Padding symmetricPadding({double h = 22, double v = 0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h.w, vertical: v.h),
        child: this,
      );

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Align toAlign({Alignment alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );

  Widget onClick(VoidCallback? onTap, {double radius = 0.0}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius.r),
      child: this,
    );
  }

  Widget screenLoading({bool visible = false}) => Stack(
        children: [
          this,
          Container(
            color: AppColors.primary.withOpacity(.1),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ).visibility(visible: visible)
        ],
      );
}
