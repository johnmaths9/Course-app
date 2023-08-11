import 'package:course_app/common/values/constants.dart';
import 'package:course_app/common/widgets/flutter_toast.dart';
import 'package:course_app/pages/sign_up/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Passowrd can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Confirm Password can't be empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstant.SERVER_API_URL}uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "an email has been sent to your registered email. To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "The email is invalid");
      }
    }
  }
}
