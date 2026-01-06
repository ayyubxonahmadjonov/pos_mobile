part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String phone;
  final String password;
  AuthLoginEvent(this.phone, this.password);
}

class SelectCompanyEvent extends AuthEvent {
  final String companyId;
  SelectCompanyEvent(this.companyId);
}

class SelectShopEvent extends AuthEvent {
   MainShop? selectedShop;
  SelectShopEvent({required this.selectedShop});
}

