class DigitalWallet {
  int _idUser;
  double _accountBalance;
  String _nameTypeWallet;

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  double get accountBalance => _accountBalance;

  String get nameTypeWallet => _nameTypeWallet;

  set nameTypeWallet(String value) {
    _nameTypeWallet = value;
  }

  set accountBalance(double value) {
    _accountBalance = value;
  }
}