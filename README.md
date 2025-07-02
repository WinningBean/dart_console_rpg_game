# Dart Console RPG Game 🧙

*Dart Console RPG Game에 도전하시겠나요?*

**Dart Console RPG Game**은 Dart 언어로 제작된 콘솔 기반의 RPG 게임입니다.

---

## 🧩 기능 소개
- 🥷 공격, 방어 메커니즘
    - 실제 피해 계산 시 공격력 - 방어력 기반으로 피해량 계산
	- defend() 메서드를 통해 일시적인 방어력 증가

---

## 🗂️ 프로젝트 구조
```
dart_console_rpg_game/
├── bin/
│   └── dart_console_rpg_game.dart      # 게임 시작점 (main 함수)
├── lib/
│   ├── character.dart                  # 추상 클래스: 캐릭터 공통 속성 및 메서드 정의
│   ├── player.dart                     # Player 클래스: 사용자 캐릭터 구현
│   └── monster.dart                    # Monster 클래스: 몬스터 구현
├── test/                               # 향후 테스트 추가 가능
│   └── dart_console_rpg_game_test.dart # 기본 테스트 파일
```

---

## 🛠 기술 스택
- **개발언어:** [Dart](https://dart.dev/)
- **환경:** CLI 기반 콘솔 출력 및 사용자 입력 처리 예정
- **구조:** OOP 패턴 기반 설계: 추상 클래스, 상속, 메서드 오버라이드

---

## ▶️ 실행 방법

1. Dart SDK가 설치되어 있어야 합니다.
2. 터미널에서 프로젝트 루트 디렉토리로 이동합니다.
3. 아래 명령어를 입력해 실행합니다:
    - `dart run` 또는 `dart run bin/dart_console_rpg_game.dart`

※ 현재는 환영 메시지만 출력됨. 향후 사용자 입력 처리, 전투 루프 등이 추가될 예정입니다.