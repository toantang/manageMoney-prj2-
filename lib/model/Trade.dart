class Trade {
  int _tradeId = 0;
  int _groupTradeId = 0;
  String _nameTrade = 'name trade';
  double _moneyTrade = 0; // số tiền dành cho giao dịch (tối đa 10B một lần)
  DateTime _dateDelivery = new DateTime(2000, 3, 26); // ngày xảy ra giao dịch
  String _note = 'note trade';

  Trade({int tradeId: 0, int groupTradeId: 0, String nameTrade, double moneyTrade: 0.0, DateTime dateDelivery, String note: 'note trade'}) {
    this._tradeId = tradeId;
    this._groupTradeId = groupTradeId;
    this._nameTrade = nameTrade;
    this._moneyTrade = moneyTrade;
    this._dateDelivery = dateDelivery;
    this._note = note;
  }

  Map<String, dynamic> toMap() {
    return {
      'tradeId': this._tradeId,
      'groupTradeId': this._groupTradeId,
      'nameTrade': this._nameTrade,
      'moneyTrade': this._moneyTrade,
      'dateDelivery': this._dateDelivery,
      'note': this._note,
    };
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

  int get groupTradeId => _groupTradeId;

  set groupTradeId(int value) {
    _groupTradeId = value;
  }

  int get tradeId => _tradeId;

  set tradeId(int value) {
    _tradeId = value;
  }
}

