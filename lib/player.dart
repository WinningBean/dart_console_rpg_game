import 'package:dart_console_rpg_game/character.dart';
import 'package:dart_console_rpg_game/monster.dart';

/// Character 클래스를 상속받아 플레이어의 특성을 정의하는 클래스
class Player extends Character {
  // 생성자
  Player({
    required super.name,
    required super.maxHealth,
    required super.attackPower,
    required super.defensePower,
  });

  // 플레이어가 몬스터를 공격하는 메소드
  void attackMonster(Monster monster) {
    super.attack(monster);
  }
}