import 'package:magane_money/model/Name.dart';
import 'package:magane_money/model/UserName.dart';

class User {
  int _userId = 0;
  UserName _userName = new UserName();
  String _password = 'password';
  int _age = 0;
  Name _name = new Name();
  String _place = 'place';
  bool _sex = false; // true la nam, false la nu
  double _moneyLimitedOneDay = 0; // so tien gioi han chi tieu mot ngay
  DateTime _birthday = new DateTime(2000, 3, 26);

  User({int userId: 0, Name name, int age: 0, DateTime birthday, String place: 'ha noi', bool sex: true,
    double moneyLimitedOneDay: 0, UserName userName, String password: 'no'}) {
    this._userId = userId;
    this._name = name;
    this._age = age;
    this._birthday = birthday;
    this._place = place;
    this._sex = sex;
    this._moneyLimitedOneDay = moneyLimitedOneDay;
    this._userName = userName;
    this._password = password;
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': this._userId,
      'name': this._name,
      'age': this._age,
      'birthday': this._birthday,
      'place': this._place,
      'sex': this._sex,
      'moneyLimitedOneDay': this._moneyLimitedOneDay,
      'userName': this._userName,
      'password': this._password,
    };
  }


  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  UserName get userName => _userName;

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

  Name get name => _name;

  set name(Name value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  set userName(UserName value) {
    _userName = value;
  }

  DateTime get birthday => _birthday;

  set birthday(DateTime value) {
    _birthday = value;
  }
}