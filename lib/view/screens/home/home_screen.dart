/*
    Created by: Bahromjon Po'lat.
    Created date: 8/24/22 1:52 PM
    Updated: MainPage olib tashlandi, faqat 3 ta sahifa qoldi — January 2026
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/barcode/barcode_singleton.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/view/screens/home/pages/pages.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    // Endi faqat 3 ta sahifa
    _pages.addAll(const [
      ItemsPage(),     // index 0
      InOutPage(),     // index 1
      SettingsPage(),  // index 2
    ]);

    // Mahsulotlar yuklanganda toast ko'rsatish
    context.read<GetItemsBloc>().stream.listen((state) {
      if (state is GetAllProductsSuccesState) {
        Fluttertoast.showToast(msg: AppStrings.productsGotSuccess);
      } else if (state is GetAllProductsFailuressState) {
        Fluttertoast.showToast(msg: AppStrings.errorGetProducts);
      }
    });

    // Bottom navigation index o'zgarganda
    context.read<BottomNavigationBarBloc>().stream.listen((currentIndex) {
      final barcodeSingleton = BarcodeSingleton.instance;


      if (AppPrefs.instance.scanType) return;


      if (currentIndex != 0) {
        barcodeSingleton.setBarcode = ''; // oxirgi skanlangan kodni tozalash
        barcodeSingleton.bottomSheetController?.close(); // agar scanner bottom sheet ochiq bo'lsa yopish
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: IndexedStack(
        index: context.watch<BottomNavigationBarBloc>().state, // 0, 1 yoki 2
        children: _pages,
      ),
    );
  }
}