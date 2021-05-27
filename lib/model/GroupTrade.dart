class GroupTrade {
  String _nameGroupTrade = "name group transaction"; //vdu group EatAndCoffe
  int _typeTradeId = 0;
  int _groupTradeId = 0;

  GroupTrade({String nameGroupTrade: 'expenditure', int typeTradeId: 0, int groupTradeId: 0}) {
    this._nameGroupTrade = nameGroupTrade;
    this._typeTradeId = typeTradeId;
    this._groupTradeId = groupTradeId;
  }

  Map<String, dynamic> toMap() {
    return {
      'typeTradeId': this._typeTradeId,
      'groupTradeId': this._groupTradeId,
      'nameGroupTrade': this._nameGroupTrade,
    };
  }

  int get groupTradeid => _groupTradeId;

  set groupTradeid(int value) {
    _groupTradeId = value;
  }

  int get typeTradeId => _typeTradeId;

  set typeTranTradeId(int value) {
    _typeTradeId = value;
  }

  String get nameGroupTrade => _nameGroupTrade;

  set nameGroupTrade(String value) {
    _nameGroupTrade = value;
  }
}