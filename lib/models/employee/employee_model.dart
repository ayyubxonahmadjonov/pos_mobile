/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:18:47

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
part 'employee_model.g.dart';

@HiveType(typeId: HiveTypes.employee, adapterName: HiveAdapters.employeeAdapter)
class Employee extends HiveObject {
  Employee({
    UiLanguage? uiLanguage,
    bool? isBoss,
    String? service,
    bool? isActive,
    int? percentage,
    bool? isPassword,
    String? password,
    String? role,
    String? fullName,
    String? name,
    String? email,
    String? lastName,
    bool? isPhoneNumber,
    String? token,
    String? fireToken,
    String? imageUrl,
    String? id,
    List<EmployeeService>? services,
    String? phoneNumber,
    String? organization,
    String? createdAt,
    String? updatedAt,
    int? v,
    AccessModel? access,
  }) {
    _uiLanguage = uiLanguage;
    _isBoss = isBoss;
    _service = service;
    _isActive = isActive;
    _percentage = percentage;
    _isPassword = isPassword;
    _password = password;
    _role = role;
    _fullName = fullName;
    _name = name;
    _email = email;
    _lastName = lastName;
    _isPhoneNumber = isPhoneNumber;
    _token = token;
    _fireToken = fireToken;
    _imageUrl = imageUrl;
    _id = id;
    _services = services;
    _phoneNumber = phoneNumber;
    _organization = organization;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _access = access;
  }

  Employee.fromJson(dynamic json) {
    _uiLanguage = json['ui_language'] != null
        ? UiLanguage.fromJson(json['ui_language'])
        : null;
    _isBoss = json['is_boss'];
    _service = json['service'];
    _isActive = json['is_active'];
    _percentage = json['percentage'];
    _isPassword = json['is_password'];
    _password = json['password'].toString();
    _role = json['role'];
    _fullName = json['full_name'];
    _name = json['name'];
    _email = json['email'];
    _lastName = json['last_name'];
    _isPhoneNumber = json['is_phone_number'];
    _token = json['token'];
    _fireToken = json['fire_token'];
    _imageUrl = json['image_url'];
    _id = json['_id'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(EmployeeService.fromJson(v));
      });
    }
    _phoneNumber = json['phone_number'];
    _organization = json['organization'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _access =
        json['access'] != null ? AccessModel.fromJson(json['access']) : null;
  }

  @HiveField(0)
  UiLanguage? _uiLanguage;

  @HiveField(1)
  bool? _isBoss;

  @HiveField(2)
  String? _service;

  @HiveField(3)
  bool? _isActive;

  @HiveField(4)
  int? _percentage;

  @HiveField(5)
  bool? _isPassword;

  @HiveField(6)
  String? _password;

  @HiveField(23)
  String? _role;

  @HiveField(7)
  String? _fullName;

  @HiveField(8)
  String? _name;

  @HiveField(9)
  String? _email;

  @HiveField(10)
  String? _lastName;

  @HiveField(11)
  bool? _isPhoneNumber;

  @HiveField(12)
  String? _token;

  @HiveField(13)
  String? _fireToken;

  @HiveField(14)
  String? _imageUrl;

  @HiveField(15)
  String? _id;

  @HiveField(16)
  List<EmployeeService>? _services;

  @HiveField(17)
  String? _phoneNumber;

  @HiveField(18)
  String? _organization;

  @HiveField(19)
  String? _createdAt;

  @HiveField(20)
  String? _updatedAt;

  @HiveField(21)
  int? _v;

  @HiveField(22)
  AccessModel? _access;

  Employee copyWith({
    UiLanguage? uiLanguage,
    bool? isBoss,
    String? service,
    bool? isActive,
    int? percentage,
    bool? isPassword,
    String? password,
    String? role,
    String? fullName,
    String? name,
    String? email,
    String? lastName,
    bool? isPhoneNumber,
    String? token,
    String? fireToken,
    String? imageUrl,
    String? id,
    List<EmployeeService>? services,
    String? phoneNumber,
    String? organization,
    String? createdAt,
    String? updatedAt,
    int? v,
    AccessModel? access,
  }) =>
      Employee(
        uiLanguage: uiLanguage ?? _uiLanguage,
        isBoss: isBoss ?? _isBoss,
        service: service ?? _service,
        isActive: isActive ?? _isActive,
        percentage: percentage ?? _percentage,
        isPassword: isPassword ?? _isPassword,
        password: password ?? _password,
        role: role ?? _role,
        fullName: fullName ?? _fullName,
        name: name ?? _name,
        email: email ?? _email,
        lastName: lastName ?? _lastName,
        isPhoneNumber: isPhoneNumber ?? _isPhoneNumber,
        token: token ?? _token,
        fireToken: fireToken ?? _fireToken,
        imageUrl: imageUrl ?? _imageUrl,
        id: id ?? _id,
        services: services ?? _services,
        phoneNumber: phoneNumber ?? _phoneNumber,
        organization: organization ?? _organization,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        access: access ?? _access,
      );

  UiLanguage? get uiLanguage => _uiLanguage;

  bool? get isBoss => _isBoss;

  String? get service => _service;

  bool? get isActive => _isActive;

  int? get percentage => _percentage;

  bool? get isPassword => _isPassword;

  String? get password => _password;

  String? get role => _role;

  String? get fullName => _fullName;

  String? get name => _name;

  String? get email => _email;

  String? get lastName => _lastName;

  bool? get isPhoneNumber => _isPhoneNumber;

  String? get token => _token;

  String? get fireToken => _fireToken;

  String? get imageUrl => _imageUrl;

  String get id => _id ?? "";

  List<EmployeeService>? get services => _services;

  String? get phoneNumber => _phoneNumber;

  String? get organization => _organization;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get v => _v;

  AccessModel? get access => _access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_uiLanguage != null) {
      map['ui_language'] = _uiLanguage?.toJson();
    }
    map['is_boss'] = _isBoss;
    map['service'] = _service;
    map['is_active'] = _isActive;
    map['percentage'] = _percentage;
    map['is_password'] = _isPassword;
    map['password'] = _password;
    map['role'] = _role;
    map['full_name'] = _fullName;
    map['name'] = _name;
    map['email'] = _email;
    map['last_name'] = _lastName;
    map['is_phone_number'] = _isPhoneNumber;
    map['token'] = _token;
    map['fire_token'] = _fireToken;
    map['image_url'] = _imageUrl;
    map['_id'] = _id;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    map['phone_number'] = _phoneNumber;
    map['organization'] = _organization;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    if (_access != null) {
      map['access'] = _access?.toJson();
    }
    return map;
  }

  @override
  get key => _id;

  String getFullName() {
    String name = _name ?? '';
    String lastname = _lastName ?? '';
    return '$name $lastname';
  }

  @override
  String toString() {
    return "Employee: ${getFullName()}";
  }
}
