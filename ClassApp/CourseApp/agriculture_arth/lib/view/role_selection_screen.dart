import 'package:agriculture_arth/controller/role_controller.dart';
import 'package:agriculture_arth/model/role_model.dart';
import 'package:flutter/material.dart';


class RoleSelectionScreen extends StatelessWidget {

  final RoleController controller = RoleController();

  @override
  Widget build(BuildContext context) {

    List<RoleModel> roles = controller.getRoles();

    return Scaffold(

      /// 🔝 App Bar (Header)
      appBar: AppBar(
        backgroundColor: Colors.green.shade50.withOpacity(0.8),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.agriculture, color: Colors.green[900]),
            SizedBox(width: 8),
            Text(
              "A.R.T.H",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            )
          ],
        ),
        actions: [
          Icon(Icons.translate, color: Colors.green[700]),
          SizedBox(width: 10)
        ],
      ),

      /// 🧾 Body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔷 Title Section
            Text(
              "Choose Your Role",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002D1C),
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Select how you want to use the platform to customize your experience and routing dashboard.",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 20),

            /// 🔷 Role Cards
            ...roles.map((role) => roleCard(role)).toList(),

            SizedBox(height: 30),

            /// 🌄 Footer Image
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDwdwspsa2JY-dT0_wV8fUGDb6g42xJrC2wjZEhHVlWFonGURrd7kSZ7R6Ceg_MyPjIczrrNz7jN_fSTrXjop6UqFwqC3MnXv0m6SVKaCOoo-Rb7-FYsssq4DeV8XXlkGdQDHEW_z5McDmN3vdkxUOkJmKDiMuAD7S_wVOpohu8t506zAzypRtTZu5jJIUKbBvBNX5v7CJuaUzcI8yZaLGWX2kneodsr7HQnVYr4gw9OfmX78GKWGssybp4yIG7Iz8ghu8kpeK-mD8"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.darken),
                ),
              ),
            ),

            SizedBox(height: 30),

            /// 🔻 Footer
            // Center(
            //   child: Text.rich(
            //     TextSpan(
            //       text: "Need help deciding? ",
            //       style: TextStyle(color: Colors.grey),
            //       children: [
            //         TextSpan(
            //           text: "Contact Support",
            //           style: TextStyle(
            //             color: Colors.orange,
            //             decoration: TextDecoration.underline,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  /// 🎯 Role Card Widget
  Widget roleCard(RoleModel role) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [

          /// Icon Box
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: role.bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(role.icon, size: 30),
          ),

          SizedBox(width: 16),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF002D1C),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  role.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),

          /// Arrow
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}