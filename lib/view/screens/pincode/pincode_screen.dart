/* 
    Created by Bahromjon Po'lat
    Created at 26.08.2022 16:17
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/pincode/components/pin_buttons_row.dart';
import 'package:pos_mobile/view/screens/pincode/components/pin_holder.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class PincodeScreen extends StatelessWidget {
  const PincodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WhiteAppBar(),
      body: BlocProvider(
        create: (context) => PincodeBloc(),
        child: BlocListener<PincodeBloc, PincodeState>(
          listener: (context, state) {
            if (state is PincodeSuccessState) {
              AppNavigator.pushNamedAndRemoveUntil(RouteNames.home);
            }
            if (state is PincodeFailureState) {
              Fluttertoast.showToast(msg: 'Pin error');
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 125.h),
              const AppTitle('Pin-code'),
              SizedBox(height: 64.h),
              const Text('Enter pin code'),
              SizedBox(height: 26.h),
              const PinHolder(),
              const Spacer(),
              const PinButtonRow(labels: '123'),
              const PinButtonRow(labels: '456'),
              const PinButtonRow(labels: '789'),
              const PinButtonRow(labels: 'f0b'),
              SizedBox(height: 50.h),
            ],
          ).symmetricPadding(),
        ),
      ),
    );
  }
}
