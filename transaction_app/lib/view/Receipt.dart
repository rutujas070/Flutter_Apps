import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_app/view/Transfer.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<Receipt> createState() => _ReceiptState();
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double radius = 20;
    const double notchRadius = 18;

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
    path.lineTo(0, size.height /2 + notchRadius);
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

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Transfer()),
    );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 30),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Text(
                "Receipt",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipPath(
              clipper: TicketClipper(),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://i.pravatar.cc/150",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Ojaman",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Bank - 0987 3422 8756",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Total", style: TextStyle(color: Colors.grey,fontSize: 17)),
                        Text(
                          "\$450.49",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    Text("Note", style: TextStyle(color: Colors.grey,fontSize: 17)),
                    const SizedBox(height: 10),
                    const Divider(),
                     const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Date Transaction", style: TextStyle(color: Colors.grey,fontSize: 15)),
                        Text(
                          "26 Agu 2021 11:36:26",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                     const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("ID Transaction", style: TextStyle(color: Colors.grey,fontSize: 15)),
                        Container(
                          width: 150,
                          child: Text(
                            "202108260001@DCB199983",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                     const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(children: [
              Text("Categories", style: TextStyle(color: Colors.grey,fontSize: 18)),
              const SizedBox(
                width: 90,
              ),
              Image.asset("assets/HomeImage/Camera.png"),
              const SizedBox(
                width: 20,
              ),
              Text("Equipment", style: TextStyle(color: Colors.black,fontSize: 15)),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ],),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(9, 112, 62, 1),
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              child: Text("Download Invoice",
                  style:GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
