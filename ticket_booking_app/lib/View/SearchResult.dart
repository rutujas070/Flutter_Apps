import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/Controller/GetData.dart';
import 'package:ticket_booking_app/View/BookingDetails.dart';
import 'package:ticket_booking_app/View/Home.dart';

class Searchresult extends StatefulWidget {
  const Searchresult({super.key});

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    final company = context.watch<Companay>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ),
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
          Expanded(
            child: ListView.builder(             
              shrinkWrap: true,
              itemCount: company.flightData.length,
              itemBuilder: (context, index) {
                if (company.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (company.flightData.isEmpty) {
                  return const Center(child: Text("No flights available"));
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipPath(
                    clipper: TicketClipper(),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bookingdetails(),
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        //  height: 600,
                        width: double.infinity,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  Provider.of<Companay>(
                                    context,
                                  ).flightData[index].startLocation,
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 0),
                                Image.asset("assets/Other/p.png"),
                                const SizedBox(width: 0),
                                Text(
                                  Provider.of<Companay>(
                                    context,
                                  ).flightData[index].endLocation,
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // const SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  "New York",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "23:00 hours",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Da Nang",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                // const SizedBox(
                                //       width: 20,
                                //     ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  "8:00 AM",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "7:30 AM",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),

                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  Provider.of<Companay>(
                                    context,
                                  ).flightData[index].date,
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "August 28, 2021",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(indent: 0, endIndent: 0, height: 2),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                // const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/Signup_Icons/Apple.png",
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Qatar Airway",
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "\$30",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double radius = 20;
    const double notchRadius = 18;
    // final double notchCenterY = size.height * 0.65;

    path.moveTo(radius, 0);

    // Top
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right side notch
    path.lineTo(size.width, size.height / 2 - notchRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );

    // Bottom
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Left side notch
    path.lineTo(0, size.height / 2 + notchRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 - notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
