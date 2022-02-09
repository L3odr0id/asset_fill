import 'dart:io';

import 'package:yaml_edit/yaml_edit.dart';

class Writer {
  static void writeDataToYAML(List<String> paths) {
    final pubspec = File('pubspec.yaml');
    final yamlDataAsStr = pubspec.readAsStringSync();

    final yamlEditor = YamlEditor(yamlDataAsStr);
    for (var path in paths) {
      yamlEditor.appendToList(['flutter', 'assets'], path);
    }
    pubspec.writeAsStringSync(yamlEditor.toString());
  }
}
