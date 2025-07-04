import 'dart:io';
import 'dart:math';

import 'package:dart_console_rpg_game/battle_action.dart';
import 'package:dart_console_rpg_game/character.dart';
import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';

/// 게임의 주요 로직을 구현하는 클래스
class Game {
  final Player player;
  final List<Monster> monsters;
  Monster? nowMonster;
  int deadMonstersCount = 0;
  bool isPlayingGame = true;

  /// 생성자
  Game({required this.player, required this.monsters});

  /// 게임 시작 메서드
  void start() {
    stdout.writeln("게임을 시작합니다!");
    player.showStatus();
    bonusPlayerHealth();
    stdout.writeln();

    while ((isPlayingGame && monsters.isNotEmpty) && player.health > 0) {
      battle();
    }

    end();
  }

  /// 보너스 체력 제공 메서드
  void bonusPlayerHealth() {
    if (Random().nextInt(100) <= 30) {
      player.restoreHealth(10);
      stdout.writeln('보너스 체력을 얻었습니다! 현재 체력: ${player.health}');
    }
  }

  /// 전투 진행 메서드
  void battle() {
    nowMonster ??= selectRandomMonster();
    actionPlayerBattle();

    if (nowMonster == null) {
      String lastContent = '전투 몬스터가 설정되지 않았습니다.';
      if (monsters.isEmpty) {
        lastContent = '축하합니다! 모든 몬스터를 물리쳤습니다.';
        isPlayingGame = false;
      }
      stdout.writeln(lastContent);
      return;
    }

    actionMonsterBattle();
  }

  /// 사용자 전투 행동 메서드
  void actionPlayerBattle() {
    printBattleTurn(player);

    BattleAction? battleAction;
    while (battleAction == null) {
      battleAction = selectedAction();
      if (battleAction == null) {
        stdout.write('올바른 전투 행동 번호를 입력해주세요. ');
      }
    }
    actionBattle(battleAction, player, nowMonster!);
  }

  /// 몬스터 전투 행동 메서드
  void actionMonsterBattle() {
    printBattleTurn(nowMonster!);
    actionBattle(BattleAction.attack, nowMonster!, player);
  }

  /// 전투별 행동 메서드
  void actionBattle(
    BattleAction battleAction,
    Character owner,
    Character opponent,
  ) {
    switch (battleAction) {
      case BattleAction.attack:
        owner.attack(opponent);
        processAfterAttack(owner, opponent);
        break;
      case BattleAction.defend:
        owner.defend();
        break;
    }
  }

  /// 공격 후 처리 메서드
  void processAfterAttack(Character owner, Character opponent) {
    if (opponent.health > 0) {
      owner.showStatus();
      opponent.showStatus();
      return;
    }

    if (owner.runtimeType == Player) {
      stdout.writeln('${opponent.name}을(를) 물리쳤습니다!\n');
      deadMonstersCount++;
      monsters.remove(opponent);
      nowMonster = null;
      if (monsters.isNotEmpty) {
        nowMonster = selectNextBattleMonster();
      }
    }
  }

  /// 다음 몬스터 설정 메서드
  Monster? selectNextBattleMonster() {
    stdout.write("다음 몬스터와 대결 (y 입력 시 대결): ");
    String input = stdin.readLineSync() ?? '';
    if (input.toLowerCase() == 'y') {
      return selectRandomMonster();
    }

    isPlayingGame = false;
    return null;
  }

  /// 랜덤으로 몬스터를 불러오는 메서드
  Monster? selectRandomMonster() {
    if (monsters.isEmpty) return null;
    int randomIdx = Random().nextInt(monsters.length);
    stdout.writeln('새로운 몬스터가 나타났습니다!');
    monsters[randomIdx].showStatus();
    return monsters[randomIdx];
  }

  /// 전투 진행 턴 출력 메서드
  void printBattleTurn(Character character) {
    stdout.writeln('\n${character.name}의 턴');
  }

  /// 사용자로부터 행동 선택을 받는 getter
  BattleAction? selectedAction() {
    stdout.write('행동 선택 ${BattleAction.sortedActionGuide}: ');

    BattleAction? action;
    try {
      action = BattleAction.fromActionNum(
        int.tryParse(stdin.readLineSync() ?? '') ?? 0,
      );
    } on ArgumentError catch (e) {
      stdout.writeln(e.message);
    }

    return action;
  }

  /// 게임 종료 메서드
  void end() {
    if (player.health <= 0) {
      stdout.writeln('사용자의 체력이 소진되었습니다.\n');
    }

    stdout.writeln("게임이 종료되었습니다. 총 $deadMonstersCount마리의 몬스터를 처치했습니다.\n");
  }
}
