import 'dart:io';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DirectoryUtils {
  Future<String> getAppDirectoryPath({String? fileName}) async {
    // Get the directory to save the file
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$fileName';
    return path;
  }

  Future<String> getGlobalDirectoryPath({String? fileName}) async {
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

    final path = '${directory.path}/$fileName';
    return path;
  }

  Future<File> saveFile({required String path, List<int>? bytes}) async {
    final file = File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes!);

    return file;
  }

  Future<void> openFile(File file, {String? fileType}) async {
    try {
      final result = await OpenFilex.open(file.path, type: fileType);
      if (result.type != ResultType.done) {
        print('Error opening file: ${result.message}');
        await shareFile(file);
      }
    } catch (e) {
      print('Error opening file: $e');
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
