import 'package:course_app/common/routes/names.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/application/application_page.dart';
import 'package:course_app/pages/application/bloc/app_bloc.dart';
import 'package:course_app/pages/course/bloc/course_detail_bloc.dart';
import 'package:course_app/pages/home/bloc/home_page_bloc.dart';
import 'package:course_app/pages/home/home_page.dart';
import 'package:course_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:course_app/pages/profile/settings/settings_page.dart';
import 'package:course_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:course_app/pages/sign_in/sign_in_page.dart';
import 'package:course_app/pages/sign_up/bloc/register_bloc.dart';
import 'package:course_app/pages/sign_up/sign_up_page.dart';
import 'package:course_app/pages/welcome/bloc/bloc/welcome_bloc.dart';
import 'package:course_app/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/course/course_detail.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignInPage(),
        bloc: BlocProvider(create: (_) => SigninBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const SignUpPage(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS_PAGE,
        page: const SettingsPage(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
      PageEntity(
        route: AppRoutes.COURSE_DETAIL,
        page: const CourseDetail(),
        bloc: BlocProvider(create: (_) => CourseDetailBloc()),
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print(settings.name);
    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
  }
}

// Blocs & Routes & Pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
