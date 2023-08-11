import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
