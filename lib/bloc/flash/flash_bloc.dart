/*
    Created by: Bahromjon Po'lat.
    Created date: 31/08/2022 17:16
*/

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flash_event.dart';
part 'flash_state.dart';

class FlashBloc extends Bloc<FlashEvent, FlashState> {
  FlashBloc() : super(FlashState(false)) {
    on<FlashLightEvent>((event, emit) {
      emit(FlashState(event.isLight));
    });
  }
}
