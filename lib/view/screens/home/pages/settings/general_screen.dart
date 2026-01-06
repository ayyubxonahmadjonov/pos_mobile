/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 18:42
*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';
import 'package:pos_mobile/core/core.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _languageController = TextEditingController(text: "O'zbek");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(title: 'General'),
      body: Column(
        children: [
          // EMAIL

          InputWithTitle(
            controller: _emailController,
            title: 'Email',
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),

          // NAME

          InputWithTitle(
            controller: _nameController,
            title: 'Name',
            hint: 'Businnes name',
            keyboardType: TextInputType.name,
          ),

          // LANGUAGE

          InputWithTitle(
            controller: _languageController,
            title: 'Language',
            readOnly: true,
            suffixIcon: const Icon(AppIcons.arrowRight),
            onTap: _showLanguage,
          ),
          const Spacer(),

          // SAVE BUTTON
          PrimaryButton(
            label: 'Save',
            onPressed: () {},
          )
        ],
      ).symmetricPadding(h: 16, v: 20),
    );
  }

  void _showLanguage() {
    AppDialog dialog = AppDialog(context);
    dialog.showCupertinoModalSheet(
      actions: [
        _setAction("O'zbek"),
        _setAction("Russkie"),
        _setAction("English"),
      ],
    );
  }

  AppCupertinoAction _setAction(String language) => AppCupertinoAction(
        label: language,
        isDefault: language == _languageController.text,
        onPressed: () {
          _languageController.text = language;
          AppNavigator.pop();
        },
      );
}
