class Machine {
  final String title;
  final String image;
  final String price;
  final String rating;
  final String tag;

  Machine({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.tag,
  });
}


class MachineModel {
  String? id; // ✅ optional

  String name;
  String description;
  String price;
  String location;
  String imageUrl;

  MachineModel({
    this.id, // ✅ not required
    required this.name,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrl,
  });

  /// 🔥 TO MAP (for Firestore save)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "location": location,
      "imageUrl": imageUrl,
    };
  }

  /// 🔥 FROM FIRESTORE
  factory MachineModel.fromMap(String id, Map<String, dynamic> map) {
    return MachineModel(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      location: map['location'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}