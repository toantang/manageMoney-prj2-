class Schedule {
  int _scheduleId = 0;
  int _userId = 0;
  String _nameSchedule = 'name schedule';
  double _sumMoneySchedule = 0; // so tien danh cho ke hoach, limited = 10B
  DateTime _dateStartSchedule = new DateTime(2000, 3, 26);
  DateTime _dateEndSchedule = new DateTime(2000, 3, 26);
  String _note = 'note schedule';
  bool _stateSchedule = false; // false là chưa hoàn thành, true là hoàn thành
  double _progessSchedule = 0; // tiến độ của kế hoạch x%

  Schedule({int scheduleId: 0, int userId: 0, String nameSchedule: 'name schedule', double sumMoneySchedule: 0.0, DateTime dateStartSchedule,
      DateTime dateEndSchedule, String note: 'note schedule', bool stateSchedule: false, double progessSchedule: 0}) {
    this._scheduleId = scheduleId;
    this._userId = userId;
    this._nameSchedule = nameSchedule;
    this._sumMoneySchedule = sumMoneySchedule;
    this._dateStartSchedule = dateStartSchedule;
    this._dateEndSchedule = dateEndSchedule;
    this._note = note;
    this._stateSchedule = stateSchedule;
    this._progessSchedule = progessSchedule;
  }

  Map<String, dynamic> toMap() {
    return {
      'scheduleId': this._scheduleId,
      'userId': this._userId,
      'nameSchedule': this._nameSchedule,
      'sumMoneySchedule': this._sumMoneySchedule,
      'dateStartSchedule': this._dateStartSchedule,
      'dateEndSchedule': this._dateEndSchedule,
      'note': this._note,
      'stateSchedule': this._stateSchedule,
      'progessSchedule': this._progessSchedule,
    };
  }


  int get scheduleId => _scheduleId;

  set scheduleId(int value) {
    _scheduleId = value;
  }

  double get progessSchedule => _progessSchedule;

  set progessSchedule(double value) {
    _progessSchedule = value;
  }

  bool get stateSchedule => _stateSchedule;

  set stateSchedule(bool value) {
    _stateSchedule = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  DateTime get dateStartSchedule => _dateStartSchedule;

  set dateStartSchedule(DateTime value) {
    _dateStartSchedule = value;
  }

  double get sumMoneySchedule => _sumMoneySchedule;

  set sumMoneySchedule(double value) {
    _sumMoneySchedule = value;
  }

  String get nameSchedule => _nameSchedule;

  set nameSchedule(String value) {
    _nameSchedule = value;
  }

  DateTime get dateEndSchedule => _dateEndSchedule;

  set dateEndSchedule(DateTime value) {
    _dateEndSchedule = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}