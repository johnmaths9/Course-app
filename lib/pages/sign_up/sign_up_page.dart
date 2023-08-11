import 'package:course_app/pages/sign_up/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField("Enter your user name", 'name', "user",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField("Enter your Email", 'email', "user",
                            (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your Password", 'password', "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        reusableText("Confirm Password"),
                        buildTextField(
                            "Enter your Confirm Password", 'password', "lock",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                        }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: reusableText(
                              "By creating account you have to agree with our them & condication"),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildLogInAndRegButton("Sign Up", "login", () {
                          RegisterController(context: context)
                              .handleEmailRegister();
                          //Navigator.of(context).pushNamed('register');
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
