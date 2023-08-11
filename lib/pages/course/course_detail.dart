import 'package:course_app/common/values/colors.dart';
import 'package:course_app/common/widgets/base_text_widget.dart';
import 'package:course_app/pages/course/widgets/course_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  //late var id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //var id = ModalRoute.of(context)!.settings.arguments as Map;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thumbNail(),
                    SizedBox(
                      height: 15.h,
                    ),
                    menuView(),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusbaleText('Course Description'),
                    SizedBox(
                      height: 15.h,
                    ),
                    descriptionText(),
                    SizedBox(
                      height: 20.h,
                    ),
                    goBuyButton('Go Buy'),
                    SizedBox(
                      height: 15.h,
                    ),
                    courseSummaryTitle(),
                    courseSummaryView(context),
                    SizedBox(
                      height: 20.h,
                    ),
                    reusbaleText('Lesson List'),
                    SizedBox(
                      height: 20.h,
                    ),
                    courseLessonList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
