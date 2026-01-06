part of 'bloc.dart';

abstract class CreatPurchesOrderEvent {}

class GetStartCreatPurchesOrderEvent extends CreatPurchesOrderEvent {
  final Purchase purchase;
  GetStartCreatPurchesOrderEvent(this.purchase);
}
