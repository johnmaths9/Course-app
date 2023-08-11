import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  FutureOr<void> _userNameEvent(
      UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordEvent(
      PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.passowrd));
  }

  FutureOr<void> _rePasswordEvent(
      RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassowrd));
  }
}
