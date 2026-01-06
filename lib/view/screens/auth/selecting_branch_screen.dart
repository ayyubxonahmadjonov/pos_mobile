/*
    Created by: Bahromjon Po'lat
    Created at: 30.08.2022 16:14
*/

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/auth/auth_bloc.dart';
import 'package:pos_mobile/bloc/get_items/get_items_bloc.dart';
import 'package:pos_mobile/core/constants/app_loader.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/models/company_model.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/auth/select_shop_screen.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class SelectingBranchScreen extends StatefulWidget {
  final List<CompanyModel> companies;

  const SelectingBranchScreen({Key? key, required this.companies})
      : super(key: key);

  @override
  State<SelectingBranchScreen> createState() => _SelectingBranchScreenState();
}

class _SelectingBranchScreenState extends State<SelectingBranchScreen> {
  String? selectedCompanyId;

  void selectCompany() {
    if (selectedCompanyId != null) {
      context.read<AuthBloc>().add(SelectCompanyEvent(selectedCompanyId!));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a company")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double maxListHeight = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WhiteAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle(AppStrings.branch),
          SizedBox(height: 64.h),
          const Text(AppStrings.selectBranch),
          SizedBox(height: 8.h),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: const Text(
                "Select company",
                style: TextStyle(fontSize: 16),
              ),
              items: widget.companies.map((company) {
                return DropdownMenuItem<String>(
                  value: company.id,
                  child: Text(
                    company.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              value: selectedCompanyId,
              onChanged: (value) {
                setState(() {
                  selectedCompanyId = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFF2F2F2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: maxListHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFF2F2F2),
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.blue.shade700),
                openMenuIcon:
                    Icon(Icons.keyboard_arrow_up, color: Colors.blue.shade700),
              ),
            ),
          ),
          const SizedBox(height: 35),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SelectCompanyFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
              if (state is SelectCompanySuccessState) {
                AppNavigator.pushReplacement(const SelectShopScreen());
              }
            },
            builder: (context, state) {
              if (state is SelectCompanyLoadingState) {
                return AppLoader(
                  secondRingColor: Colors.grey.withOpacity(0.8),
                  thirdRingColor: Colors.grey.withOpacity(0.6),
                  size: 35,
                );
              }
              return PrimaryButton(
                label: 'Tasdiqlash',
          
                onPressed: () {
                  selectCompany();
                },
              );
            },
          ),
        ],
      ).symmetricPadding(),
    );
  }
}
