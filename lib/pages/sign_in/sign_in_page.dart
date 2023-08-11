import 'package:course_app/pages/sign_in/widgets/sign_in_controller.dart';
import '../common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/signin_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        buildTextField("Enter your Email", 'email', "user",
                            (value) {
                          context.read<SigninBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your Password", 'password', "lock", (value) {
                          context.read<SigninBloc>().add(PasswordEvent(value));
                        }),
                        forgetPassword(),
                        SizedBox(
                          height: 80.h,
                        ),
                        buildLogInAndRegButton("Log In", "login", () {
                          print("login btn");
                          SignInController(context: context)
                              .handleSingIn('email');
                        }),
                        buildLogInAndRegButton("Sign Up", "register", () {
                          Navigator.of(context).pushNamed('register');
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
