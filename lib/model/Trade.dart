class Trade {
  String _userId = 'userId';
  String _tradeId = 'tradeId';
  bool _typeTradeId = false; // typeTradeId = false nếu là chi tiêu, = true nếu là thu vào
  String _nameTypeTrade = 'expenditure';
  String _nameGroupTrade = 'no group';
  String _nameTrade = 'name trade';
  double _moneyTrade = 0; // số tiền dành cho giao dịch (tối đa 10B một lần)
  DateTime _dateDelivery = new DateTime(2000, 3, 26); // ngày xảy ra giao dịch
  String _note = 'note trade';

  Trade({String userId: 'userId', String tradeId: 'tradeId', bool typeTradeId: false,
        String nameTypeTrade: 'expenditure', String nameGroupTrade: 'nameGroupTrade', String nameTrade:  'nameTrade',
        double moneyTrade: 0.0, DateTime dateDelivery, String note: 'note trade'}) {
    this._userId = userId;
    this._tradeId = tradeId;
    this._typeTradeId = typeTradeId;
    this._nameTypeTrade = nameTypeTrade;
    this._nameGroupTrade = nameGroupTrade;
    this._nameTrade = nameTrade;
    this._moneyTrade = moneyTrade;
    this._dateDelivery = dateDelivery;
    this._note = note;
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this._userId,
      'tradeId': this._tradeId,
      'typeTradeId': this._typeTradeId,
      'nameTypeTrade': this._nameTypeTrade,
      'nameGroupTrade': this._nameGroupTrade,
      'nameTrade': this._nameTrade,
      'moneyTrade': this._moneyTrade,
      'dateDelivery': this._dateDelivery,
      'note': this._note,
    };
  }


  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  DateTime get dateDelivery => _dateDelivery;

  set dateDelivery(DateTime value) {
    _dateDelivery = value;
  }

  double get moneyTrade => _moneyTrade;

  set moneyTrade(double value) {
    _moneyTrade = value;
  }

  String get nameTrade => _nameTrade;

  set nameTrade(String value) {
    _nameTrade = value;
  }

  String get nameGroupTrade => _nameGroupTrade;

  set nameGroupTrade(String value) {
    _nameGroupTrade = value;
  }

  String get nameTypeTrade => _nameTypeTrade;

  set nameTypeTrade(String value) {
    _nameTypeTrade = value;
  }

  String get tradeId => _tradeId;

  set tradeId(String value) {
    _tradeId = value;
  }

  bool get typeTradeId => _typeTradeId;

  set typeTradeId(bool value) {
    _typeTradeId = value;
  }
}

