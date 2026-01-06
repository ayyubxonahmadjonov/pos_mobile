// /*
//     Created by: Bakhromjon Polat
//     Created on: Dec 30 2022 19:44:10

//     Github: https://github.com/BahromjonPolat
//     Leetcode: https://leetcode.com/BahromjonPolat/
//     LinkedIn: https://linkedin.com/in/bahromjon-polat
//     Telegram: https://t.me/BahromjonPolat

//     Documentation: 

// */

// import 'dart:async';

// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:pos_mobile/core/components/app_packages.dart';
// import 'package:pos_mobile/models/product/product_model.dart';
// part 'barcode_event.dart';
// part 'barcode_state.dart';

// class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
//   MobileScanner? _qrViewController;
//   MobileScanner? get qrViewController => _qrViewController;
//   BarcodeBloc() : super(BarcodeInitial(Product())) {
//     on<BarcodeScannedEvent>(_scan);
//     on<BarcodeSetQrController>(_setController);
//   }

//   FutureOr<void> _scan(
//     BarcodeScannedEvent event,
//     Emitter emit,
//   ) {
//     emit(BarcodeInitial(event.product));
//   }

//   FutureOr<void> _setController(
//     BarcodeSetQrController event,
//     Emitter emit,
//   ) {
//     _qrViewController = event.controller;
//   }
// }
