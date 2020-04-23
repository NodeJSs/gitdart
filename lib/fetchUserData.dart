import 'dart:convert';
import 'dart:io';

import 'package:gitdart/models/User.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUserData(String username) async{
  var url = "https://api.github.com/users/${username}";
  var response = await http.get(url);
  if(response.statusCode == 200){
    var jsonResponse = jsonDecode(response.body);
    return User.fromJson(jsonResponse);
  }
  else{
    stderr.writeln("error fetching user: $username");
  }
}

