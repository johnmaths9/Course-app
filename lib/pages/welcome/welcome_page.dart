import 'package:course_app/common/values/constants.dart';
import 'package:course_app/global.dart';
import 'package:course_app/pages/sign_in/sign_in_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/bloc/welcome_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    state.page = value;
                    context.read<WelcomeBloc>().add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "Next",
                      "First See Learning",
                      "Forget about a for of paper all knowledge in one learning!",
                      "assets/images/reading.png",
                    ),
                    _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always keep in touch your tutor & friend. let's get connected!",
                      "assets/images/boy.png",
                    ),
                    _page(
                      3,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                      "assets/images/man.png",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: AppColors.primaryThreeElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(12.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              Global.storageService
                  .setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
