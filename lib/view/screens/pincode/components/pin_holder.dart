/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 15:35:33
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';

class PinHolder extends StatelessWidget {
  const PinHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PincodeBloc, PincodeState>(
      builder: (context, state) {
        return Center(
          child: Wrap(
            spacing: 25.w,
            children: List.generate(4, (i) {
              Color color = AppColors.grey;
              String pincode = '';

              if (state is PincodeChangingState) {
                pincode = state.pincode;
              }

              if (state is PincodeSuccessState) {
                color = AppColors.primary;
              }

              if (pincode.length > i) {
                color = AppColors.primary;
              } else {
                color = AppColors.grey;
              }

              if (state is PincodeFailureState) {
                color = AppColors.red;
              }

              return CircleAvatar(
                radius: 12.5.r,
                backgroundColor: color,
              );
            }),
          ),
        );
      },
    );
  }
}
