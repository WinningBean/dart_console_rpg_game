import 'package:dart_console_rpg_game/character.dart';
import 'package:dart_console_rpg_game/player.dart';

/// Character 클래스를 상속받아 몬스터의 특성을 정의하는 클래스
/// 몬스터는 방어력이 기본적으로 0으로 설정
class Monster extends Character {
  // 생성자
  Monster({
    required super.name,
    required super.maxHealth,
    required super.attackPower,
  }) : super(defensePower: 0); // 몬스터는 기본적으로 방어력 0으로 설정

  // 몬스터의 상태를 출력하는 메소드
  @override
  void showStatus() {
    print('$name - 체력: $health, 공격력: $attackPower');
  }

  void attackPlayer(Player player) {
    super.attack(player);
  }
}