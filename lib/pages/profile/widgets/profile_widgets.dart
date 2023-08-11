import 'package:course_app/common/routes/names.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusbaleText("Profile"),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    alignment: Alignment.bottomRight,
    child: Image(
      height: 25.h,
      width: 25.w,
      image: AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png"
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                      "assets/icons/${imageInfo.values.elementAt(index)}"),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
