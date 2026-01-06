// /*
//     Created by: Bahromjon Po'lat.
//     Created date: 26/08/2022 15:37
// */

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pos_mobile/bloc/auth/auth_bloc.dart';
// import 'package:pos_mobile/core/core.dart';
// import 'package:pos_mobile/routes/routes.dart';
// import 'package:pos_mobile/services/api_requests.dart';
// import 'package:pos_mobile/view/widgets/widgets.dart';

// class VerifyOtpScreen extends StatefulWidget {
//   const VerifyOtpScreen({Key? key}) : super(key: key);

//   @override
//   State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
// }

// class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final _timerController = StreamController<int>();
//   Timer? _timer;
//   int _startTime = 180;

//   @override
//   void initState() {
//     super.initState();

//     _timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         if (_startTime == 0) {
//           _timer?.cancel();
//         } else {
//           _startTime--;
//           _timerController.sink.add(_startTime);
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     if (_timer != null) _timer!.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthVerifySuccessState) {
//           AppNavigator.pushNamed(RouteNames.selectingBranch);
//           ApiRequests.instance.getEmployees();
//         }

//         if (state is AuthVerifyFailedState) {
//           Fluttertoast.showToast(msg: state.error);
//         }
//       },
//       builder: (context, state) {
//         AuthBloc authBloc = BlocProvider.of(context);
//         return Scaffold(
//           extendBodyBehindAppBar: true,
//           appBar: const WhiteAppBar(),
//           resizeToAvoidBottomInset: false,
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // SizedBox(height: 125.h),
//               const Spacer(),
//               const AppTitle(AppStrings.verification),
//               SizedBox(height: 10.h),
//               Text(
//                 '${AppStrings.weHaveSentTo} ${authBloc.phone}',
//                 style: AppTextStyle.medium(size: 14),
//               ),
//               SizedBox(height: 32.h),

//               // Pincode field
//               Form(
//                 key: _formKey,
//                 child: Pinput(
//                   controller: _otpController,
//                   length: 4,
//                   autofocus: true,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   validator: (value) =>
//                       (value?.length ?? '') != 4 ? '4 length' : null,
//                   defaultPinTheme: _setPinTheme(),
//                   errorPinTheme: _setPinTheme(borderColor: AppColors.red),
//                   submittedPinTheme: _setPinTheme(
//                     borderColor: AppColors.primary,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 38.h),

//               // VerifyButton
//               PrimaryButton(
//                 isLoading: state is AuthVerifyLoadingState,
//                 label: AppStrings.verify,
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     String otp = _otpController.text;
//                     authBloc.add(AuthVerifyEvent(otp));
//                   }
//                 },
//               ),
//               SizedBox(height: 24.h),

//               // Timer
//               Align(
//                   alignment: Alignment.center,
//                   child: StreamBuilder<int>(
//                       stream: _timerController.stream,
//                       initialData: 180,
//                       builder: (context, snapshot) {
//                         int secunds = snapshot.requireData;
//                         String minute =
//                             (secunds ~/ 60).toString().padLeft(2, '0');
//                         String secund =
//                             (secunds % 60).toString().padLeft(2, '0');
//                         return Text('$minute:$secund');
//                       })),
//               const Spacer(),
//               // const SizedBox(height: kToolbarHeight),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(AppStrings.didntSendCode),

//                   // Resend code button
//                   AppTextButton(
//                     label: AppStrings.resend,
//                     onPressed: () {
//                       authBloc.add(AuthLoginEvent(authBloc.phone,"1111"));
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ).symmetricPadding(v: 20),
//         );
//       },
//     );
//   }

//   PinTheme _setPinTheme({
//     Color? borderColor,
//     Color color = AppColors.fillColor,
//   }) {
//     return PinTheme(
//       textStyle: AppTextStyle.bold(size: 22),
//       height: 60.h,
//       width: 60.h,
//       decoration: AppShapes.withBorder(
//         borderColor: borderColor,
//         color: color,
//       ),
//     );
//   }
// }
