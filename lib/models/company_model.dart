class CompanyModel {
  final String id;
  final String name;
  final bool isValidated;

  CompanyModel({
    required this.id,
    required this.name,
    required this.isValidated,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      isValidated: json['is_validated'],
    );
  }
}

class LoginResponseModel {
  final List<CompanyModel> companies;
  final bool isVerified;
  final String step;
  final String tempToken;

  LoginResponseModel({
    required this.companies,
    required this.isVerified,
    required this.step,
    required this.tempToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      companies: (json['companies'] as List)
          .map((e) => CompanyModel.fromJson(e))
          .toList(),
      isVerified: json['is_verified'],
      step: json['step'],
      tempToken: json['temp_token'],
    );
  }
}
