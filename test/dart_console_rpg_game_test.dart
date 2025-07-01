import 'package:dart_console_rpg_game/monster.dart';
import 'package:dart_console_rpg_game/player.dart';
import 'package:test/test.dart';

void main() {
  // 생성 및 초기화 테스트
  test('Character creation test', () {
    var character = Player(name: 'Hero', maxHealth: 100, attackPower: 20, defensePower: 10);
    
    expect(character.name, 'Hero');
    expect(character.maxHealth, 100);
    expect(character.health, 100); // 초기 체력은 최대 체력과 같아야 함
    expect(character.attackPower, 20);
    expect(character.defensePower, 10);
  });

  // 상태 업데이트 테스트
  test('Character attack test', () {
    var player = Player(name: 'Hero', maxHealth: 100, attackPower: 20, defensePower: 10);
    var monster = Monster(name: 'Goblin', maxHealth: 50, attackPower: 15);
    
    player.attackMonster(monster);
    monster.attack(player);
    
    expect(monster.health, lessThan(50));
    expect(player.health, lessThan(100));

    var prevHealth = player.health;
    player.defend();
    expect(player.health, greaterThan(prevHealth));
  });
}
