import 'dart:io';
import 'dart:math';

/// 게임 내 모든 캐릭터의 기본 특성을 정의하는 추상 클래스
abstract class Character {
  final String name; // 이름
  int maxHealth; // 최대 체력
  int health; // 체력
  int attackPower; // 공격력
  int defensePower; // 방어력

  // 생성자
  Character({
    required this.name,
    required this.maxHealth,
    required this.attackPower,
    required this.defensePower,
  }) : health = maxHealth; // 초기 체력은 최대 체력으로 설정

  // 상태를 출력하는 메소드
  void showStatus() {
    stdout.writeln(
      '$name - 체력: $health, 공격력: $attackPower, 방어력: $defensePower',
    );
  }

  // 공격 메서드
  void attack(Character opponent) {
    int damage = min(
      opponent.health,
      max(0, attackPower - opponent.defensePower),
    );

    opponent.health -= damage;
    stdout.writeln('$name이(가) ${opponent.name}에게 $damage의 피해를 입혔습니다.');
  }

  // 방어 메서드
  void defend() {
    int defenseBoost = max(1, (defensePower * 0.1).toInt()); // 방어력의 10%를 체력으로 회복, 최소 1의 회복량 보장
    health = min(health + defenseBoost, maxHealth); // 체력 회복, 체력이 최대 체력을 초과하지 않도록 조정
    stdout.writeln('$name이(가) 방어 태세를 취하여 체력이 $defenseBoost만큼 증가했습니다. 현재 체력: $health');
  }

  void updateDefense(int updateNum) {
    defensePower += updateNum;
    stdout.writeln('$name의 방어력이 증가했습니다! 현재 방어력: $defensePower');
  }
}
