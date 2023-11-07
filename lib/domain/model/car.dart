class Car {
  final String id;
  final String name;
  final String licensePlates;
  final String image;

  Car({
    required this.id,
    required this.name,
    required this.licensePlates,
    required this.image,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'licensePlates': licensePlates,
      'image': image,
    };
  }

  // Create a Car object from a JSON map
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      licensePlates: json['licensePlates'],
      image: json['image'],
    );
  }
}
