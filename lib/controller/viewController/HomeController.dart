import 'package:get/get.dart';

class HomeController extends GetxController {
  final DateTime dateTimeNow = DateTime.now();
  var _currentIndexTabbar = 0.obs;
  var _dateSelectedDropdown = 'nodate'.obs;
  var _dateStart = DateTime.now().obs; // ngày bắt đầu muốn xem giao dịch
  var _dateEnd = DateTime.now().obs; // cận trên của danh sách giao dịch
  var _currentIndexDropdownSelected = 0.obs;

  @override
  void onInit() {
    this._dateStart.value = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day - 1);
    this._dateEnd.value = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    super.onInit();
  }

  List<String> makeListSelect() {
    List<String> list = new List();
    int monthNow = dateTimeNow.month;
    int yearNow = dateTimeNow.year;

    int cnt = 6;
    int i = 0;
    list.add('Select Month');
    while (i < cnt) {
      if (monthNow == 0) {
        monthNow = 12;
        yearNow = yearNow - 1;
      }
      list.add(monthNow.toString() + '/' + yearNow.toString());
      monthNow--;
      i++;
    }

    return list;
  }

  void changeValueSelectedDropdown(String val) {
    List<String> listDatSelect = makeListSelect();
    for (int i = 0; i < listDatSelect.length; i++) {
      if (listDatSelect[i] == val) {
        this.currentIndexDropdownSelected = i;
        break;
      }
    }
  }

  bool isLeapYear(int year) {
    if (year>>2 == 0 && year%100 != 0) {
      return true;
    }
    return false;
  }

  int countDayMonth(int month, int year) {
    if(month == 2) {
      if(isLeapYear(year)) {
        return 29;
      }
      else {
        return 28;
      }
    }
    else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
      return 31;
    }
    else {
      return 30;
    }
  }

  void changeDateSelected(String val) {
    List<String> listSplit = val.split('/');
    int month = int.parse(listSplit[0]);
    int year = int.parse(listSplit[1]);
    this.dateStart = DateTime(year, month, 1);
    this.dateEnd = DateTime(year, month, countDayMonth(month, year));
  }

  void setDate(DateTime dateStart, DateTime dateEnd) {
    if (dateStart.isBefore(dateEnd)) {
      
    }
  }
  get currentIndexDropdownSelected => _currentIndexDropdownSelected.value;

  set currentIndexDropdownSelected(value) {
    _currentIndexDropdownSelected.value = value;
  }

  get currentIndexTabbar => _currentIndexTabbar.value;

  set currentIndexTabbar(value) {
    _currentIndexTabbar.value = value;
  }

  get dateSelectedDropdown => _dateSelectedDropdown.value;

  set dateSelectedDropdown(value) {
    _dateSelectedDropdown.value = value;
  }

  get dateEnd => _dateEnd.value;

  set dateEnd(value) {
    _dateEnd.value = value;
  }

  get dateStart => _dateStart.value;

  set dateStart(value) {
    _dateStart.value = value;
  }
}