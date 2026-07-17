class FarmerProductModel {
  final String id;
  final String name;
  final String description;
  final String quantity;
  final String quality;
  final String price;
  final String date;
  final String location;
  final String imageUrl;

  FarmerProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.quality,
    required this.price,
    required this.date,
    required this.location,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "quantity": quantity,
      "quality": quality,
      "price": price,
      "date": date,
      "location": location,
      "imageUrl": imageUrl,
    };
  }
}
