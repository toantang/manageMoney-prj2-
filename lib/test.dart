
class Name {
  String _firstName = "first name";
  String _lastName = 'last name';

  Name({String firstName: 'firstName', String lastName: 'lastName'}) {
    this._firstName = firstName;
    this._lastName = lastName;
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': this._firstName,
      'lastName': this._lastName,
    };
  }

  String get firstname => _firstName;

  set firstname(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }
}

class Person {
  int _age = 0;
  Name _name = new Name();
  DateTime _birthday = DateTime.now();
  Map<String, dynamic> toMap() {
    return {
      'age': this._age,
      'name': this._name,
      'birthday': this._birthday,
    };
  }

  Person({int age: 0, Name name, DateTime birthday}) {
    this._age = age;
    this._name = name;
    this._birthday = birthday;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  DateTime get birthday => _birthday;

  set birthday(DateTime value) {
    _birthday = value;
  }
}

class Student extends Person {
  int _id = 0;
  Map<String, dynamic> toMap() {
    return {
      'id': this._id,
    };
  }

  Student({int id: 9,}) : super (age: 19, name: Name(firstName: 'toan', lastName: 'tang')){
    this._id = id;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}



void main() {
  Student student = new Student(id: 1);
  print(student._name._lastName);
  print(student.birthday);
}