import 'package:course_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:course_app/pages/sign_up/bloc/register_bloc.dart';
import 'package:course_app/pages/welcome/bloc/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SigninBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
