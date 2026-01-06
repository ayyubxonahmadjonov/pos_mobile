/*
    Created by: Ayubxon Ahmadjonov
    Created date: 05/01/2026 16:05
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_mobile/bloc/auth/auth_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/auth/selecting_branch_screen.dart';
import 'package:pos_mobile/view/screens/home/home_screen.dart';
import 'package:pos_mobile/view/screens/auth/select_shop_screen.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WhiteAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppTitle(AppStrings.welcome),
          SizedBox(height: 64.h),

          /// PHONE
          Text(
            AppStrings.enterYourPhone,
            style: AppTextStyle.medium(size: 14),
          ),
          SizedBox(height: 8.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                AppInputField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: AppValidators.phone,
                  formatters: [AppValidators.phoneFormatter],
                  prefixIcon: Container(
                    alignment: Alignment.center,
                    width: 64.w,
                    child: const Text('+998'),
                  ),
                ),

                SizedBox(height: 16.h),

                /// PASSWORD
                AppInputField(
                  controller: _passwordController,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
              ],
            ),
          ),

          SizedBox(height: 38.h),

          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccessState) {
                final authBloc = context.read<AuthBloc>();
                authBloc.userCompany = state.loginResponseModel;
                final userCompany = authBloc.userCompany;
                if (userCompany?.companies.length == 1) {
                  authBloc
                      .add(SelectCompanyEvent(userCompany!.companies.first.id));
                } else {
                  AppNavigator.pushReplacement(
                    SelectingBranchScreen(companies: userCompany!.companies),
                  );
                }
              }

              if (state is AuthLoginFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
              if (state is SelectCompanySuccessState) {
                final authBloc = context.read<AuthBloc>();
                final userShops = authBloc.userShops;
                if (userShops != null &&
                    userShops.data != null &&
                    userShops.data!.isNotEmpty) {
                  if (userShops.data!.length == 1) {
                    authBloc.add(
                        SelectShopEvent(selectedShop: userShops.data?.first));
                  } else {
                    AppNavigator.pushReplacement(const SelectShopScreen());
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No shops found')),
                  );
                }
                AppNavigator.pushReplacement(const HomeScreen());
              }
            },
            builder: (context, state) {
              return PrimaryButton(
                isLoading: state is AuthLoginLoadingState,
                label: AppStrings.login,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final phone = _phoneController.text.replaceAll(' ', '');
                    final password = _passwordController.text;

                    context.read<AuthBloc>().add(
                          AuthLoginEvent(
                            '+998$phone',
                            password,
                          ),
                        );
                  }
                },
              );
            },
          ),
        ],
      ).symmetricPadding(),
    );
  }
}
