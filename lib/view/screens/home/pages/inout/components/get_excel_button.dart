/*

  Created by: Bakhromjon Polat
  Created on: Jan 07 2023 18:05:42
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';

import 'dialog_content.dart';

class GetExcelButton extends StatelessWidget {
  const GetExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExcelBloc(),
      child: BlocConsumer<ExcelBloc, ExcelState>(
        listener: (context, state) {
          if (state is ExcelSuccessState) {
            showDialog(
              // barrierDismissible: false,
              context: context,
              builder: (_) => DialogContent(filePath: state.excelFile),
            );
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: state is ExcelProcessingState
                ? null
                : () {
                    BlocProvider.of<ExcelBloc>(context).add(GetExcelEvent());
                  },
            child: state is ExcelProcessingState
                ? const CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.white,
                  )
                : SvgPicture.asset(AppIcons.excel,
                    height: 24.0,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    )),
          );
        },
      ),
    );
  }
}
