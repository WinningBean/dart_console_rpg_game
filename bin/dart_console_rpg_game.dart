import 'package:dart_console_rpg_game/game.dart';
import 'package:dart_console_rpg_game/monster.dart';

void main(List<String> arguments) {
  Game game = Game([
    Monster(name: 'Batman', maxHealth: 20, attackPower: 20),
    Monster(name: 'Spiderman', maxHealth: 20, attackPower: 30),
    Monster(name: 'Superman', maxHealth: 30, attackPower: 10)
  ]);
  game.start();
}
