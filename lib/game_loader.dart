import 'dart:io';
import 'dart:math';

import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';

/// 게임 데이터를 불러오는 클래스
class GameLoader {
  static final playerNameRegExp = RegExp(r'^[a-zA-Z가-힣\s]{1,10}$');

  /// 사용자 생성 메서드
  /// 이름은 입력받아서 설정
  /// files/player.txt로 부터 체력, 공격력, 방어력 불러옴
  static Player loadPlayer(String loadFilePath) {
    try {
      String name = getCreatePlayerName();

      final file = File(loadFilePath);
      final contents = file.readAsStringSync();
      final stats = contents.split(',');
      if (stats.length != 3) throw FormatException('Invalid player data');

      int health = int.parse(stats[0]);
      int attack = int.parse(stats[1]);
      int defense = int.parse(stats[2]);

      return Player(
        name: name,
        maxHealth: health,
        attackPower: attack,
        defensePower: defense,
      );
    } catch (e) {
      print('사용자 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }

  /// 사용자 이름 생성 메서드
  static String getCreatePlayerName() {
    String input;
    while (true) {
      stdout.write('사용자 이름 입력(한글 또는 영문): ');
      input = stdin.readLineSync() ?? '';
      if (playerNameRegExp.hasMatch(input)) {
        return input;
      }
      stdout.writeln('올바른 이름을 입력해주세요. (한글 또는 영문만 입력 가능)\n');
    }
  }

  /// 몬스터 리스트 로드 메서드
  /// files/monsters.txt로 부터 이름, 체력, 최대 공격력 불러옴
  /// 몬스터의 공격력은 minAttack과 최대 공격력 사이 랜덤으로 설정
  static List<Monster> loadMonsters(String loadFilePath, int minAttack) {
    try {
      final file = File(loadFilePath);
      final contents = file.readAsStringSync();
      final monsterContents = contents.split('\n');
      final stats = monsterContents[0].split(',');
      if (stats.length != 3) throw FormatException('Invalid monsters data');

      List<Monster> monsters = [];
      for (int i = 0; i < monsterContents.length; i++) {
        final monsterInfos = monsterContents[i].split(',');
        String name = monsterInfos[0];
        int health = int.parse(monsterInfos[1]);
        int attack = int.parse(monsterInfos[2]);
        int randomAttack = max(minAttack, Random().nextInt(attack));

        monsters.add(
          Monster(name: name, maxHealth: health, attackPower: randomAttack),
        );
      }

      return monsters;
    } catch (e) {
      print('몬스터 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }
}
