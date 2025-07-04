enum BattleAction {
  attack(actionNum: 1, description: '공격'),
  defend(actionNum: 2, description: '방어'),
  item(actionNum: 3, description: '아이템 사용');

  const BattleAction({required this.actionNum, required this.description});

  final int actionNum; // 행동 번호
  final String description; // 행동 설명

  /// actionNum을 기준으로 정렬된 메뉴 목록
  static final sortedActions = BattleAction.values.toList()
    ..sort((a, b) => a.actionNum.compareTo(b.actionNum));

  /// 정렬된 action 설명 문자열 목록
  static final sortedActionGuide = sortedActions.map(
    (action) => '${action.actionNum}. ${action.description}',
  );

  /// actionNum에 해당하는 행동을 찾는 메서드
  static BattleAction? fromActionNum(int actionNum) {
    return sortedActions.firstWhere(
      (action) => action.actionNum == actionNum,
      orElse: () => throw ArgumentError('유효하지 않은 전투 행동: $actionNum'),
    );
  }
}