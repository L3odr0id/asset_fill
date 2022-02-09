import 'dart:io';

/// Get folder structure
class GetPaths {
  static Future<Map<String, dynamic>> getDirs(String path) async {
    final res = <String, dynamic>{};

    final dir = Directory(path);
    final entities = (await dir.list().toList());
    final subdirs = entities.whereType<Directory>().toList();
    // make them alphabetical
    subdirs.sort((Directory first, Directory second) {
      return first.path.compareTo(second.path);
    });

    for (var subdir in subdirs) {
      res[subdir.path.replaceAll(path, '')] = await getDirs(subdir.path);
    }

    return res;
  }
}
