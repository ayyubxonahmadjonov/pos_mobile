part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  LoginResponseModel loginResponseModel;
  AuthLoginSuccessState({required this.loginResponseModel});
}

class AuthLoginFailedState extends AuthState {
  final String error;
  AuthLoginFailedState(this.error);
}

class SelectCompanyLoadingState extends AuthState {}

class SelectCompanySuccessState extends AuthState {}

class SelectCompanyFailedState extends AuthState {
  final String error;
  SelectCompanyFailedState(this.error);
}

class SelectShopLoadingState extends AuthState {}

class SelectShopSuccessState extends AuthState {}

class SelectShopFailedState extends AuthState {
  final String error;
  SelectShopFailedState(this.error);
}

