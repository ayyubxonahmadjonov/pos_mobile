/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 15:31:34
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'package:flutter/material.dart';

import 'pin_button.dart';

class PinButtonRow extends StatelessWidget {
  final String labels;
  const PinButtonRow({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinButton(label: labels[0]),
        PinButton(label: labels[1]),
        PinButton(label: labels[2]),
      ],
    );
  }
}
