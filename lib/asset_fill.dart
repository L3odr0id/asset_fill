library asset_fill;

import 'dart:io';
import 'package:asset_fill/src/converter.dart';
import 'package:asset_fill/src/get_paths.dart';
import 'package:asset_fill/src/writer.dart';

/// Main function that does all work
Future<void> main() async {
  // get structure
  final dir = Directory('./assets');
  Map<String, dynamic> dirs = await GetPaths.getDirs(dir.path);

  // convert to strings
  final converter = Converter(dirs: dirs);
  converter.doMaigc();
  converter.prepareData();
  final paths = converter.result;

  // write them to yaml
  Writer.writeDataToYAML(paths);

  // Writer.reWriteFile('assets_to_copy.txt', paths.join());
}
