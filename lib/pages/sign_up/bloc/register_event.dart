part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;
  const UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String passowrd;
  const PasswordEvent(this.passowrd);
}

class RePasswordEvent extends RegisterEvent {
  final String rePassowrd;
  const RePasswordEvent(this.rePassowrd);
}
