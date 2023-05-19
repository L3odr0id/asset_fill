import 'dart:io';

import 'package:yaml_edit/yaml_edit.dart';

/// Writes tohe result to the pubspec.yaml
class Writer {
  static void writeDataToYAML(List<String> paths) {
    final pubspec = File('pubspec.yaml');
    final yamlDataAsStr = pubspec.readAsStringSync();

    final yamlEditor = YamlEditor(yamlDataAsStr);
    try {
      for (var path in paths) {
        yamlEditor.appendToList(['flutter', 'assets'], path);
      }
      pubspec.writeAsStringSync(yamlEditor.toString());
    } catch (e) {
      print(e);
    }
  }
}
