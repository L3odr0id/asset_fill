library asset_fill;

import 'dart:io';
import 'package:yaml_edit/yaml_edit.dart';

class Stuff {
  static Future<Map<String, dynamic>> _getDirs(String path) async {
    final res = <String, dynamic>{};

    final dir = Directory(path);
    final entities = (await dir.list().toList());
    final subdirs = entities.whereType<Directory>().toList();
    // make them alphabetical
    subdirs.sort((Directory first, Directory second) {
      return first.path.compareTo(second.path);
    });

    for (var subdir in subdirs) {
      res[subdir.path.replaceAll(path, '')] = await _getDirs(subdir.path);
    }

    return res;
  }

  static Future<void> main() async {
    final dir = Directory('./assets');
    Map<String, dynamic> dirs = await _getDirs(dir.path);

    final converter = Converter(dirs: dirs);
    converter.doMaigc();
    converter.prepareData();

    final paths = converter.result;

    final pubspec = File('pubspec.yaml');
    final dataAsStr = pubspec.readAsStringSync();
    final yamlEditor = YamlEditor(dataAsStr);
    for (var path in paths) {
      yamlEditor.appendToList(['flutter', 'assets'], path);
    }
    pubspec.writeAsStringSync(yamlEditor.toString());

    // Writer.reWriteFile('assets_to_copy.txt', paths.join());
  }
}

class Converter {
  final Map<String, dynamic> _dirs;
  final List<String> _result = [];

  Converter({required Map<String, dynamic> dirs}) : _dirs = dirs;

  void doMaigc() {
    _result.clear();
    _convertOne(_dirs, '');
  }

  void prepareData() {
    for (int i = 0; i < _result.length; ++i) {
      _result[i] = 'assets' + _result[i];
    }
  }

  void _convertOne(Map<String, dynamic> source, String basic) {
    for (var key in source.keys) {
      final value = source[key];
      // print('$basic$key $value');
      _convertOne(value, basic + key);
      if ((value as Map<String, dynamic>).isEmpty) {
        _result.add(basic + key);
      }
    }
  }

  List<String> get result => _result;
}

class Writer {
  static reWriteFile(String name, String content) {
    final file = File(name);
    // Delete old version
    if (file.existsSync()) {
      file.deleteSync();
    }
    // create new one and write stuff
    file.createSync();
    file.writeAsStringSync(content);
  }
}
