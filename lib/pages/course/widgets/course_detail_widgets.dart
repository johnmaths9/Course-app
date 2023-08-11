import 'package:course_app/common/values/colors.dart';
import 'package:course_app/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusbaleText('Course detail'),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.w),
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage("assets/icons/image_1.png"),
      ),
    ),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reusbaleText(
              "Author Page",
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusbaleText(
          num.toString(),
          color: AppColors.primaryThreeElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        )
      ],
    ),
  );
}

Widget descriptionText() {
  return reusbaleText(
    'Course Description Course Description Course Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description',
    fontSize: 11.sp,
    color: AppColors.primaryThreeElementText,
    fontWeight: FontWeight.normal,
  );
}

Widget goBuyButton(String name) {
  return Container(
    width: 330.w,
    height: 50.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      name,
      style: TextStyle(
          color: AppColors.primaryElementText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget courseSummaryTitle() {
  return reusbaleText("The Course Includes", fontSize: 14.sp);
}

var imageInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Download Resources": "download_detail.png",
};

Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE);
          },
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                    "assets/icons/${imageInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
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

Widget courseLessonList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 1),
        )
      ],
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icons/image_1.png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //list item title
                  _listContainer(),
                  //list item description
                  _listContainer(
                    fontSize: 10,
                    color: AppColors.primaryThreeElementText,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              )
            ],
          ),
          //for showing the right arrow
          Container(
            child: Image(
              width: 24.w,
              height: 24.h,
              image: AssetImage("assets/icons/arrow_right.png"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer(
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}
