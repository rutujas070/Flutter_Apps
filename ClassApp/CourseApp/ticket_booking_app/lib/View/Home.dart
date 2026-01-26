import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ticket_booking_app/Controller/AddData.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:ticket_booking_app/Model/FlightData.dart';
import 'package:ticket_booking_app/View/Account.dart';
import 'package:ticket_booking_app/View/SearchResult.dart';
import 'package:ticket_booking_app/View/Transaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedTrip = "oneway";
  List<Flightdata> flightData = [];
  final TextEditingController _fromEditingController = TextEditingController();
  final TextEditingController _toEditingController = TextEditingController();
  final TextEditingController _dateEditingController = TextEditingController();
  final TextEditingController _travelersEditingController =
      TextEditingController();

  final AddFlightData addFlightData = AddFlightData();

  Future<void> showStyledCalendarBottomSheet(
    BuildContext context,
    TextEditingController dateEditingController,
  ) async {
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;
    bool showYearPicker = false;

    String _monthName(int month) {
      const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
      return months[month - 1];
    }

    String _formatDate(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')} "
          "${_monthName(date.month)} "
          "${date.year}";
    }

    final result = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag indicator
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Date",
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // HEADER (MONTH + YEAR DROPDOWN)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showYearPicker = !showYearPicker;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${_monthName(focusedDay.month)} ${focusedDay.year}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          showYearPicker
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 30,
                          color: const Color.fromRGBO(0, 100, 210, 1),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // YEAR PICKER BAR
                  if (showYearPicker)
                    SizedBox(
                      height: 400,
                      child: YearPicker(
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                        selectedDate: focusedDay,
                        onChanged: (date) {
                          setState(() {
                            focusedDay = DateTime(date.year, focusedDay.month);
                            showYearPicker = false;
                          });
                        },
                      ),
                    ),

                  // CALENDAR
                  if (!showYearPicker)
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(selectedDay, day),
                      onDaySelected: (selected, focused) {
                        setState(() {
                          selectedDay = selected;
                          focusedDay = focused;
                        });
                      },
                      headerVisible: false,
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 100, 210, 1),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 100, 210, 1),
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: const TextStyle(color: Colors.black),
                        weekendTextStyle: const TextStyle(color: Colors.black),
                      ),
                    ),

                  const SizedBox(height: 20),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, selectedDay);
                      },
                      child: Text(
                        "Search Date",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    if (result != null) {
      dateEditingController.text = _formatDate(result);
    }
  }

  void initState() {
    GetData getData = GetData();
    super.initState();
    getData.fetchFlights(context);
  }

  @override
  Widget build(BuildContext context) {
    final company = context.watch<Companay>();
    final company1 = context.watch<Companay>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/Signup_Icons/Group (5).png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
                    const SizedBox(width: 80),
                    Text(
                      "Search Flights",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Discover a new world",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 37,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 20,
                    right: 20,
                  ),
                  height: (MediaQuery.of(context).size.height) - 163,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: "oneway",
                                  fillColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(0, 100, 210, 1),
                                  ),
                                  groupValue: selectedTrip,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedTrip = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  "One-way",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                Radio<String>(
                                  value: "roundtrip",
                                  fillColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(0, 100, 210, 1),
                                  ),
                                  groupValue: selectedTrip,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedTrip = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  "Round-trip",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "From",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade100,
                          ),
                          child: TextField(
                            controller: _fromEditingController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(203, 203, 203, 1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 100, 210, 1),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.flight_takeoff_outlined,
                                size: 30,
                                color: Color.fromRGBO(0, 100, 210, 1),
                              ),
                              hintText: "Enter Start Location",
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "To",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade100,
                          ),
                          child: TextField(
                            controller: _toEditingController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(203, 203, 203, 1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 100, 210, 1),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.flight_land_outlined,
                                size: 30,
                                color: Color.fromRGBO(0, 100, 210, 1),
                              ),
                              hintText: "Enter End Location",
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Departure Date",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade100,
                          ),
                          child: TextField(
                            controller: _dateEditingController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(203, 203, 203, 1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 100, 210, 1),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  showStyledCalendarBottomSheet(
                                    context,
                                    _dateEditingController,
                                  );
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 30,
                                  color: Color.fromRGBO(0, 100, 210, 1),
                                ),
                              ),
                              hintText: "Enter Date",
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Travelers",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade100,
                          ),
                          child: TextField(
                            controller: _travelersEditingController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(203, 203, 203, 1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 100, 210, 1),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 30,
                                color: Color.fromRGBO(0, 100, 210, 1),
                              ),
                              hintText: "Enter  Travelers count",
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            if (_fromEditingController.text.isNotEmpty &&
                                _toEditingController.text.isNotEmpty &&
                                _dateEditingController.text.isNotEmpty &&
                                _travelersEditingController.text.isNotEmpty) {
                              addFlightData.addData(
                                startLocation: _fromEditingController.text,
                                endLocation: _toEditingController.text,
                                date: _dateEditingController.text,
                                travelers: _travelersEditingController.text,
                              );
                              GetData gd = GetData();
                              gd.fetchFlights(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Searchresult(),
                                ),
                              );
                              setState(() {
                                print(
                                  "###################${company1.userData.length}",
                                );
                                print(
                                  "*******************${company.flightData.length}",
                                );
                                _dateEditingController.clear();
                                _fromEditingController.clear();
                                _toEditingController.clear();
                                _travelersEditingController.clear();
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please Enter All Data"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(0, 100, 210, 1),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Search flights",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              color: Colors.white,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.home,
                    color: const Color.fromRGBO(0, 100, 210, 1),
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Transaction(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  // Floating center button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
