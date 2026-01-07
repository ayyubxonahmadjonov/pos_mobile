import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/bloc/get_items/get_items_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/models/product/scanned_product.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/item_list_tile.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_list.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_list_scanned.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_search_delegate.dart';
import 'components/item_app_bar.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> 
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  final List<ScrollController> _scrollControllers = [];
  final List<bool> _isLoadingMore = [false, false, false];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    for (int i = 0; i < 3; i++) {
      final controller = ScrollController();
      _scrollControllers.add(controller);
    }

    if (HiveItemsHelper.box.isEmpty) {
      context.read<GetItemsBloc>().add(GetAllProductsEvent());
    }
    
  }

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); 
    return ValueListenableBuilder(
      valueListenable: HiveItemsHelper.box.listenable(),
      builder: (context, Box<Product> productBox, _) {
        return ValueListenableBuilder(
          valueListenable: HiveBoxes.scannedProductBox.listenable(),
          builder: (context, Box<ScannedProduct> scannedBox, __) {
            List<Product> allProducts = productBox.values.toList();
            List<ScannedProduct> scannedProducts = scannedBox.values.toList();
            List<Product> notScannedProducts = allProducts
                .where((p) =>
                    p.measurementValues?.shopId?.amount != p.originalAmount)
                .toList();

            HiveItemsHelper.setCounted = scannedProducts.length;
            HiveItemsHelper.setUncounted = notScannedProducts.length;

            return Scaffold(
              appBar: ItemsAppBar(controller: _tabController),
              body: BlocConsumer<GetItemsBloc, GetItemsState>(
                listener: (context, state) {
            
                  if (state is GetAllProductsSuccesState) {
                    setState(() {
                      for (int i = 0; i < 3; i++) {
                        _isLoadingMore[i] = false;
                      }
                    });
                  } else if (state is GetAllProductsFailuressState) {
                    setState(() {
                      for (int i = 0; i < 3; i++) {
                        _isLoadingMore[i] = false;
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Mahsulotlar yuklanmadi yoki tugadi")),
                    );
                  }
                },
                builder: (context, state) {
                           if(state is GetAllProductsProccesState){
                     return Center(child: CircularProgressIndicator());
                  }
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      ProductList(
                        products: allProducts,
                        isLoadingMore: _isLoadingMore[0],
                      ),
                      ProductListScanned(
                        scannedproducts: scannedProducts,
                        isLoadingMore: _isLoadingMore[1],
                        isScanned: true,
                      ),
                      ProductList(
                        products: notScannedProducts,
                        isLoadingMore: _isLoadingMore[2],
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}