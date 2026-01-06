/* 
    Created by Bahromjon Po'lat
    Created at 30.08.2022 16:26
*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/pincode/pincode_bloc.dart';
import 'package:pos_mobile/core/core.dart';

class PinButton extends StatelessWidget {
  final String label;
  const PinButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PincodeBloc, PincodeState>(
      builder: (context, state) {
        PincodeBloc bloc = context.read();

        return TextButton(
          style: TextButton.styleFrom(
            fixedSize: Size(110.w, 75.h),
            foregroundColor: AppColors.black,
            shape: const CircleBorder(),
          ),
          onPressed: () async {
            if (state is PincodeChangingState) {
              String pincode = state.pincode;
              if ('1234567890'.contains(label)) {
                bloc.add(PincodeChangedEvent(code: pincode + label));
              }
              if (label == 'b') {
                if (pincode.isEmpty) return;
                String pin = pincode.substring(0, pincode.length - 1);
                bloc.add(PincodeChangedEvent(code: pin));
              }
            }
          },
          child: _getChild(),
        );
      },
    );
  }

  Widget _getChild() {
    if (label == 'f') {
      return const Icon(Icons.fingerprint);
    }

    if (label == 'b') {
      return const Icon(Icons.backspace_outlined);
    }
    return Text(
      label,
      style: AppTextStyle.medium(size: 32.sp),
    );
  }
}
