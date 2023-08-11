part of 'signin_bloc.dart';

@immutable
class SigninState {
  final String email;
  final String password;

  const SigninState({this.email = "", this.password = ""});

  SigninState copyWith({String? email, String? password}) {
    return SigninState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
