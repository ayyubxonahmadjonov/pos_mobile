
// // import 'package:flutter/material.dart';
// // import 'package:hive_flutter/adapters.dart';
// // import 'package:pos_mobile/bloc/get_items/get_items_bloc.dart';
// // import 'package:pos_mobile/core/core.dart';
// // import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
// // import 'package:pos_mobile/models/product/product_model.dart';
// // import 'package:pos_mobile/product_model.dart';
// // import 'package:pos_mobile/product_status.dart';
// // import 'package:pos_mobile/sort_by.dart';
// // import 'package:pos_mobile/view/screens/home/pages/items/components/product_list.dart';
// // import 'components/item_app_bar.dart';

// // class ItemsPage extends StatefulWidget {
// //   const ItemsPage({Key? key}) : super(key: key);

// //   @override
// //   State<ItemsPage> createState() => _ItemsPageState();
// // }

// // class _ItemsPageState extends State<ItemsPage> with TickerProviderStateMixin {
//   late TabController _tabController;
//   final List<ScrollController> _scrollControllers = [];
//   final List<bool> _isLoadingMore = [false, false, false];
//   bool _isLoadingAll = false; // Yangi flag: barcha mahsulotlarni yuklash jarayonida

//   @override
//   void initState() {
//     super.initState();
//     context.read<GetItemsBloc>().add(GetAllProductsEvent());
//     _tabController = TabController(length: 3, vsync: this);

//     // 3 ta scroll controller yaratamiz
    
//     for (int i = 0; i < 3; i++) {
//       final controller = ScrollController();
//       _scrollControllers.add(controller);
//     }

//     // Dastlabki yuklash: barcha mahsulotlarni yuklashni boshlash
//     _loadAllProducts();
//   }

//   void _loadAllProducts() async {
//     if (_isLoadingAll) return;
//     // setState(() {
//     //   _isLoadingAll = true;
//     //   for (int i = 0; i < 3; i++) {
//     //     _isLoadingMore[i] = true;
//     //   }
//     // });

//     // Barcha mahsulotlarni yuklash uchun event jo'natamiz
//     // context.read<GetItemsBloc>().add(
//     //       GetAllProductsEvent(
//     //         page: 1, // Paginationni o'chiramiz, barchasini olish uchun null yoki max limit
//     //         search: '',
//     //         limit: 100000, // Limitni o'chiramiz yoki katta qiymat beramiz (masalan, 100000)
//     //         sortBy: SortBy.empty,
//     //         status: ProductsStatus.all,
//     //       ),
//     //     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _scrollControllers) {
//       controller.dispose();
//     }
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return ValueListenableBuilder(
//       valueListenable: HiveItemsHelper.box.listenable(),
//       builder: (context, Box<Product> box, child) {
//     List<Product> allProducts = box.values.toList();
//         if (box.isEmpty) {
//           _loadAllProducts(); 
//         }
//         return Scaffold(
//           appBar: ItemsAppBar(controller: _tabController),
//           body: BlocConsumer<GetItemsBloc, GetItemsState>(
//             listener: (context, state) {
//               if (state is GetAllProductsSuccesState) {
//                 setState(() {
//                   _isLoadingAll = false;
//                   for (int i = 0; i < 3; i++) {
//                     _isLoadingMore[i] = false;
//                   }
//                 });
//               } else if (state is GetAllProductsFailuressState) {
//                 setState(() {
//                   _isLoadingAll = false;
//                   for (int i = 0; i < 3; i++) {
//                     _isLoadingMore[i] = false;
//                   }
//                 });
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                       content: Text("Mahsulotlar yuklanmadi yoki tugadi")),
//                 );
//               }
//             },
//             builder: (context, state) {
//               return TabBarView(
//                 controller: _tabController,
//                 children: [
//                   ProductList(
//                     products: allProducts,
//                     scrollController: _scrollControllers[0],
//                     isLoadingMore: _isLoadingMore[0],
//                   ),
//                   ProductList(
//                     products: allProducts,
//                     scrollController: _scrollControllers[1],
//                     isLoadingMore: _isLoadingMore[1],
//                     isScanned: true,
//                   ),
//                   ProductList(
//                     products: allProducts,
//                     scrollController: _scrollControllers[2],
//                     isLoadingMore: _isLoadingMore[2],
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }




///////////////////new one///////////////////////////////

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/bloc/get_items/get_items_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/product_status.dart';
import 'package:pos_mobile/sort_by.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_list.dart';
import 'components/item_app_bar.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<ScrollController> _scrollControllers = [];
  final List<bool> _isLoadingMore = [false, false, false];

  int _currentPage = 2;
  bool _hasMore = true;
  int _oldTotalCount = 0;

  static const int _pageSize = 50;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    // 3 ta scroll controller yaratamiz
    for (int i = 0; i < 3; i++) {
      final controller = ScrollController();

      _scrollControllers.add(controller);
    }

    // Dastlabki yuklash: 1-sahifa, limit=50
    context.read<GetItemsBloc>().add(
          GetAllProductsEvent(

          ),
        );
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
    return ValueListenableBuilder(
      valueListenable: HiveItemsHelper.box.listenable(),
      builder: (context, Box<Product> box, child) {
        List<Product> allProducts = box.values.toList();

        List<Product> scannedProducts =
            allProducts.where((p) => p.isInBox).toList();
        List<Product> notScannedProducts =
            allProducts.where((p) => !p.isInBox).toList();

        HiveItemsHelper.setCounted = scannedProducts.length;
        HiveItemsHelper.setUncounted = notScannedProducts.length;

        if (box.isEmpty) {
          _currentPage = 1;
          _hasMore = true;
          _oldTotalCount = 0;
        }

        return Scaffold(
          appBar: ItemsAppBar(controller: _tabController),
          body: BlocConsumer<GetItemsBloc, GetItemsState>(
            listener: (context, state) {
              if (state is GetAllProductsSuccesState) {
                int newAdded = box.values.length - _oldTotalCount;

                if (newAdded < _pageSize) {
                  _hasMore = false;
                }

                _currentPage++;
                setState(() {
                  for (int i = 0; i < 3; i++) {
                    _isLoadingMore[i] = false;
                  }
                });
              } else if (state is GetAllProductsFailuressState) {
                _hasMore =
                    false; 
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
              return TabBarView(
                controller: _tabController,
                children: [
                  ProductList(
                    products: allProducts,

                    isLoadingMore: _isLoadingMore[0],
                  ),
                  ProductList(
                    products: scannedProducts,
       
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
  }
}
