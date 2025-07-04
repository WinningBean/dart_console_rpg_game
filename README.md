# 🧙 Dart Console RPG Game

*Dart Console RPG Game에 도전하시겠나요?*

**Dart Console RPG Game**은 Dart 언어로 제작된 콘솔 기반의 RPG 게임입니다.
사용자와 몬스터가 서로 공격을 주고받는 전투 시스템을 포함하며, 파일 또는 사용자 입력을 통해 캐릭터 정보를 불러올 수 있습니다.

---

## 🧩 기능 소개
- 사용자와 몬스터 정보를 파일 또는 입력을 통해 불러오기 (GameLoader)
- 기본적인 전투 시스템 (BattleAction)
- 플레이어와 몬스터의 능력 비교에 따라 대미지 계산 및 체력 감소
- 게임 진행 중 승패 판정 및 결과 저장 기능 (GameSaver)
- 콘솔 기반 UI 구성 (입력 및 출력)

---

## 🗂️ 프로젝트 구조
```
dart_console_rpg_game/
├── bin/
│   └── dart_console_rpg_game.dart       # 메인 실행 파일
├── lib/
│   ├── battle_action.dart               # 전투 동작 및 선택 처리
│   ├── character.dart                   # 캐릭터의 공통 속성
│   ├── game.dart                        # 게임 흐름 관리
│   ├── game_loader.dart                 # 사용자/몬스터 로딩 기능
│   ├── game_saver.dart                  # 결과 파일 저장 기능
│   ├── monster.dart                     # 몬스터 클래스
│   └── player.dart                      # 플레이어 클래스
├── files/
│   ├── player.txt                       # 플레이어 정보 파일
│   └── monsters.txt                     # 몬스터 정보 파일
├── test/
│   └── dart_console_rpg_game_test.dart  # 테스트 파일
```

---

## 🛠 기술 스택
- **개발언어:** [Dart](https://dart.dev/)
- **환경:** CLI 기반 콘솔 출력 및 사용자 입력 처리 예정
- **구조:** OOP 패턴 기반 설계: 추상 클래스, 상속, 메서드 오버라이드
- **데이터 처리:** 텍스트 파일 기반 캐릭터 및 몬스터 정보 불러오기
- **입출력:** 동기 방식 파일 I/O 및 표준 입력(stdin), 출력(stdout) 활용
- **에러 핸들링:** 예외 처리 (try-catch) 및 유효성 검사 포함

---

## ▶️ 실행 방법

1. Dart SDK가 설치되어 있어야 합니다.
2. 터미널에서 프로젝트 루트 디렉토리로 이동합니다.
3. 아래 명령어를 입력해 실행합니다:
    - `dart run` 또는 `dart run bin/dart_console_rpg_game.dart`

---

## 🧭 기능 흐름
1.	GameLoader
    - loadPlayerFromInput() 또는 loadPlayerFromFile() 을 통해 플레이어 생성
    - loadMonstersFromFile() 로 몬스터 목록 불러오기
2.	Game
    - start() 메서드로 전투 루프 실행
    - 사용자 행동 입력 → 데미지 계산 → 턴 전환 → 승패 판정
3.	BattleAction
    - 공격, 회복, 도망 등의 액션을 선택하고 처리
4.	GameSaver
    - 게임 종료 후 결과를 지정된 경로에 저장