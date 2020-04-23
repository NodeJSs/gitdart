import 'dart:io';

import 'package:gitdart/fetchUserData.dart';
import 'package:gitdart/models/User.dart';

void gitdartCli(String users){
  List<String> _users = users.split(",");
  stdout.writeln("Fetching user(s)...");
  var userCount = 1;
  for(var username in _users){
    fetchUserData(username).then((User user){
      stdout.writeln("User #${(userCount).toString()}");
      stdout.writeln("Username: ${username}"); 
      stdout.writeln("Name: ${user.name}"); 
      stdout.writeln("Location: ${user.location}"); 
      stdout.writeln("Bio: ${user.bio}"); 
      stdout.writeln("Public Repos: ${user.publicRepos}"); 
      stdout.writeln("Followers: ${user.followers}"); 
      stdout.writeln("Following: ${user.following}"); 
      stdout.writeln("  ");
      userCount = userCount+1;
    });
    
  }
  
}