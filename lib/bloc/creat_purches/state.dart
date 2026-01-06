part of 'bloc.dart';

abstract class CreatPurchesOrderState {}

class CreatPurchesOrderInitial extends CreatPurchesOrderState {}

class CreatPurchesOrderProccesState extends CreatPurchesOrderState {}

class CreatPurchesOrderSuccesState extends CreatPurchesOrderState {}

class CreatPurchesOrderFailure extends CreatPurchesOrderState {}
