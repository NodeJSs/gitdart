import 'package:args/args.dart';
import 'package:gitdart/gitdartCli.dart';
import 'dart:io';

ArgResults argResults;
void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()
    ..addOption('user', abbr: 'u', help: "fetches info on a defined user");

  final argResults = parser.parse(arguments);

  gitdartCli(argResults['user']);
}
