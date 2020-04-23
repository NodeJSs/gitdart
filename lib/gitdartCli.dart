import 'dart:io';

import 'package:gitdart/fetchUserData.dart';
import 'package:gitdart/models/User.dart';

void gitdartCli(String users){
  List<String> _users = users.split(",");
  for(var user in _users){
    fetchUserData(user).then((User user){
      stdout.writeln(user.name);
    });
    
  }
  
}