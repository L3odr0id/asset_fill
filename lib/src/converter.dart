import 'dart:io';

/// Converts folder structure to a list of strings
class Converter {
  final Map<String, dynamic> _dirs;
  final List<String> _result = [];

  Converter({required Map<String, dynamic> dirs}) : _dirs = dirs;

  void doMagic() {
    _result.clear();
    _convertOne(_dirs, '');
  }

  void prepareData() {
    if (Platform.isWindows) {
      // replaces backslashes with slashes
      for (int i = 0; i < _result.length; ++i) {
        _result[i] = 'assets' + _result[i];
        _result[i] = _result[i].replaceAll('\\', '/');
      }
    } else {
      for (int i = 0; i < _result.length; ++i) {
        _result[i] = 'assets' + _result[i];
      }
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
