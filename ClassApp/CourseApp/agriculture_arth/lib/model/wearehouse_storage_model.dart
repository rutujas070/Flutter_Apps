class Warehouse {
  String image;
  String location;
  double distance;
  String description;
  double pricePerQuintal;
  double capacity; // total capacity
  double occupied; // current booked

  Warehouse({
    required this.image,
    required this.location,
    required this.distance,
    required this.description,
    required this.pricePerQuintal,
    required this.capacity,
    this.occupied = 0,
  });

  double get occupancyPercent => (occupied / capacity);
}