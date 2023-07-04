import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

import 'package:ethio_tour/screen/EthiopianCalendar.dart';
// import 'package:flutter/rendering.dart';
import 'dart:math';
// import '../../routes/route.dart' as route;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List img = <String>['0.jpg', '1.jpg'];
  String present_day = '';

  _currentDay() {
    var now = new EthiopianCalendar.now();

    var currentDay = now.currentDay();
    int day_ = currentDay.day!;
    int month_ = currentDay.month!;
    int year_ = currentDay.year!;
    setState(() {
      present_day = "$day_-$month_-$year_";
    });
  }

  // change Image
  List<String> imageList = [
    'assets/calendar/0.jpg',
    'assets/calendar/1.jpg',
    // Todo add image 2.jgp,
    'assets/calendar/3.jpg',
    'assets/calendar/4.jpg',
    'assets/calendar/5.jpg',
    'assets/calendar/6.jpg',
    'assets/calendar/7.jpg',
    'assets/calendar/8.jpg',
    'assets/calendar/9.jpg',
    'assets/calendar/10.jpg',
    // Add more image paths here
  ];
  var currentImage = 'assets/calendar/1.jpg';

  void changeImage() {
    // Get a random index from the imageList
    final random = Random();
    int randomIndex = random.nextInt(imageList.length);

    setState(() {
      // Set the currentImage to the randomly selected image path
      currentImage = imageList[randomIndex];
    });
  }

  Future dayInfo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(153, 7, 7, 7),
          // title: const Text('Add Review'),
          content: Container(
            width: 200,
            height: 200,
            // decoration: BoxDecoration(),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ETCalendar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 74,
                        ),
                      ),
                      Text(
                        '2015EC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    color: Color.fromARGB(145, 158, 158, 158),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GC',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 74,
                        ),
                      ),
                      Text(
                        '2023GC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  EthiopianCalendar _calendar = EthiopianCalendar.now();
  final List<String> _weekdayNames = [
    // 'Sun',
    // 'Mon',
    // 'Tue',
    // 'Wed',
    // 'Thu',
    // 'Fri',
    // 'Sat',
    'እሁድ', 'ሰኞ', 'ማግሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ',
  ];

  List<Widget> _buildDayCells() {
    _currentDay();
    List<Widget> cells = [];
    int daysInMonth = _calendar.daysInMonth();
    int firstDayOfWeek = _calendar.firstDayOfWeek();
    int prevMonthDays = _calendar.previousMonth().daysInMonth();
    int nextMonthDays = _calendar.nextMonth().daysInMonth();
    // todo weekend
    int prevMonthOffset = (firstDayOfWeek + 5) % 7;

    // Add cells for days from previous month
    for (int i = prevMonthDays - prevMonthOffset + 1; i <= prevMonthDays; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday$cmonth$cyear";

      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: date.isHoliday
                  ? const Border(
                      bottom: BorderSide(
                        color: Color(0xffd27405),
                        width: 2.0,
                      ),
                    )
                  : Border.all(color: Colors.transparent),
              // color: date.isHoliday ? Colors.red : null,
              color: null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                      color: date.isHoliday
                          ? const Color(0xffd27405)
                          : Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                if (date.isHoliday)
                  Text(
                    date.holiday_name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xffd27405)),
                  ),
                //todo change present day num color
              ],
            ),
          ),
        ),
      );
    }

    // Add cells for each day of the month
    for (int i = 1; i <= daysInMonth; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);

      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday$cmonth$cyear";
      // print(currentDay);

      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: GestureDetector(
            onTap: dayInfo,
            child: Container(
              decoration: BoxDecoration(
                border: date.isHoliday
                    ? const Border(
                        bottom: BorderSide(
                          color: Color(0xffd27405),
                          width: 2.0,
                        ),
                      )
                    : Border.all(color: Colors.transparent),
                // color: date.isHoliday ? Colors.red : null,
                // color: _currentDay(currentDay) ? Colors.red : Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}',
                    style: TextStyle(
                        color:
                            date.isHoliday ? Color(0xffd27405) : Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  if (date.isHoliday)
                    Text(
                      date.holiday_name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffd27405),
                      ),
                    ),
                  //todo change present day num color
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Add cells for days from next month
    int numCells = cells.length;
    int numRows = (numCells / 7).ceil() * 7;
    int nextMonthOffset = numRows - numCells;
    for (int i = 1; i <= nextMonthOffset; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday-$cmonth-$cyear";
      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: date.isHoliday
                  ? const Border(
                      bottom: BorderSide(
                        color: Color(0xffd27405),
                        width: 2.0,
                      ),
                    )
                  : Border.all(),
              // color: date.isHoliday ? Colors.red : null,
              color: null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                      color: date.isHoliday ? Color(0xffd27405) : Colors.white),
                  textAlign: TextAlign.center,
                ),
                if (date.isHoliday)
                  Text(
                    date.holiday_name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xffd27405)),
                  ),
                //todo change present day num color
              ],
            ),
          ),
        ),
      );
    }
    for (int i = 1; i <= nextMonthDays - nextMonthOffset; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      cells.add(
        Container(
          decoration: BoxDecoration(
            border: date.isHoliday
                ? const Border(
                    bottom: BorderSide(
                      color: Color(0xffd27405),
                      width: 2.0,
                    ),
                  )
                : Border.all(color: Colors.transparent),
            // color: date.isHoliday ? Colors.red : null,
            color: null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${i + daysInMonth + 2}',
                style: TextStyle(color: Colors.white),
              ),
              if (date.isHoliday)
                Text(
                  date.holiday_name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffd27405)),
                ),
            ],
          ),
        ),
      );
    }

    // Add weekday name cells
    for (int i = 0; i < 7; i++) {
      cells.insert(
        i,
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffd27405),
                  width: 2.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                _weekdayNames[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade300,
                  // color: Color(0xffd27405),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Remove extra cells for previous month if necessary
    if (cells.length > 35) {
      cells.removeRange(35, cells.length);
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        backgroundColor: Color(0xffd27405),
        onPressed: () {
          //code to execute on button press
          // Navigator.pushNamed(context, route.calendar);
        },
        child: Icon(
          Icons.calendar_month,
          color: Color(0xff1c1c1c),
        ), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      //floating action button location to left

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Color(0xff1c1c1c),
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 90),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Color(0xffd27405),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, route.homePage);
                },
              ),
            ),
            // IconButton(
            //   icon: const FaIcon(
            //     FontAwesomeIcons.moneyBillTrendUp,
            //     color: Color(0xffd27405),
            //   ),
            // onPressed: () {
            //   Navigator.pushNamed(context, route.currency);
            // },
            // ),
            IconButton(
              icon: Icon(
                Icons.info,
                color: Color(0xffd27405),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: Color(0xffd27405),
              ),
              onPressed: () {},
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.user,
            //     color: Color(0xffd27405),
            //   ),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
      backgroundColor: Color(0xff1c1c),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1c1c),
        foregroundColor: Color(0xffd27405),
        centerTitle: true,
        title: Text('ETCalendar'),
      ),
      body: Column(
        children: [
          Container(
            // Todo change width to screen size using mediaQuery
            width: 500,
            height: 300,
            child: Image.asset(
              currentImage,
              fit: BoxFit.cover,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            children: _buildDayCells(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Color(0xffd27405),
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    _calendar = _calendar.previousMonth();
                    changeImage();
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_calendar.month_name} ${_calendar.year}',
                    style: const TextStyle(
                        color: Color(0xffd27405),
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    present_day,
                    style: const TextStyle(
                        color: Color(0xffd27405),
                        fontSize: 10,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Color(0xffd27405),
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    _calendar = _calendar.nextMonth();
                    changeImage();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
