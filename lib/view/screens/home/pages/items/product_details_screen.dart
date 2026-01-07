import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/models/product/scanned_product.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_data.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class ProductDetilsScreen extends StatefulWidget {
  final bool isSearchDelegate;
  final Product product;
  const ProductDetilsScreen({super.key, required this.product,  this.isSearchDelegate = false});

  @override
  State<ProductDetilsScreen> createState() => _ProductDetilsScreenState();
}

class _ProductDetilsScreenState extends State<ProductDetilsScreen> {
  late TextEditingController _stockController;
  late Product product;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    _stockController = TextEditingController(text: '0');
    _stockController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _stockController.text.length,
    );
  }
  Future<void> _saveProduct() async {
    final stockText = _stockController.text.trim();
    if (stockText.isEmpty) {
      _showMessage('Iltimos, miqdorni kiriting', isError: true);
      return;
    }

    setState(() => _isSaving = true);

    try {
      final inputAmount = num.parse(stockText);
      final currentUpdateAmount = product.updateAmount ?? 0;
      final newUpdateAmount = currentUpdateAmount + inputAmount;

      product.updateAmount = newUpdateAmount;

      await HiveItemsHelper.updateProduct(product);

      ScannedProduct scannedProduct = ScannedProduct(
        amount: product.amount,
        name: product.name,
        barcode: product.barcode,
        sku: product.sku,
        shopPrices: product.shopPrices,
        companyId: product.companyId,
        cost: product.cost,
        id: product.id,
        measurementValues: product.measurementValues,
        primarySupplierId: product.primarySupplierId,
        primarySupplierName: product.primarySupplierName,
        productName: product.name,
        productTypeId: product.productTypeId,
        updateAmount: product.updateAmount,
      );
      await HiveBoxes.scannedProductBox.put(product.id, scannedProduct);

      if (mounted) {
        _showMessage('Сохранено');
        await Future.delayed(const Duration(milliseconds: 500));
        if (widget.isSearchDelegate == true && mounted && context.mounted) {
          AppNavigator.pop(true);
          AppNavigator.pop(true);
        } else if (mounted && context.mounted) {
          AppNavigator.pop(true);
        }
      }
    } catch (e) {
      print('❌ Error saving product: $e');
      if (mounted) _showMessage('❌ Xatolik: $e', isError: true);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  void dispose() {
    _stockController.dispose();
    super.dispose();
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
                    ProductData(
                      title: AppStrings.itemName,
                      data: Text(product.name ?? 'N/A'),
                    ),
                    Divider(height: 40.h),

                    // Product barcode
                    ProductData(
                      title: AppStrings.barcode,
                      data: Text(product.barcode?.isNotEmpty == true
                          ? product.barcode!.join(', ')
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
                      data: Text('0'),
                    ),
                    Divider(height: 40.h),

                    ProductData(
                      title: AppStrings.real,
                      data: TextField(
                        controller: _stockController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        textInputAction: TextInputAction.done,
                        autofocus: true,
                        enabled: !_isSaving,
                        
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^-?\d*\.?\d*'),
                          ),
                        ],
                        decoration: InputDecoration(
                          hintText: AppStrings.enterRealStock,
                          helperText: 'Yangi qiymat eski qiymatga qo\'shiladi',
                          helperStyle: const TextStyle(
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
