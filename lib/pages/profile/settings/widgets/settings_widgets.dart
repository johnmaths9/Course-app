import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
        child: reusbaleText("Settings"),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm logout"),
            content: Text("Confirm logout"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: func,
                child: Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}
