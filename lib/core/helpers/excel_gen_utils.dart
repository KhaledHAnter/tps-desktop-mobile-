import 'dart:developer';
import 'package:excel/excel.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class ExcelGenUtils {
  Future<Excel?> generateExcel(List<PlayerModel> players) async {
    try {
      // Create a new Excel document
      var excel = Excel.createExcel();

      // Access the default sheet
      Sheet sheetObject = excel['Players'];

      // Add headers
      sheetObject.appendRow([
        TextCellValue('Name'),
        TextCellValue('Sport'),
        TextCellValue('Phase'),
        TextCellValue('Phone'),
        TextCellValue('Money'),
        TextCellValue('Subscription Duration'),
        TextCellValue('Start Date'),
        TextCellValue('End Date'),
        TextCellValue('Remaining Duration'),
        TextCellValue('Description'),
      ]);

      // Add player data
      for (var player in players) {
        final remainingDays = player.endDate.difference(DateTime.now()).inDays;

        sheetObject.appendRow([
          TextCellValue(player.name),
          TextCellValue(player.sport),
          TextCellValue(player.phase),
          TextCellValue(player.phone),
          TextCellValue(player.money.toString()), // Convert numbers to strings
          TextCellValue(player.subsDuration.toString()),
          TextCellValue(player.startDate.toIso8601String()),
          TextCellValue(player.endDate.toIso8601String()),
          TextCellValue(remainingDays > 0 ? remainingDays.toString() : '0'),
          TextCellValue(player.description ?? ''),
        ]);
      }
      return excel;
    } catch (e) {
      log('Error generating Excel file: $e');
    }
    return null;
  }
}
