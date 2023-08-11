import 'dart:convert';

import 'package:course_app/common/apis/user_api.dart';
import 'package:course_app/common/entities/entities.dart';
import 'package:course_app/common/values/constants.dart';
import 'package:course_app/common/widgets/flutter_toast.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/home/home_controller.dart';
import 'package:course_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  Future<void> handleSingIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          toastInfo(msg: "you need to fill email address");
          return;
        }

        if (password.isEmpty) {
          toastInfo(msg: "you need to fill password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          if (credential.user == null) {
            toastInfo(msg: "you don't exist");
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: "you need to verify email account");
            return;
          }

          var user = credential.user;

          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            // type 1 means email login
            loginRequestEntity.type = 1;

            print('user exist');
            await asyncPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseException catch (e) {
          if (e.code == "user-not-found") {
            print("No user found for that email.");
            toastInfo(msg: "No user found for that email");
          } else if (e.code == "wrong-password") {
            print("wrong password provided for that user.");
            toastInfo(msg: "wrong password provided for that user");
          } else if (e.code == "invalid-email") {
            print("your email format is wrong.");
            toastInfo(msg: "your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstant.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstant.STORAGE_USER_TOKEN_KEY, result.data!.access_token);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/application', (route) => false);
        }
      } catch (e) {
        print('saving local storage error ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'unknow error');
    }
  }
}
