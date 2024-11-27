import 'package:tps/core/helpers/directory_utils.dart';
import 'package:tps/core/helpers/excel_gen_utils.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class ExcelGenerationRepo {
  final ExcelGenUtils excelGenUtils;
  final DirectoryUtils directoryUtils;

  ExcelGenerationRepo({
    required this.excelGenUtils,
    required this.directoryUtils,
  });

  Future<void> generateExcelFile(List<PlayerModel> players) async {
    final excel = await excelGenUtils.generateExcel(players);
    final path =
        await directoryUtils.getGlobalDirectoryPath(fileName: 'players.xlsx');

    final file =
        await directoryUtils.saveFile(path: path, bytes: excel!.encode());

    await directoryUtils.openFile(file,
        fileType:
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  }
}
