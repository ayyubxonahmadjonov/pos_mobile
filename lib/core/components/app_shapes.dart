/// Created by Bahromjon Po'lat
/// Created at 26.08.2022 10:17

import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_mobile/core/constants/constants.dart';

class AppShapes {
  const AppShapes._();
  static RoundedRectangleBorder simple({double radius = 8.0}) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r));

  static BoxDecoration withBorder({
    double radius = 8,
    Color? borderColor,
    Color? color,
    double width = 1,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(
          width: width.w,
          color: borderColor ?? AppColors.borderColor,
        ),
      );

  static BoxDecoration withImage(
    String imageUrl, {
    Color? color,
    double radius = 8,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      );

  static BoxDecoration circular({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
      );

  static BoxDecoration cardStyle({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.r,
            spreadRadius: 0.5.r,
            color: AppColors.grey,
            offset: Offset(0, 1.h),
          )
        ],
        borderRadius: BorderRadius.circular(radius.r),
      );

  static BoxDecoration newCardStyle({
    double radius = 15,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.6.r,
            spreadRadius: 0.2.r,
            blurStyle: BlurStyle.inner,
            color: AppColors.grey.withOpacity(.4),
            offset: Offset(0, 6.h),
          ),
          BoxShadow(
            blurRadius: 0.6.r,
            spreadRadius: 0.2.r,
            blurStyle: BlurStyle.inner,
            color: AppColors.grey.withOpacity(.6),
            offset: Offset(0, 3.h),
          ),
          BoxShadow(
            blurRadius: 0.6.r,
            spreadRadius: 0.2.r,
            blurStyle: BlurStyle.inner,
            color: AppColors.grey.withOpacity(.8),
            offset: Offset(0, 2.h),
          ),
        ],
        borderRadius: BorderRadius.circular(radius.r),
      );

  static BoxDecoration bottomBarStyle({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      );
}
