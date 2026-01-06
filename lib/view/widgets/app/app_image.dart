/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 11:24
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class AppImage extends StatelessWidget {
  final String imageUrl;
  double size;
  AppImage({
    Key? key,
    required this.imageUrl,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: size.h,
      width: size.w,
      fit: BoxFit.cover,
      placeholder: (context, w) => const CupertinoActivityIndicator(),
      errorWidget: (context, string, w) => const Text('No\nphoto'),
    );
  }
}
