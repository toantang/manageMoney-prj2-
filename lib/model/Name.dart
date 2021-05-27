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