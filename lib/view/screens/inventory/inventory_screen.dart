/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 17:22:22
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Flow(
        delegate: AppFlowDelegate(),
      ),
    );
  }
}

class AppFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {}

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
