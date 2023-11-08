class Car {
  final String id;
  final String name;
  final String licensePlates;
  final String image;
  final int status;

  Car({
    required this.id,
    required this.name,
    required this.licensePlates,
    required this.image,
    required this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'licensePlates': licensePlates,
      'image': image,
      'status': status,
    };
  }

  // Create a Car object from a JSON map
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      licensePlates: json['licensePlates'],
      image: json['image'],
      status: json['status'],
    );
  }
}
