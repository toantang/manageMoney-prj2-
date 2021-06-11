import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String save = 'SAVE';
const String pathBackground = 'assets/background/bg_1.jpg';

//string used in inputMoney
const String kHintTextInputMoney = "số tiền giao dịch";
const String kSuffixTextInputMoney = "\$";
const List<String> listTypeTrade= ["Khoản chi cố định", "Khoản chi không cố định", "Khoản thu cố định",
  "Khoản thu không cố định"];
const List<String> listNameTypeTrade = ['expenditure fixed', 'expenditure', 'turnover fixed', 'turnover'];
const String kDefaultSelectGroupTransaction = "Nhóm giao dịch";
const String kDefaultNote = "Ghi chú";
const String nameTradeDefault = "Select Trade";
//

const List<String> listNameBottomNavigationBar = ['Home', 'Chart', 'Schedule', 'Settings'];
const String kDefaultSetDateStart = 'Ngày bắt đầu';
const String kDefaultSetDateEnd = 'Ngày kết thúc';

// String use in class settings
const String introduce = "Manager Application has been founded with a desire to help you manage personal finance scientifically and "
    "logically for your future.  You can add a transaction in the day, view transaction history or reckon transaction chart "
    "in a visual way. Even you can make plans for your future. And Manager Money will go with you to do this.";
const String introBtn = "Introduce";
const String accountInforBtn = "Account Information";
const String feedBackBtn = "Feed Back";
const String FEEDBACK = "If you have any contributions, please send to …. We are happy to get your feedbacks";
//"If you have any contributions, please send to …. We are happy to get your feedbacks";

//String name of trade
const List<String> listNameExpenditureFixed = ['Electrics', 'Water', 'Internet', 'Interest', ];
const List<String> listNameTurnover = ['Business', 'Invest', 'Gift', 'OverTime'];
const List<String> listNameTurnoverFixed = ['Earnings', 'Business', 'Invest', ];

//list error when add trade in database
const List<String> listErrorInputMoney = ["không được để trống số tiền", "The maximum amount is one millionM",
  "số tiền giao dịch không được nhỏ hơn 0", "số tiền giao dịch",
  "số tiền có tối đa 2 chữ số sau dấu phẩy", "The maximum amount is one million", "số tiền tối đa là 1M"];
const List<String> listErrorInputNote = ["ghi chú không quá 100 kí tự"];
const List<String> listErrorTradeSelected = ['vui lòng chọn tên giao dịch'];

//String used in ScheduleView
const List<String> listContentTabScheduleView = ['unfinished', 'finished'];
const String textAddSchedule = 'new schedule';
//String used in AddScheduleView
const String kDefaultInputMoneySchedule = "Sum money for your schedulle";
const String kDefaultNameSchedule = "your schedule's name";
const List<String> listTimeUnits = ['years', 'months', 'days'];
const List<String> listtimeUnit = ['year', 'month', 'day'];
const String kDefaultIntervalSchedule = 'Interval';

//String used in InformationScheduleView
const List<String> lisKeySchedule = ['nameSchedule', 'sumMoneySchedule', 'interval',
  'note', 'progessSchedule', 'dateStartSchedule'];
const List<String> listUnitOneSchedule = ['', '\$', 'months', '', '%', ''];

/*String used in AddScheduleView
const List<String> imagesScheduleView = ['assets/images/house.jpg', 'assets/images/car.jpg',
  'assets/images/tech-product.jpg',  'assets/images/travel.jpg', 'assets/images/money.jpg',];
const List<String> listSub = [
  "House is a place, where you'll have moments of relaxation.",
  "Car - It's very great when the weather is rain",
  "Iphone, Laptop, etc. They are very very important and perfect",
  "Travel - If you like traveling, Saving up now",
  "Money - Savaing up to prepare for you future"
];*/


//icon used in InformationTradeView
const List<Icon> listIconInforTrade = [
  Icon(Icons.drive_file_rename_outline), Icon(Icons.shopping_cart),
  Icon(Icons.monetization_on), Icon(Icons.drive_file_rename_outline),
  Icon(Icons.timeline), Icon(Icons.date_range)];

const List<String> listKey = ['nameTrade', 'nameGroupTrade', 'moneyTrade', 'nameTypeTrade', 'note', 'dateDelivery'];
const List<String> listUpdateItem = ["update name's trade", "update name group of trade",
  "update money",  'update type trade', 'update note',];

//String used in ChartView
const List<String> listContentTabChartView = ['Expenditure&Turnover',
  'Expenditure',
  'Turnover',];

//String used in MakeChartView