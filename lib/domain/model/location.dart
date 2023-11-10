class Location {
  final String id;
  final String name;
  final String address;

  Location({
    required this.id,
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      address: json['address'],
    );
  }
}
