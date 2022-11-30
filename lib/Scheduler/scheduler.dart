// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:table_calendar/table_calendar.dart';

// class EventScheduler extends StatefulWidget {
//   const EventScheduler({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _EventSchedulerState createState() => _EventSchedulerState();
// }

// class _EventSchedulerState extends State<EventScheduler> {
//   // CalendarController _controller;
//   late Map<DateTime, List<dynamic>> _events;
//   late List<dynamic> _selectedEvents;
//   late TextEditingController _eventController;
//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     super.initState();
//     // _controller = CalendarController();
//     _eventController = TextEditingController();
//     _events = {};
//     _selectedEvents = [];
//     prefsData();
//   }

//   prefsData() async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _events = Map<DateTime, List<dynamic>>.from(
//           decodeMap(json.decode(prefs.getString("events") ?? "{}")));
//     });
//   }

//   Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
//     Map<String, dynamic> newMap = {};
//     map.forEach((key, value) {
//       newMap[key.toString()] = map[key];
//     });
//     return newMap;
//   }

//   Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
//     Map<DateTime, dynamic> newMap = {};
//     map.forEach((key, value) {
//       newMap[DateTime.parse(key)] = map[key];
//     });
//     return newMap;
//   }

//   @override
//   Widget build(BuildContext context) {
//     DateTime? sselectedDay;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TableCalendar(
//               firstDay: DateTime.utc(2022, 01, 31),
//               focusedDay: DateTime.now(),
//               lastDay: DateTime.utc(2025, 12, 31),
//               eventLoader: (day) {
//                 return _selectedEvents;
//               },
//               calendarFormat: CalendarFormat.week,
//               calendarStyle: const CalendarStyle(
//                   canMarkersOverflow: true,
//                   todayDecoration: BoxDecoration(color: Colors.orange),
//                   selectedDecoration: BoxDecoration(color: Colors.green),
//                   todayTextStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       color: Colors.white)),
//               headerStyle: HeaderStyle(
//                 titleCentered: true,
//                 formatButtonDecoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 formatButtonTextStyle: const TextStyle(color: Colors.white),
//                 formatButtonShowsNext: false,
//               ),
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               // onDaySelected: (date, events) {
//               //   setState(() {
//               //     _selectedEvents = events as List;
//               //   });
//               // },
//               onDaySelected: (selectedDay, events) {
//                 if (!isSameDay(sselectedDay, selectedDay)) {
//                   setState(() {
//                     sselectedDay = selectedDay;
//                     _selectedEvents = events as List;
//                   });
//                 }
//               },
//               calendarBuilders: CalendarBuilders(
//                 selectedBuilder: (context, date, events) => Container(
//                     margin: const EdgeInsets.all(4.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Text(
//                       date.day.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     )),
//                 todayBuilder: (context, date, events) => Container(
//                     margin: const EdgeInsets.all(4.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Text(
//                       date.day.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     )),
//               ),
//               selectedDayPredicate: (day) {
//                 return isSameDay(sselectedDay, day);
//               },

//               // calendarController: _controller,
//             ),
//             ..._selectedEvents.map((event) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 20,
//                     width: MediaQuery.of(context).size.width / 2,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey)),
//                     child: Center(
//                         child: Text(
//                       event,
//                       style: const TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     )),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         onPressed: _showAddDialog,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   _showAddDialog() async {
//     await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               backgroundColor: Colors.white70,
//               title: const Text("Add Events"),
//               content: TextField(
//                 controller: _eventController,
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(
//                         color: Colors.red, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: () {
//                     if (_eventController.text.isEmpty) return;
//                     setState(() {
//                       if (_events.sselectedDay != null) {
//                         _events[_controller.selectedDay]
//                             ?.add(_eventController.text);
//                       } else {
//                         _events[_controller.selectedDay] = [
//                           _eventController.text
//                         ];
//                       }
//                       prefs.setString(
//                           "events", json.encode(encodeMap(_events)));
//                       _eventController.clear();
//                       Navigator.pop(context);
//                     });
//                   },
//                 )
//               ],
//             ));
//   }
// }
