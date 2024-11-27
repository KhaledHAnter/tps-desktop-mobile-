import 'dart:developer';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart'; // For opening files
import 'package:share_plus/share_plus.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class ExcelGenUtils {
  Future<void> generateExcel(List<PlayerModel> players) async {
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

      // Get the directory to save the file
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      // Ensure directory exists
      if (directory == null || !directory.existsSync()) {
        throw Exception('Unable to access save directory');
      }

      final path = '${directory.path}/players_data.xlsx';

      // Save the file
      final file = File(path)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);

      log('Excel file saved at $path');

      // Open or preview the file
      await openFile(file);
    } catch (e) {
      log('Error generating Excel file: $e');
    }
  }

  Future<void> openFile(File file) async {
    try {
      final result = await OpenFilex.open(file.path,
          type:
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      if (result.type != ResultType.done) {
        log('Error opening file: ${result.message}');
        await shareFile(file);
      }
    } catch (e) {
      log('Error opening file: $e');
    }
  }

  Future<void> shareFile(File file) async {
    try {
      await Share.shareXFiles([XFile(file.path)],
          text: 'Here is your Excel file.');
    } catch (e) {
      print('Error sharing file: $e');
    }
  }
}
