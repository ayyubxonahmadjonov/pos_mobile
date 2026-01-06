part of 'flash_bloc.dart';

@immutable
abstract class FlashEvent {}

class FlashLightEvent extends FlashEvent {
  final bool isLight;
  FlashLightEvent(this.isLight);
}