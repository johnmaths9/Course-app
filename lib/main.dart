import 'package:course_app/common/routes/pages.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/application/application_page.dart';
import 'package:course_app/pages/bloc_providers.dart';
import 'package:course_app/pages/course/course_detail.dart';
import 'package:course_app/pages/sign_in/sign_in_page.dart';
import 'package:course_app/pages/sign_up/sign_up_page.dart';
import 'package:course_app/pages/welcome/bloc/bloc/welcome_bloc.dart';
import 'package:course_app/pages/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/sign_in/bloc/signin_bloc.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          designSize: Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              builder: EasyLoading.init(),
              title: 'Course App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
              ),
              //initialRoute: "/",
              home: const CourseDetail(),
              //onGenerateRoute: AppPages.generateRouteSettings,
              /*routes: {
            "singIn": (context) => const SignInPage(),
            "register": (context) => SignUpPage(),
          },*/
            );
          }),
    );
  }
}
