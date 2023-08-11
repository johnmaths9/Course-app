import 'package:course_app/common/apis/course_api.dart';
import 'package:course_app/common/entities/entities.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  late BuildContext context;

  static final HomeController _signleton = HomeController._();
  UserItem get userProfile => Global.storageService.getUserProfile()!;

  factory HomeController({required BuildContext context}) {
    _signleton.context = context;
    return _signleton;
  }

  HomeController._();

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
        }
      }
    }
  }
}
