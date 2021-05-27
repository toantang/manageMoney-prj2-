class TypeTrade{
  int _userId = 0;
  int _typeTradeId = 0;
  String _nameTypeTrade = 'name type Trade';
  bool _typeTrade = false; // false là chi tiêu, true là thu về

  TypeTrade({int typeTradedId: 0, int userId: 0, String nameTypeTrade: "chi tieu", bool typeTrade: false}) {
    this._userId = userId;
    this._typeTrade = typeTrade;
    this._nameTypeTrade = nameTypeTrade;
    this._typeTrade = typeTrade;
  }

  Map<String, dynamic> toMap() {
    return {
      'typeTradeId': this._typeTradeId,
      'userId': this._userId,
      'nameTypeTrade': this._nameTypeTrade,
      'typeTrade': this._typeTrade,
    };
  }


  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  bool get typeTrade => _typeTrade;

  set typeTrade(bool value) {
    _typeTrade = value;
  }

  String get nameTypeTrade => _nameTypeTrade;

  set nameTypeTrade(String value) {
    _nameTypeTrade = value;
  }

  int get typeTradeId => _typeTradeId;

  set typeTradeId(int value) {
    _typeTradeId = value;
  }
}