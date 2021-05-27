class UserName {
  String _gmail = "gmail";
  String _facebook = 'fb';
  String _nameAccount = 'name account';

  UserName({String gmail: 'gmail', String facebook: 'fb', String nameAccount: 'name account'}) {
    this._gmail = gmail;
    this._facebook = facebook;
    this._nameAccount = nameAccount;
  }

  Map<String, dynamic> toMap() {
    return {
      'facebook': this._facebook,
      'gmail': this._gmail,
      'nameAccount': this._nameAccount,
    };
  }
  String get gmail => _gmail;

  set gmail(String value) {
    _gmail = value;
  }

  String get facebook => _facebook;

  String get nameAccount => _nameAccount;

  set nameAccount(String value) {
    _nameAccount = value;
  }

  set facebook(String value) {
    _facebook = value;
  }
}