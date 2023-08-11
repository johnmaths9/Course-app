import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  FutureOr<void> _triggerSettings(
      TriggerSettings event, Emitter<SettingsState> emit) {
    emit(SettingsState());
  }
}
