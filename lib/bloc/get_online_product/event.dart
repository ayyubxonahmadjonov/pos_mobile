part of 'bloc.dart';

abstract class GetOnlineProductEvent {}

class GetStartOnlineProductEvent extends GetOnlineProductEvent {
  final String productId;

  GetStartOnlineProductEvent(this.productId);
}
