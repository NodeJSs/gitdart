import 'dart:convert';
import 'dart:io';

import 'package:gitdart/models/User.dart';
import 'package:gitdart/utils/cache.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUserData(String username) async {
  Cacher _cacher = new Cacher();
  var url = "https://api.github.com/users/${username}";
  var _resultsFromCache = _cacher.readResultFromCache(username);
  if (_resultsFromCache != null) {
    return _resultsFromCache;
  } else {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse);
    } else {
      stderr.writeln("error fetching user: $username");
    }
  }
}
