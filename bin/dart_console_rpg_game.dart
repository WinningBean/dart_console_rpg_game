import 'package:dart_console_rpg_game/game.dart';
import 'package:dart_console_rpg_game/game_loader.dart';
import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';

void main(List<String> arguments) {
  Player player = GameLoader.loadValidPlayer();
  List<Monster> monsters = GameLoader.loadMonsters(player.attackPower);
  Game game = Game(player: player, monsters: monsters);
  game.start();

  // var numbers = [1, 5, 8, 10, 12, 15];
  // print(numbers.where((n) => n.isEven).map((n) => n += 3));
}
