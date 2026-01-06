/*
    @author Suxrob Sattorov, 7/28/2025, 10:28 AM
*/

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.color,
    required this.phoneNumber,
    required this.passCode,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? image;
  final String? color;
  final String? phoneNumber;
  final String? passCode;

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      image: json["image"],
      color: json["color"],
      phoneNumber: json["phone_number"],
      passCode: json["pass_code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "color": color,
        "phone_number": phoneNumber,
        "pass_code": passCode,
      };
}
