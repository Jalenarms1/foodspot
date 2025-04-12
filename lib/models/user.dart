class User {
  final String? id;
  final String name;
  final String email;
  final String? phoneNumber;
  final bool isVerified;

  User({
    this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.isVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      isVerified: json["is_verified"],
    );
  }
}
