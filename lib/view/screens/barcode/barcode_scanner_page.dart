/*
    Created by: Bahromjon Po'lat.
    Created date: 31/08/2022 17:02
    Updated to mobile_scanner by: Grok (January 2026)
    Fixed errors: January 2026
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pos_mobile/bloc/barcode/barcode_singleton.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/home/pages/items/product_details_screen.dart';
import 'package:pos_mobile/view/screens/screen.dart';

class BarcodeScanPage extends StatefulWidget {
  final String from;
  const BarcodeScanPage({Key? key, required this.from}) : super(key: key);

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late MobileScannerController _controller;
  final BarcodeSingleton _barcodeSingleton = BarcodeSingleton.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      formats: [
        BarcodeFormat.ean13,
        BarcodeFormat.code128,
        BarcodeFormat.upcA,
        BarcodeFormat.ean8,
        BarcodeFormat.code93,
        BarcodeFormat.itf,
        BarcodeFormat.upcE,
      ],
      torchEnabled: false,
      autoStart: true,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Agar kamera hali ishga tushmagan bo'lsa yoki ruxsat yo'q bo'lsa — hech nima qilmaymiz
    if (!_controller.value.isInitialized) return;

    switch (state) {
      case AppLifecycleState.resumed:
        _controller.start();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _controller.stop();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: (BarcodeCapture capture) async {
              final List<Barcode> barcodes = capture.barcodes;

              // firstWhereOrNull o'rniga standart usul
              final Barcode? barcode = barcodes.firstWhere(
                (b) => b.rawValue != null,
                orElse: () => Barcode(rawValue: null), // agar topilmasa null qaytaradi
              );

              final String? scannedCode = barcode?.rawValue;
              if (scannedCode == null || scannedCode.isEmpty) return;

              Product? product = Product();
              if (product == null) {
                Fluttertoast.showToast(msg: 'Product not found!');
                return;
              }

              bool barcodeContains = product.barcode != null &&
                  product.barcode!.contains(_barcodeSingleton.barcode);
              if (barcodeContains) return;

              await _controller.stop(); // kamerani to'xtatish

              if (widget.from == "inventory") {
                // await AppNavigator.push(ProductDetilsScreen(product: product))
                    // .then((_) => _controller.start());
              } else if (widget.from == "purchase") {
                // await AppNavigator.push(AddPurchaseProduct(product: product))
                    // .then((_) => _controller.start());
              } else if (widget.from == "order") {
                OrderItem orderItem = OrderItem.fromProduct(product);
                OrderHelper.setCurrentItem = orderItem;
                await AppNavigator.push(const OrderCountPage())
                    .then((_) => _controller.start());
              }
            },
          ),

          // Custom overlay
          CustomPaint(
            painter: ScannerOverlayPainter(
              borderColor: Colors.white,
              borderRadius: 10,
              borderLength: 40,
              borderWidth: 3,
            ),
            child: const SizedBox.expand(),
          ),

          // Scan matni
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Text(
              AppStrings.scanProduct,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(color: AppColors.white),
            ),
          ),

          // Flash va Switch
          Positioned(
            top: 60.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch(
                  value: false,
                  onChanged: (v) async {
                    await AppPrefs.instance.setScanType(true);
                  },
                ),
                BlocProvider(
                  create: (context) => FlashBloc(),
                  child: BlocBuilder<FlashBloc, FlashState>(
                    builder: (context, state) {
                      final flashBloc = context.watch<FlashBloc>();
                      return InkWell(
                        onTap: () async {
                          await _controller.toggleTorch();
                          final bool isLight = _controller.torchEnabled ?? false;
                          flashBloc.add(FlashLightEvent(isLight));
                        },
                        child: Container(
                          height: 40.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                state.isLight ? Icons.flash_on : Icons.flash_off,
                                color: AppColors.white,
                              ),
                              Text(
                                state.isLight ? AppStrings.on : AppStrings.off,
                                style: AppTextStyle.regular(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final Color borderColor;
  final double borderRadius;
  final double borderLength;
  final double borderWidth;

  ScannerOverlayPainter({
    required this.borderColor,
    required this.borderRadius,
    required this.borderLength,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double cutOutWidth = 350.w;
    final double cutOutHeight = 250.h;

    final Paint blackPaint = Paint()..color = Colors.black.withOpacity(0.6);
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Rect fullRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Rect cutOutRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: cutOutWidth,
      height: cutOutHeight,
    );

    final Path path = Path()
      ..addRect(fullRect)
      ..addRRect(RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, blackPaint);

    final double offset = borderLength;

    canvas.drawLine(cutOutRect.topLeft, cutOutRect.topLeft + Offset(offset, 0), borderPaint);
    canvas.drawLine(cutOutRect.topLeft, cutOutRect.topLeft + Offset(0, offset), borderPaint);

    canvas.drawLine(cutOutRect.topRight, cutOutRect.topRight - Offset(offset, 0), borderPaint);
    canvas.drawLine(cutOutRect.topRight, cutOutRect.topRight + Offset(0, offset), borderPaint);

    canvas.drawLine(cutOutRect.bottomLeft, cutOutRect.bottomLeft + Offset(offset, 0), borderPaint);
    canvas.drawLine(cutOutRect.bottomLeft, cutOutRect.bottomLeft - Offset(0, offset), borderPaint);

    canvas.drawLine(cutOutRect.bottomRight, cutOutRect.bottomRight - Offset(offset, 0), borderPaint);
    canvas.drawLine(cutOutRect.bottomRight, cutOutRect.bottomRight - Offset(0, offset), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}