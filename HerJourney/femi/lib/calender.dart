import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodTrackerScreen extends StatefulWidget {
  const PeriodTrackerScreen({super.key});

  @override
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'period1.db');

    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE periods(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            startDate TEXT,
            endDate TEXT,
            ovulationDate TEXT,
            nextPeriodDate TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertPeriodData(Map<String, String> periodData) async {
    final db = await database;
    await db.insert(
      'periods',
      periodData,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Map<String, dynamic>>> getPeriodData() async {
    final db = await database;
    return db.query('periods', orderBy: 'startDate DESC');
  }

  Future<void> deletePeriodData(String startDate) async {
    final db = await database;
    await db.delete(
      'periods',
      where: 'startDate = ?',
      whereArgs: [startDate],
    );
  }
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  DateTime? _selectedDate;
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _ovulationDate;
  DateTime? _nextPeriodDate;

  List<Map<String, dynamic>> _lastPeriods = [];

  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadSavedPeriodData();
  }

  void _loadSavedPeriodData() async {
    final periodData = await _dbHelper.getPeriodData();
    if (periodData.isNotEmpty) {
      setState(() {
        _startDate = DateTime.parse(periodData.first['startDate']!);
        _endDate = DateTime.parse(periodData.first['endDate']!);
        _ovulationDate = DateTime.parse(periodData.first['ovulationDate']!);
        _nextPeriodDate = DateTime.parse(periodData.first['nextPeriodDate']!);
        _lastPeriods = periodData.skip(1).toList();
      });
    }
  }

  void _calculatePeriodCycle(DateTime startDate) async {
    if (_startDate != null) {
      await _dbHelper.deletePeriodData(_startDate!.toIso8601String());
    }

    _startDate = startDate;
    _endDate = _startDate!.add(const Duration(days: 5));
    _ovulationDate = _startDate!.add(const Duration(days: 14));
    _nextPeriodDate = _startDate!.add(const Duration(days: 28));

    await _dbHelper.insertPeriodData({
      'startDate': _startDate!.toIso8601String(),
      'endDate': _endDate!.toIso8601String(),
      'ovulationDate': _ovulationDate!.toIso8601String(),
      'nextPeriodDate': _nextPeriodDate!.toIso8601String(),
    });

    setState(() {
      _selectedDate = startDate;
    });
    _loadSavedPeriodData();
  }

  bool _isDateWithinRange(DateTime date, DateTime start, DateTime end) {
    return date.isAfter(start.subtract(const Duration(days: 1))) &&
        date.isBefore(end.add(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar Widget
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(children: [
                Image.asset(
                  "assets/setting/wall.jpg",
                  fit: BoxFit.fill,
                  width: 420,
                  height: 400,
                ),
                Center(
                  child: Container(
                    height: 400,
                    width: 380,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color.fromARGB(255, 209, 181, 154),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDate = selectedDay;
                          _calculatePeriodCycle(_selectedDate!);
                        });
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, date, events) {
                          if (_startDate != null &&
                              _isDateWithinRange(
                                  date, _startDate!, _endDate!)) {
                            return _buildHighlightedDate(
                                date, Colors.pink.withOpacity(0.8));
                          }

                          if (_ovulationDate != null &&
                              date.isAtSameMomentAs(_ovulationDate!)) {
                            return _buildHighlightedDate(
                                date, Colors.blue.withOpacity(0.8));
                          }

                          if (_nextPeriodDate != null &&
                              date.isAtSameMomentAs(_nextPeriodDate!)) {
                            return _buildHighlightedDate(
                                date, Colors.purple.withOpacity(0.8));
                          }

                          for (final period in _lastPeriods) {
                            final startDate =
                                DateTime.parse(period['startDate']);
                            final endDate = DateTime.parse(period['endDate']);
                            final ovulationDate =
                                DateTime.parse(period['ovulationDate']);
                            final nextPeriodDate =
                                DateTime.parse(period['nextPeriodDate']);

                            if (_isDateWithinRange(date, startDate, endDate)) {
                              return _buildHighlightedDate(
                                  date, Colors.pink.withOpacity(0.4));
                            }
                            if (date.isAtSameMomentAs(ovulationDate)) {
                              return _buildHighlightedDate(
                                  date, Colors.blue.withOpacity(0.4));
                            }
                            if (date.isAtSameMomentAs(nextPeriodDate)) {
                              return _buildHighlightedDate(
                                  date, Colors.purple.withOpacity(0.4));
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),

            // Display Period Information
            if (_startDate != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(children: [
                  Image.asset(
                    "assets/setting/walldown2.jpg",
                    fit: BoxFit.fill,
                    width: 380,
                    height: 270,
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          "Period Information",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildPeriodInfoRow("Start Date", _startDate!),
                        _buildPeriodInfoRow("End Date", _endDate!),
                        _buildPeriodInfoRow("Ovulation Date", _ovulationDate!),
                        _buildPeriodInfoRow(
                            "Next Period Date", _nextPeriodDate!),
                      ],
                    ),
                  ),
                ]),
              ),
            // else
            //   const Padding(
            //     padding: EdgeInsets.all(20),
            //     child: Text(
            //       "Select a date to calculate your period cycle.",
            //       style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            //     ),
            // ),

            const SizedBox(height: 30),

            // Legend
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(children: [
                Image.asset(
                  "assets/setting/walldown2.jpg",
                  fit: BoxFit.fill,
                  width: 380,
                  height: 170,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Color Legend:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 5),
                      _buildLegendRow(
                          Colors.pink.withOpacity(0.8), "Current Period"),
                      _buildLegendRow(
                          Colors.blue.withOpacity(0.8), "Ovulation Day"),
                      _buildLegendRow(
                          Colors.purple.withOpacity(0.8), "Next Period Date"),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodInfoRow(String label, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _formatDate(date),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendRow(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedDate(DateTime date, Color color) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          date.day.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
