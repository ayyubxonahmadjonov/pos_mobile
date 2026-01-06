/*
    @author Ayubxon Ahmadjonov
    Created: 05/01/2026
*/

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_mobile/bloc/auth/auth_bloc.dart';
import 'package:pos_mobile/core/constants/app_loader.dart';
import 'package:pos_mobile/core/constants/app_strings.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/required_data/user_shops.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/home/home.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class SelectShopScreen extends StatefulWidget {
  const SelectShopScreen({super.key});

  static const route = '/select_shop';

  @override
  State<SelectShopScreen> createState() => _SelectShopScreenState();
}

class _SelectShopScreenState extends State<SelectShopScreen> {
  MainShop? selectedShop;

  void selectShop() {
    if (selectedShop == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a store')),
      );
      return;
    }
    context.read<AuthBloc>().add(SelectShopEvent(selectedShop: selectedShop));
  }

  @override
  Widget build(BuildContext context) {
    final double maxListHeight = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WhiteAppBar(),
      backgroundColor: const Color(0xFFEBF0F4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final userShops = context.read<AuthBloc>().userShops;

            if (state is SelectCompanyLoadingState || state is AuthLoginLoadingState || userShops == null) {
              return Center(
                child: AppLoader(size: 35),
              );
            }

            if (userShops.data == null || userShops.data!.isEmpty) {
              return const Center(child: Text("No stores found"));
            }

            return Column(
    mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const AppTitle(AppStrings.store),
          SizedBox(height: 64.h),
          const Text(AppStrings.select_store),
          SizedBox(height: 8.h),
                // Dropdown
                DropdownButtonHideUnderline(
                  child: DropdownButton2<MainShop>(
                    isExpanded: true,
                    hint: const Text(
                      "Select Store",
                      style: TextStyle(fontSize: 16),
                    ),
                    items: userShops.data!.map((shop) {
                      return DropdownMenuItem<MainShop>(
                        value: shop,
                        child: Text(shop.title ?? '', style: const TextStyle(fontSize: 15)),
                      );
                    }).toList(),
                    value: selectedShop,
                    onChanged: (value) {
                      setState(() {
                        selectedShop = value;
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: maxListHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff2B5278)),
                      openMenuIcon: const Icon(Icons.keyboard_arrow_up, color: Color(0xff2B5278)),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                // Confirm button
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SelectShopFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                    if (state is SelectShopSuccessState) {
                      AppNavigator.pushReplacement(const HomeScreen());
                    }
                  },
                  builder: (context, state) {
                    if (state is SelectShopLoadingState) {
                      return AppLoader(
                        color: const Color(0xff2B5278),
                        secondRingColor: const Color(0xff2B5278).withOpacity(0.8),
                        thirdRingColor: const Color(0xff2B5278).withOpacity(0.6),
                        size: 35,
                      );
                    }
                    return PrimaryButton(
                      label: "Confirm",
                      onPressed: selectShop,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
