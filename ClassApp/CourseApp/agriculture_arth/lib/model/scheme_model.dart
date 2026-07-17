class Scheme {
  String id; // Firestore doc id
  String title;
  String type; // loan, subsidy, insurance, disaster, equipment
  String description;

  double? amount; // for loan or compensation
  double? interestRate; // for loan
  int? tenure; // months

  double? subsidyPercent; // for subsidy schemes
  String? equipmentType; // drip, solar, tractor

  String? disasterType; // flood, rain, drought

  List<String> eligibility; // list of conditions
  String provider; // Bank/Government name

  DateTime createdAt;

  Scheme({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.eligibility,
    required this.provider,
    required this.createdAt,

    this.amount,
    this.interestRate,
    this.tenure,
    this.subsidyPercent,
    this.equipmentType,
    this.disasterType,
  });

  // 🔹 Convert to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type,
      "description": description,
      "amount": amount,
      "interestRate": interestRate,
      "tenure": tenure,
      "subsidyPercent": subsidyPercent,
      "equipmentType": equipmentType,
      "disasterType": disasterType,
      "eligibility": eligibility,
      "provider": provider,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  // 🔹 Create from Firestore
  factory Scheme.fromMap(Map<String, dynamic> map, String docId) {
    return Scheme(
      id: docId,
      title: map["title"] ?? "",
      type: map["type"] ?? "",
      description: map["description"] ?? "",
      amount: (map["amount"] ?? 0).toDouble(),
      interestRate: (map["interestRate"] ?? 0).toDouble(),
      tenure: map["tenure"],
      subsidyPercent: (map["subsidyPercent"] ?? 0).toDouble(),
      equipmentType: map["equipmentType"],
      disasterType: map["disasterType"],
      eligibility: List<String>.from(map["eligibility"] ?? []),
      provider: map["provider"] ?? "",
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}