import 'dart:convert';
import 'package:gitdart/models/User.dart';
import 'dart:io';

import 'package:path/path.dart' as path;

String getHomeDir() {
  String _homeDir = "";
  Map<String, String> envVars = Platform.environment;
  if (Platform.isLinux || Platform.isMacOS) {
    _homeDir = envVars['HOME'];
  } else if (Platform.isWindows) {
    _homeDir = envVars['UserProfile'];
  }
  return _homeDir;
}

class Cacher {
  static String _cacheFilePath =
      path.join(getHomeDir(), "gitdart", "cache", "users.json");
  bool doesResultExistInCache;
  File _cacheFile = new File(_cacheFilePath);

  Cacher() {
    _cacheFile.exists().then((bool doesFileExist) {
      if (doesFileExist == false) {
        _cacheFile.createSync(recursive: true);
        _cacheFile.writeAsStringSync("{}");
      }
    });
  }

  void writeNewUserToCache(String username, User user) async {
    Map<String, dynamic> _results;
    bool doesFileExist = await _cacheFile.exists();
    if (doesFileExist == false) {
      _cacheFile.createSync(recursive: true);
      _cacheFile.writeAsStringSync("{}");
    }
    String _jsonString = await _cacheFile.readAsString();
    _results = jsonDecode(_jsonString);
    _results[username] = user.toJson();
    _cacheFile.writeAsString(jsonEncode(_results), mode: FileMode.write);
  }

  Future<User> readResultFromCache(String username) async{
    String _fileContents = await _cacheFile.readAsString();
    Map<String, dynamic> _results = await jsonDecode(_fileContents);
    if (_results[username] != null) {
      return await User.fromJson(_results[username]);
    }
    return null;
  }
}
