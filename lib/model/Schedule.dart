class Schedule {
  String _scheduleId = 'noScheduleId';
  String _userId = 'noUserId';
  String _nameSchedule = 'name schedule';
  double _sumMoneySchedule = 0.0; // so tien danh cho ke hoach, limited = 10B
  DateTime _dateStartSchedule = new DateTime(2000, 3, 26);
  int _interval = 0;
  String _note = 'note schedule';
  bool _stateSchedule = false; // false là chưa hoàn thành, true là hoàn thành
  double _progessSchedule = 0.0; // tiến độ của kế hoạch x%

  Schedule({String scheduleId: 'noScheduleId', String userId: 'userId', String nameSchedule: 'name schedule',
        double sumMoneySchedule: 0.0, DateTime dateStartSchedule, int interval: 0,
        String note: 'note schedule', bool stateSchedule: false, double progessSchedule: 0}) {
    this._scheduleId = scheduleId;
    this._userId = 'userId';
    this._nameSchedule = nameSchedule;
    this._sumMoneySchedule = sumMoneySchedule;
    this._dateStartSchedule = dateStartSchedule;
    this._interval = interval;
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
      'interval': this._interval,
      'note': this._note,
      'stateSchedule': this._stateSchedule,
      'progessSchedule': this._progessSchedule,
    };
  }


  String get scheduleId => _scheduleId;

  set scheduleId(String value) {
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

  int get interval => _interval;

  set interval(int value) {
    _interval = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }
}