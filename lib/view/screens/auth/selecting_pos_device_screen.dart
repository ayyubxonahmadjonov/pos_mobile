/*
    Created by: Bahromjon Po'lat
    Created at: 27.08.2022 10:40
*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class SelectingPosDeviceScreen extends StatefulWidget {
  const SelectingPosDeviceScreen({Key? key}) : super(key: key);

  @override
  State<SelectingPosDeviceScreen> createState() =>
      _SelectingPosDeviceScreenState();
}

class _SelectingPosDeviceScreenState extends State<SelectingPosDeviceScreen> {
  final TextEditingController _posDeviceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle('POS device'),
          SizedBox(height: 64.h),
          const Text('Choose pos device'),
          SizedBox(height: 8.h),
          Form(
            key: _formKey,
            child: AppInputField(
              controller: _posDeviceController,
              hint: 'Device',
              readOnly: true,
              validator: (v) => v!.isEmpty ? 'Please select a device' : null,
              suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
              onTap: () {
                AppDialog dialog = AppDialog(context);
                dialog.showCupertinoModalSheet(
                  actions: [
                    _setAction('device 1'),
                    _setAction('device 2'),
                    _setAction('device 3'),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 38.h),
          PrimaryButton(
            label: 'Next',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                AppNavigator.pushNamedAndRemoveUntil(RouteNames.pincode);
              }
            },
          ),
        ],
      ).symmetricPadding(),
    );
  }

  AppCupertinoAction _setAction(String posDevice) => AppCupertinoAction(
        label: posDevice,
        isDefault: posDevice == _posDeviceController.text,
        onPressed: () {
          _posDeviceController.text = posDevice;
          AppNavigator.pop();
        },
      );
}
