import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class PregnancyTracker extends StatefulWidget {
  const PregnancyTracker({super.key});

  @override
  _PregnancyTrackerState createState() => _PregnancyTrackerState();
}

class _PregnancyTrackerState extends State<PregnancyTracker> {
  DateTime? _pregnancyStartDate;
  DateTime? _expectedDeliveryDate;
  late Database _database;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  final List<DateTime> _monthEndDates = [];
  final List<DateTime> _showinfo = [];
  final List<Color> _monthEndColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];

  String _selectedMonthInfo = "";

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'pregnancy_tracker.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE pregnancy(id INTEGER PRIMARY KEY, start_date TEXT)',
        );
      },
    );

    await loadDataFromDatabase();
  }

  Future<void> loadDataFromDatabase() async {
    final pregnancyData = await _database.query('pregnancy');
    if (pregnancyData.isNotEmpty) {
      String startDateString = pregnancyData.first['start_date'] as String;
      setState(() {
        _pregnancyStartDate = DateTime.parse(startDateString);
        _expectedDeliveryDate =
            _pregnancyStartDate?.add(const Duration(days: 30 * 9));
        calculateMonthEndDates(_pregnancyStartDate!);
      });
    }
  }

  Future<void> savePregnancyStartDate(DateTime startDate) async {
    await _database.insert(
      'pregnancy',
      {'start_date': startDate.toIso8601String()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    setState(() {
      _pregnancyStartDate = startDate;
      _expectedDeliveryDate =
          _pregnancyStartDate?.add(const Duration(days: 30 * 9));
      _monthEndDates.clear();
      _selectedMonthInfo = "";
    });

    calculateMonthEndDates(startDate);
  }

  void calculateMonthEndDates(DateTime startDate) {
    _monthEndDates.clear();
    DateTime currentMonth = startDate;

    // Loop until the end of the pregnancy (9 months)
    for (int i = 0; i < 9; i++) {
      DateTime lastDayOfMonth =
          DateTime(currentMonth.year, currentMonth.month + 1, 0);
      _monthEndDates.add(lastDayOfMonth);
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1, 1);
    }

    setState(() {});
  }

  String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  bool isMonthEnd(DateTime day) {
    return _monthEndDates.any((monthEnd) => isSameDay(monthEnd, day));
  }

  Color getMonthEndColor(DateTime day) {
    int index =
        _monthEndDates.indexWhere((monthEnd) => isSameDay(monthEnd, day));
    if (index != -1) {
      return _monthEndColors[index % _monthEndColors.length];
    }
    return Colors.transparent;
  }

  void onMonthEndTapped(DateTime selectedDay) {
    int index =
        _monthEndDates.indexWhere((date) => isSameDay(date, selectedDay));
    if (index != -1) {
      int pregnancyMonth = index + 1; // 1-based month count
      String currentMonth = DateFormat('MMMM').format(selectedDay);
      int remainingMonths = 9 - pregnancyMonth;

      setState(() {
        _selectedMonthInfo =
            "Pregnancy Month: $pregnancyMonth\nCurrent Month: $currentMonth\nMonths Remaining for Delivery: $remainingMonths";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pregnancy Tracker')),
      body: Column(
        children: [
          if (_pregnancyStartDate != null && _expectedDeliveryDate != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Date: ${formatDate(_pregnancyStartDate!)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Text(
                    'Expected Delivery Date: ${formatDate(_expectedDeliveryDate!)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          if (_pregnancyStartDate != null && _expectedDeliveryDate != null)
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.now().subtract(const Duration(days: 300)),
              lastDay: DateTime.now().add(const Duration(days: 300)),
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
                if (isMonthEnd(selectedDay)) {
                  onMonthEndTapped(selectedDay);
                }
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (isSameDay(day, _pregnancyStartDate)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text(day.day.toString())),
                    );
                  } else if (isSameDay(day, _expectedDeliveryDate)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text(day.day.toString())),
                    );
                  } else if (isMonthEnd(day)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: getMonthEndColor(day),
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text(day.day.toString())),
                    );
                  }
                  return null;
                },
              ),
            ),
          if (_selectedMonthInfo.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _selectedMonthInfo,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 237, 138, 171))),
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                await savePregnancyStartDate(selectedDate!);
              },
              child: const Center(
                  child: Text(
                'Select Pregnancy Start Date',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
