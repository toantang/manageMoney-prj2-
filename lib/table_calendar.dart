import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();

}

class CalendarState extends State<Calendar>{
  CalendarController _controller;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _date = new DateTime.now();
  }

  void dateSelected(DateTime date) {
    this._date = date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context, this._date);
              },
            ),
            title: Text('Calendar'),
            actions: <Widget> [
              FlatButton(
                child: Text('Save'),
                onPressed: () {
                  Navigator.pop(context, this._date);
                },
              ),
            ]
        ),
        body: Column(
          children: <Widget> [
            SafeArea(
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.blueAccent,
                  selectedColor: Colors.deepOrange,
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) {

                     dateSelected(date);

                      return Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          /*decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),*/
                          child: Text(date.day.toString(), style: TextStyle(
                            color: Colors.white,
                            ),
                          )
                      );
                    },
                    todayDayBuilder: (context, date, events) {
                      return Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(date.day.toString(), style: TextStyle(
                            color: Colors.white,
                          ),)
                      );
                    }
                ),
                calendarController: _controller,
              )
            ),
          ],
        )
    );
  }
}


