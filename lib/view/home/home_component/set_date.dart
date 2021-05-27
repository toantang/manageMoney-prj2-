import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/string/string_used.dart';

class SetDate extends StatelessWidget {

  Widget setDateStatistic(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              border: Border.all(color: kDefaultDeepPurpleAccent400, width: 0.7, ),
            ),
            width: MediaQuery.of(context).size.width/2.1,
            child: ListTile(
              leading: Icon(Icons.date_range, color: kDefaultDeepPurpleAccent400),
              title: Text(kDefaultSetDateStart, style: TextStyle(color: kDefaultBlack),),
              onTap: () {

              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              width: MediaQuery.of(context).size.width/2.1, //2.3
              decoration: BoxDecoration(
                border: Border.all(color: kDefaultDeepPurpleAccent400, width: 0.7, ),
              ),
              child: ListTile(
                leading: Icon(Icons.date_range, color: kDefaultDeepPurpleAccent400),
                title: Text(kDefaultSetDateEnd, style: TextStyle(color: kDefaultBlack),),
                onTap: () {

                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _listSelect;
  int index = 0;

  //Make dropdown Button select Month
  Widget makeDropDownButtonSelectDate(BuildContext context) {

  List<String> list = new List();
  DateTime dateTime = DateTime.now();
  int monthNow = dateTime.month;
  int yearNow = dateTime.year;

  int cnt = 6;
  int i = 0;
  list.add('Select Month');
  while(i < cnt) {
    if (monthNow == 0) {
      monthNow = 12;
      yearNow = yearNow - 1;
    }
    list.add(monthNow.toString() + '/' + yearNow.toString());
    monthNow--;
    i++;


    this._listSelect = list;
    //return this._listSelect;
  }

    return Container(
      padding: EdgeInsets.only(top: 15),
      child: DropdownButton(
        value: _listSelect[index],
        items: _listSelect.map((String value) {
          return new DropdownMenuItem<String>(
              value: value,
              child: Container(
                child: Column(
                  children: [
                    new Divider(
                      height: 2.5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: new Text(value, style: TextStyle(color: kDefaultBlack, fontSize: kDefaultFontSize-3),),
                    ),
                  ],
                ),
              )
          );
        }).toList(),
        onChanged: (String val) {
          List<String> listUserSelect = val.split('/');
        },
        icon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 0.5,
              colors: <Color>[
                Color(0xFF46A0AE),
                Color(0xFF00FFCB)
              ],
              tileMode: TileMode.repeated,
            ).createShader(bounds);
          },
          child: Icon(Icons.arrow_downward),
        ),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 1.5,
          color: Colors.yellow[100],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        makeDropDownButtonSelectDate(context),
        setDateStatistic(context),
      ],
    );
  }
}