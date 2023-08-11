import 'package:course_app/common/routes/names.dart';
import 'package:course_app/common/values/constants.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/application/bloc/app_bloc.dart';
import 'package:course_app/pages/home/bloc/home_page_bloc.dart';
import 'package:course_app/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    context.read<HomePageBloc>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [
                    settingsButton(context, removeUserData),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
