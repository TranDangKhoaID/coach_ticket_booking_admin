class Driver {
  String id;
  final String fullName;
  final String email;
  final String phone;
  final String drivingLicense;
  final String image;
  final String imageFrontID;
  final String imageBackSideID;
  final int status;

  Driver({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.drivingLicense,
    required this.image,
    required this.imageFrontID,
    required this.imageBackSideID,
    required this.status,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      drivingLicense: json['drivingLicense'],
      image: json['image'],
      imageFrontID: json['imageFrontID'],
      imageBackSideID: json['imageBackSideID'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'drivingLicense': drivingLicense,
      'image': image,
      'imageFrontID': imageFrontID,
      'imageBackSideID': imageBackSideID,
      'status': status,
    };
  }
}
