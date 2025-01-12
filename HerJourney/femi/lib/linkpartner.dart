import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert'; // For JSON encoding
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart'; // For HTTP requests


class PartnerNotificationScreen extends StatefulWidget {
  const PartnerNotificationScreen({super.key});

  @override
  _PartnerNotificationScreenState createState() =>
      _PartnerNotificationScreenState();
}

class _PartnerNotificationScreenState extends State<PartnerNotificationScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission(); // Request notification permissions
  }

  /// Send a notification to the partner using Firebase Cloud Messaging
  Future<void> sendNotificationToPartner(
      String partnerToken, String mobile) async {
    const String serverKey =
        "wNbk76i5zKhLIGuk5qed4Ng4TwjL-mBP90Rg-AZQEJA"; // Replace with your Firebase Cloud Messaging Server Key
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final body = {
      "to": partnerToken,
      "notification": {
        "title": "New Mobile Linked",
        "body": "The mobile number $mobile has been linked to your account.",
      },
      "data": {
        "mobile": mobile,
        "type": "link_notification",
      },
    };

    try {
      final response =
          await http.post(url, headers: headers, body: json.encode(body));
      if (response.statusCode == 200) {
        print("Notification sent successfully.");
      } else {
        print("Failed to send notification. Error: ${response.body}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  /// Link the entered mobile number with a partner and send a notification
  Future<void> linkMobileWithPartner() async {
    final mobile = _mobileController.text.trim();

    if (mobile.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your partner will accept the request for paring')),
      );
      return;
    }

    try {
      // Firestore query to find the partner with the entered mobile number
      final QuerySnapshot partnerSnapshot = await FirebaseFirestore.instance
          .collection('partners') // Firestore collection name
          .where('mobile', isEqualTo: mobile) // Field to match mobile number
          .get();

      if (partnerSnapshot.docs.isNotEmpty) {
        final partnerData = partnerSnapshot.docs.first.data() as Map<String, dynamic>;
        final String? partnerToken = partnerData['fcmToken'];

        if (partnerToken != null && partnerToken.isNotEmpty) {
          await sendNotificationToPartner(partnerToken, mobile);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notification sent to the partner.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Partner does not have a valid FCM token.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No partner found for this mobile number.')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while linking the partner.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.pink, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child:Text(
                        'Femi for Partners',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize:30,
                          color:Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text("Share your pairing code",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Text("Your partner will receive a link to ",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                      ),
                    ),
                    Center(
                      child: Text("download the femi app. He'll then use ",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                      ),
                    ),
                    Center(
                      child: Text("the code to pair your profiles",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                      ),
                    ),
                    const SizedBox(height: 20,),
             Container(
              height: 80,
              width: 380,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Center(
                child: Text("R51XXD",
                        style: GoogleFonts.quicksand(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        ),
              ), 
             ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.pink)
                  ),
                  onPressed: linkMobileWithPartner,
                  child: Text('Send pairing code',
                  style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
        
              const SizedBox(height: 20,),
              Center(
                      child: Text("Your personal data is important. Only ",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                      ),
                    ),
                    Center(
                      child: Text("share it with a trusted, responsible partner.",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                      ),
                    ),
                    
                   Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 300,
                          width: 300,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child:
                              LottieBuilder.asset("assets/animation/partner.json"),
                        ),
                      ), 
        
            ],
          ),
             ),
      ),
);
}
}