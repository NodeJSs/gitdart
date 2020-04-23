import 'package:args/args.dart';
import 'package:gitdart/gitdartCli.dart';
import 'package:gitdart/models/User.dart';
import 'package:gitdart/utils/cache.dart';
import 'dart:io';

import 'package:path/path.dart';

ArgResults argResults;
void main(List<String> arguments){
  exitCode = 0;
  final parser = ArgParser()..addOption('user', abbr: 'u',help: "fetches info on a defined user");

  final argResults = parser.parse(arguments);
  
  Cacher cacher = new Cacher();
  cacher.writeNewUserToCache("nodeeess", new User(
    name:"Faruq",
    followers: 13,
    following: 23,
    publicRepos: 10,
    bio: "A man of the world"
  )); 
  //gitdartCli(argResults['user']);


}

