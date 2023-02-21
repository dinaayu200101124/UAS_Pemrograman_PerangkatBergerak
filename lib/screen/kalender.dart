import 'package:catatan_apps/main.dart';
import 'package:catatan_apps/screen/home_screen.dart';
import 'package:catatan_apps/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(Kalender()));
}

class Kalender extends StatefulWidget {
  const Kalender({super.key});

  @override
  State<Kalender> createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false);
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
        title: Text("Today's Date"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.teal.shade600, Colors.teal.shade900])),
        ),
      ),
      body: content(),
      backgroundColor: Colors.teal.shade400,
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Select Day : " + today.toString().split(" ")[0],
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber.shade700,
            ),
          ),
          Container(
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _onDaySelected,
            ),
          ),
        ],
      ),
    );
  }

  TableCalender(
      {required focusedDay,
      required DateTime firstDay,
      required DateTime lastDay,
      required int rowHeight,
      required String locale,
      required HeaderStyle headerStyle,
      required AvailableGestures availableGestures,
      required bool Function(dynamic day) selectedDayPredicate,
      required void Function(DateTime day, DateTime focusedDay)
          onDaySelected}) {}
}
