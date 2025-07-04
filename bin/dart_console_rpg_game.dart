import 'dart:io';

import 'package:dart_console_rpg_game/game.dart';
import 'package:dart_console_rpg_game/game_loader.dart';
import 'package:dart_console_rpg_game/game_saver.dart';
import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';

void main(List<String> arguments) {
  Player player = GameLoader.loadPlayer('files/player.txt');
  List<Monster> monsters = GameLoader.loadMonsters('files/monsters.txt', player.attackPower);
  Game game = Game(player: player, monsters: monsters);
  game.start();

  GameSaver gameSaver = GameSaver(game);
  gameSaver.saveGameResult();

  stdout.writeln('프로그램을 종료합니다.');
  exit(0);
}
