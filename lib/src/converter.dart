import 'dart:io';

/// Converts folder structure to a list of strings
class Converter {
  final Map<String, dynamic> _dirs;
  final Set<String> _result = {};

  Converter({required Map<String, dynamic> dirs}) : _dirs = dirs;

  /// Writes paths to all folders
  void doMagic() {
    _result.clear();
    _convertOne(_dirs, '');
  }

  /// Prepares paths to be writen to pubspec
  void prepareData() {
    final paths = result;
    for (int i = 0; i < paths.length; ++i) {
      paths[i] = 'assets' + paths[i] + '/';
    }

    if (Platform.isWindows) {
      // replaces backslashes with slashes
      for (int i = 0; i < paths.length; ++i) {
        paths[i] = paths[i].replaceAll('\\', '/');
      }
    }

    _result.clear();
    _result.addAll(paths);
  }

  void _convertOne(Map<String, dynamic> source, String basic) {
    for (var key in source.keys) {
      final value = source[key];
      // print('$basic$key $value');
      _result.add(basic + key);
      _convertOne(value, basic + key);
      if ((value as Map<String, dynamic>).isEmpty) {
        _result.add(basic + key);
      }
    }
  }

  List<String> get result => _result.toList();
}
