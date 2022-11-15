import 'package:flutter/material.dart';
import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: AnimatedHorizontalCalendar(
          tableCalenderIcon: const Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          date: DateTime.now(),
          textColor: Colors.black45,
          backgroundColor: Colors.white,
          tableCalenderThemeData: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Colors.green)
                .copyWith(secondary: Colors.lightGreenAccent),
          ),
          selectedColor: const Color.fromRGBO(104, 144, 43, 1),
          onDateSelected: (date) {
            selectedDate = date;
          }),
    );
  }
}
