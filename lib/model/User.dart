
class User {
  String _userId = 'userId';
  String _userName = 'userName';
  String _password = 'password';
  String _name = "name";
  int _age = 0;
  String _place = 'place';
  bool _sex = false; // true la nam, false la nu
  double _moneyLimitedOneDay = 0; // so tien gioi han chi tieu mot ngay
  DateTime _birthday = new DateTime(2000, 3, 26);

  User({String userId: 'userId', String userName, String password: 'no', String name: 'no name', int age: 0, DateTime birthday,
      String place: 'ha noi', bool sex: true, double moneyLimitedOneDay: 0}) {
    this._userId = userId;
    this._userName = userName;
    this._password = password;
    this._name = name;
    this._age = age;
    this._birthday = birthday;
    this._place = place;
    this._sex = sex;
    this._moneyLimitedOneDay = moneyLimitedOneDay;
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': this._userId,
      'userName': this._userName,
      'password': this._password,
      'name': this._name,
      'age': this._age,
      'place': this._place,
      'moneyLimitedOneDay': this._moneyLimitedOneDay,
      'sex': this._sex,
      'birthday': this._birthday,
    };
  }


  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  double get moneyLimitedOneDay => _moneyLimitedOneDay;

  set moneyLimitedOneDay(double value) {
    _moneyLimitedOneDay = value;
  }

  bool get sex => _sex;

  set sex(bool value) {
    _sex = value;
  }

  String get place => _place;

  set place(String value) {
    _place = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  DateTime get birthday => _birthday;

  set birthday(DateTime value) {
    _birthday = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}