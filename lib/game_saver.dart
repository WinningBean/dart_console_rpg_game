import 'dart:io';

import 'package:dart_console_rpg_game/game.dart';

/// 게임 데이터 저장 클래스
class GameSaver {
  static final String saveFileName = 'files/result.txt';
  final Game game;

  /// 생성자
  GameSaver(this.game);

  /// 결과 파일 저장 메서드
  void saveGameResult() {
    stdout.write('결과를 저장하시겠습니까? (y 입력 시 저장): ');
    String input = stdin.readLineSync() ?? '';
    if (input.toLowerCase() == 'y') {
      File reusltFile = File(saveFileName);
      String resultContent =
          '사용자 이름: ${game.player.name}, 남은 체력: ${game.player.health}, 게임 결과: ${isWonGame() ? '승리' : '패배'}';
      reusltFile.writeAsStringSync(resultContent);

      stdout.writeln('결과가 $saveFileName 으로 저장되었습니다.');
    }
  }

  /// 게임 결과 구하기 메서드
  bool isWonGame() {
    if (game.isPlayingGame) return false;
    if (game.monsters.isNotEmpty && game.player.health <= 0) return false;

    return true;
  }
}