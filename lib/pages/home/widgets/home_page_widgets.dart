import 'package:course_app/common/entities/course.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:course_app/common/values/constants.dart';
import 'package:course_app/pages/home/bloc/home_page_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(avatar),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "search your course",
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                autocorrect: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ],
  );
}

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 400.w,
        height: 180.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 400.w,
    height: 180.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 400.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reusbaleText("Choose your course"),
            GestureDetector(
              onTap: () {
                //click
              },
              child: reusbaleText("See all",
                  color: AppColors.primaryThreeElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusbaleMenuText("All"),
            _reusbaleMenuText("Popular",
                textColor: AppColors.primaryThreeElementText,
                bgColor: Colors.white),
            _reusbaleMenuText("Newest",
                textColor: AppColors.primaryThreeElementText,
                bgColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reusbaleMenuText(
  String menuText, {
  Color textColor = AppColors.primaryElementText,
  Color bgColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
    ),
    child: reusbaleText(
      menuText,
      color: textColor,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget courseGrid(CourseItem courseItem) {
  return Container(
    padding: EdgeInsets.all(12.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          courseItem.name!,
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          courseItem.description!,
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            AppConstant.SERVER_API_URL + 'uploads/' + courseItem.thumbnail!),
      ),
    ),
  );
}
