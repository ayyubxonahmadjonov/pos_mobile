/*
    Created by: Bahromjon Po'lat
    Updated: MainPage olib tashlandi, faqat 3 ta tab qoldi — January 2026
*/
import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          type: BottomNavigationBarType.fixed, // 3 tadan ko'p bo'lsa label ko'rinishi uchun
          selectedItemColor: AppColors.primary, // agar kerak bo'lsa o'zgartiring
          unselectedItemColor: Colors.grey,
          items: List.generate(3, (index) => _setItem(index)), // 4 → 3
          onTap: (i) {
            final barBloc = context.read<BottomNavigationBarBloc>();
            barBloc.add(BottomBarChanged(i));
          },
        );
      },
    );
  }

  BottomNavigationBarItem _setItem(int index) => BottomNavigationBarItem(
        icon: Icon(_getIcon(index)),
        label: _getLabel(index),
      );

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return AppIcons.box;        // Products (avvalgi 1-index)
      case 1:
        return AppIcons.inOut;      // In/Out (avvalgi 2-index)
      case 2:
        return AppIcons.settings;   // Settings (avvalgi 3-index)
      default:
        return AppIcons.box;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return AppStrings.products; // "Mahsulotlar"
      case 1:
        return AppStrings.inOut;    // "Kirim/Chiqim"
      case 2:
        return AppStrings.settings; // "Sozlamalar"
      default:
        return AppStrings.products;
    }
  }
}