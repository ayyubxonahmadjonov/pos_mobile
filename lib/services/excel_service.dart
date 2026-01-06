import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../hive_helper/hive_boxes.dart';

class ExcelService {
  static ExcelService? _instance;
  ExcelService._();
  factory ExcelService() => _instance ??= ExcelService._();

  Future<String> createExcelFile() async {
    final Box<Product> box = HiveBoxes.productsBox;

    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    int rowIndex = 0;

    try {
      sheet.getRangeByName('A1').setText('ID');
      sheet.getRangeByName('B1').setText('SKU');
      sheet.getRangeByName('C1').setText('Name');
      sheet.getRangeByName('D1').setText('Barcode');
      sheet.getRangeByName('E1').setText('Original Stock');
      sheet.getRangeByName('F1').setText('Updated Stock');
      sheet.getRangeByName('G1').setText('Difference');

      final Style headerStyle = workbook.styles.add('HeaderStyle');
      headerStyle.bold = true;
      headerStyle.hAlign = HAlignType.center;

      sheet.getRangeByName('A1:G1').cellStyle = headerStyle;

      for (var item in box.values) {
        rowIndex++;
        final row = rowIndex + 1;

        final originalStock = item.originalAmount ?? 0;

        final updatedStock = item.measurementValues?.shopId?.amount ?? 0;

        final difference = updatedStock - originalStock;

        sheet.getRangeByName('A$row').setText(item.id ?? '');
        sheet.getRangeByName('B$row').setText(item.sku?.toString() ?? '');
        sheet.getRangeByName('C$row').setText(item.name ?? '');
        sheet.getRangeByName('D$row').setText(item.barcode?.join(', ') ?? '');
      sheet.getRangeByName('E$row').setNumber(originalStock.toDouble());
        sheet.getRangeByName('F$row').setNumber(updatedStock.toDouble());

        sheet.getRangeByName('G$row').setNumber(difference.toDouble());

        if (difference > 0) {
          sheet.getRangeByName('G$row').cellStyle.backColor = '#C6EFCE';
          sheet.getRangeByName('G$row').cellStyle.fontColor = '#006100';
        } else if (difference < 0) {
          // Kamaygan - Qizil
          sheet.getRangeByName('G$row').cellStyle.backColor = '#FFC7CE';
          sheet.getRangeByName('G$row').cellStyle.fontColor = '#9C0006';
        }

        if (rowIndex % 1000 == 0) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }

      for (int i = 1; i <= 7; i++) {
        sheet.autoFitColumn(i);
      }

      final List<int> bytes = workbook.saveAsStream();

      try {
        workbook.dispose();
      } catch (e) {}

      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          '$path/inventory_${DateTime.now().millisecondsSinceEpoch}.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);

      // 4️⃣ HISTORY SAQLASH
      final counted = box.values
          .where((p) => (p.measurementValues?.shopId?.amount ?? 0) > 0)
          .length;

      final uncounted = box.length - counted;

      HistoryModel(
        counted: counted,
        uncounted: uncounted,
        date: DateTime.now().millisecondsSinceEpoch,
        path: file.path,
        size: bytes.length,
      ).add();

      return file.path;
    } catch (e, stackTrace) {
      print('❌ Error creating Excel: $e');

      // Cleanup
      try {
        workbook.dispose();
      } catch (_) {}

      rethrow;
    }
  }

  num _getOriginalStock(Product item) {
    return item.realStock;
  }

  Future<void> deleteExcelFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('❌ Error deleting file: $e');
    }
  }

  Future<void> clearAllExcelFiles() async {
    try {
      final String path = (await getApplicationSupportDirectory()).path;
      final directory = Directory(path);

      final files = directory
          .listSync()
          .where((file) => file.path.endsWith('.xlsx'))
          .toList();

      for (var file in files) {
        await File(file.path).delete();
      }
    } catch (e) {
      print('❌ Error clearing Excel files: $e');
    }
  }
}
