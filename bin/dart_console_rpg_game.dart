import 'package:dart_console_rpg_game/game.dart';
import 'package:dart_console_rpg_game/game_loader.dart';

void main(List<String> arguments) {
  Game game = Game(
    player: GameLoader.loadValidPlayer(),
    monsters: GameLoader.loadMonsters(),
  );
  game.start();
}