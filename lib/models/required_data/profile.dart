/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 1/14/2025, 11:21 AM
*/

class Profile {
  String? firstName;
  String? lastName;
  String? image;
  String? color;
  String? modeId;
  String? theme;
  String? passcode;
  String? color1;
  String? verifyId;
  String? companyId;
  String? userId;
  bool? isTaxActive;
  String? userStatus;

  Profile(
      {this.firstName,
      this.lastName,
      this.image,
      this.color,
      this.modeId,
      this.theme,
      this.passcode,
      this.color1,
      this.verifyId,
      this.companyId,
      this.userId,
      this.isTaxActive,
      this.userStatus});

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    color = json['color'];
    modeId = json['mode_id'];
    theme = json['theme'];
    passcode = json['passcode'];
    color1 = json['color1'];
    verifyId = json['verify_id'];
    companyId = json['company_id'];
    userId = json['user_id'];
    isTaxActive = json['is_tax_active'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['color'] = color;
    data['mode_id'] = modeId;
    data['theme'] = theme;
    data['passcode'] = passcode;
    data['color1'] = color1;
    data['verify_id'] = verifyId;
    data['company_id'] = companyId;
    data['user_id'] = userId;
    data['is_tax_active'] = isTaxActive;
    data['user_status'] = userStatus;
    return data;
  }
}
