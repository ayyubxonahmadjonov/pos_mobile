/* 
    Created by Bahromjon Po'lat
    Created at 01.09.2022 10:35
*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';
import 'package:pos_mobile/core/core.dart';

class EditingProfileScreen extends StatefulWidget {
  const EditingProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditingProfileScreen> createState() => _EditingProfileScreenState();
}

class _EditingProfileScreenState extends State<EditingProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const  SimpleAppBar(title: 'title'),
      body: Column(
        children: [
          InputWithTitle(
            title: 'Name',
            controller: _nameController,
            hint: 'Enter name',
          ),
          const Spacer(),
          PrimaryButton(
            label: 'Save',
            onPressed: () {},
          )
        ],
      ).symmetricPadding(h: 16),
    );
  }
}
