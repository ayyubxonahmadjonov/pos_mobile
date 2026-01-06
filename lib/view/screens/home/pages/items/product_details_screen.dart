import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/product_model.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_data.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class ProductDetilsScreen extends StatefulWidget {
  final ProductFromJson product;
  const ProductDetilsScreen({super.key, required this.product});

  @override
  State<ProductDetilsScreen> createState() => _ProductDetilsScreenState();
}

class _ProductDetilsScreenState extends State<ProductDetilsScreen> {
  late TextEditingController _stockController;
  late ProductFromJson product;
  bool _isSaving = false;

@override
void initState() {
  super.initState();
  product = widget.product;

  final apiAmount =
      product.amount;

  // /// ❗ FAQAT BIR MARTA SAQLANADI
  // if (product.originalAmount == null || product.originalAmount == 0) {
  //   product.originalAmount = apiAmount;
  //   HiveItemsHelper.updateProduct(product);
  // }

  _stockController =
      TextEditingController(text: apiAmount.toString());

  _stockController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: _stockController.text.length,
  );
}

  @override
  void dispose() {
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    final stockText = _stockController.text.trim();
    if (stockText.isEmpty) {
      _showMessage('Iltimos, miqdorni kiriting', isError: true);
      return;
    }

    setState(() => _isSaving = true);

    try {

      final oldAmount = product.amount;

      final inputAmount = num.parse(stockText);

      final finalAmount = oldAmount! + inputAmount;

      // product.amount = num.parfinalAmount;

      // await HiveItemsHelper.updateProduct(product);

      if (mounted) {
        _showMessage('Сохранено');

        // Orqaga qaytish
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          AppNavigator.pop();
        }
      }
    } catch (e) {
      print('❌ Error saving product: $e');

      if (mounted) {
        _showMessage('❌ Xatolik: $e', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showMessage(String message, {bool isError = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: Duration(seconds: isError ? 3 : 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const SimpleAppBar(title: AppStrings.productDetails),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    // Product name
                    ProductData(
                      title: AppStrings.itemName,
                      data: Text(product.name ?? 'N/A'),
                    ),
                    Divider(height: 40.h),

                    // Product barcode
                    ProductData(
                      title: AppStrings.barcode,
                      data: Text(product.barcodes?.isNotEmpty == true
                          ? product.barcodes!.join(', ')
                          : 'N/A'),
                    ),
                    Divider(height: 40.h),

                    // Product SKU
                    ProductData(
                      title: AppStrings.sku,
                      data: Text(product.sku?.toString() ?? 'N/A'),
                    ),
                    Divider(height: 40.h),

                    // Current stock
                    ProductData(
                      title: AppStrings.stock,
                      data: Text(product.amount.toString()),
                    ),
                    Divider(height: 40.h),

                    // Real stock (localdan kelgan, user o'zgartirishi mumkin)
                    ProductData(
                      title: AppStrings.real,
                      data: TextField(
                        controller: _stockController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textInputAction: TextInputAction.done,
                        autofocus: true,
                        enabled: !_isSaving,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*'))
                        ],
                        decoration: InputDecoration(
                          hintText: AppStrings.enterRealStock,
                          helperText: 'Yangi qiymat eski qiymatga qo\'shiladi',
                          helperStyle: TextStyle(
                              fontSize: 11, color: AppColors.darkGrey),
                          suffixIcon: _isSaving
                              ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  ),
                                )
                              : null,
                        ),
                        onSubmitted: (_) => _saveProduct(),
                      ),
                    ),
                  ],
                ).symmetricPadding(h: 16, v: 24),
                Divider(height: 15.h, thickness: 15.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.category,
                          style: AppTextStyle.semiBold(size: 18),
                        ),
                        SizedBox(width: 8.w),
                        SizedBox(
                          height: 18.h,
                          child: FloatingActionButton(
                            backgroundColor: AppColors.lightColor,
                            onPressed: () {},
                            child: Icon(
                              Icons.question_mark,
                              color: AppColors.white,
                              size: 12.h,
                            ),
                          ),
                        ),
                        const Spacer(),
                        AppTextButton(
                          label: AppStrings.customize,
                          onPressed: () {},
                        )
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.addItemCategories,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.medium(
                        size: 12,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ).symmetricPadding(h: 16),
              ],
            ),
          ),

          // Save button
          Positioned(
            bottom: 24,
            child: PrimaryButton(
              label: _isSaving ? 'Сохраняется...' : AppStrings.save,
              onPressed: _isSaving ? null : _saveProduct,
            ),
          ),
        ],
      ),
    );
  }
}
