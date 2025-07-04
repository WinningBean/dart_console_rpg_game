import 'package:dart_console_rpg_game/character.dart';

/// Character 클래스를 상속받아 플레이어의 특성을 정의하는 클래스
class Player extends Character {
  // 생성자
  Player({
    required super.name,
    required super.maxHealth,
    required super.attackPower,
    required super.defensePower,
  });

  void restoreHealth(int recoveryNum) {
    maxHealth += recoveryNum;
    health += recoveryNum;
  }
}