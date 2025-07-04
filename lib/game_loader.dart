import 'dart:io';
import 'dart:math';

import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';

/// 게임 데이터를 불러오는 클래스
class GameLoader {
  static final playerNameRegExp = RegExp(r'^[a-zA-Z가-힣\s]{1,10}$');
  static final randomStatMinNum = 10;
  static final randomStatMaxNum = 50;

  /// 사용자 생성 메서드
  /// 이름은 입력받아서 설정
  /// files/player.txt로 부터 체력, 공격력, 방어력 불러옴
  static Player loadPlayer(String loadFilePath) {
    String name = getCreatePlayerName();
    int health, attack, defense;

    try {
      final file = File(loadFilePath);
      final contents = file.readAsStringSync();
      final stats = contents.split(',');
      if (stats.length != 3) throw FormatException('Invalid player data');

      health = int.parse(stats[0]);
      attack = int.parse(stats[1]);
      defense = int.parse(stats[2]);
    } catch (e) {
      stdout.writeln('사용자 데이터를 불러오는 데 실패했습니다');
      stdout.writeln(
        '사용자의 능력을 $randomStatMaxNum이하 $randomStatMinNum이상 랜덤으로 설정합니다.\n',
      );

      health = generateRandomNum(randomStatMinNum, randomStatMaxNum);
      attack = generateRandomNum(randomStatMinNum, randomStatMaxNum);
      defense = generateRandomNum(randomStatMinNum, randomStatMaxNum);
    }

    return Player(
      name: name,
      maxHealth: health,
      attackPower: attack,
      defensePower: defense,
    );
  }

  /// 랜덤값 생성 메서드
  static int generateRandomNum(int minNum, int maxNum) {
    return max(minNum, Random().nextInt(maxNum + 1));
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
    bool isRandom = false;
    int monsterCount = 3;
    List<String> monsterContents = [];

    try {
      final file = File(loadFilePath);
      final contents = file.readAsStringSync();

      monsterContents = contents.split('\n');
      monsterCount = monsterContents.length;

      final stats = monsterContents[0].split(',');
      if (stats.length != 3) throw FormatException('Invalid monsters data');
    } catch (e) {
      stdout.writeln('몬스터 데이터를 불러오는 데 실패했습니다');
      stdout.writeln('몬스터를 3마리를 랜덤으로 설정합니다.\n');
      isRandom = true;
    }

    List<Monster> monsters = [];
    for (int i = 0; i < monsterCount; i++) {
      String name;
      int health, attack, randomAttack;

      if (isRandom) {
        name = generateRandomUppercaseName(5);
        health = generateRandomNum(randomStatMinNum, randomStatMaxNum);
        attack = generateRandomNum(randomStatMinNum, randomStatMaxNum);
      } else {
        final monsterInfos = monsterContents[i].split(',');
        name = monsterInfos[0];
        health = int.parse(monsterInfos[1]);
        attack = int.parse(monsterInfos[2]);
      }
      randomAttack = max(minAttack, Random().nextInt(attack));

      monsters.add(
        Monster(name: name, maxHealth: health, attackPower: randomAttack),
      );
    }

    return monsters;
  }

  /// 랜덤 이름 생성 메서드
  static String generateRandomUppercaseName(int maxLength) {
    final length = Random().nextInt(maxLength) + 1;
    return String.fromCharCodes(
      List.generate(length, (_) => Random().nextInt(26) + 65), // A(65) ~ Z(90)
    );
  }
}
