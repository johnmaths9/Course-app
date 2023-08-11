part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {
  const SigninEvent();
}

class EmailEvent extends SigninEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SigninEvent {
  final String password;
  const PasswordEvent(this.password);
}
