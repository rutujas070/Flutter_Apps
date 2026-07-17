import 'package:agriculture_arth/model/role_model.dart';
import 'package:flutter/material.dart';


class RoleController {

  List<RoleModel> getRoles() {
    return [

      RoleModel(
        title: "Farmer",
        description:
            "Manage harvests, optimize field transport, and connect with global buyers directly.",
        icon: Icons.agriculture,
        bgColor: Color(0xFFB1F0CE),
      ),

      RoleModel(
        title: "Buyer / Exporter",
        description:
            "Source premium produce, track shipment origin, and manage procurement logistics.",
        icon: Icons.storefront,
        bgColor: Color(0xFFFAB890),
      ),

      RoleModel(
        title: "Logistics Provider",
        description:
            "Access high-efficiency routing data, manage fleets, and optimize last-mile delivery.",
        icon: Icons.local_shipping,
        bgColor: Color(0xFF95D4B3),
      ),

      RoleModel(
        title: "Government Authority",
        description:
            "Monitor regional trade flows, ensure compliance, and oversee agricultural growth metrics.",
        icon: Icons.account_balance,
        bgColor: Color(0xFFE5C099),
      ),

      RoleModel(
        title: "MSME / Bank",
        description:
            "Facilitate agricultural financing, trade credits, and verify supply chain reliability.",
        icon: Icons.payments,
        bgColor: Color(0xFFFDBB93),
      ),
    ];
  }
}