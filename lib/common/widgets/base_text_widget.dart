import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusbaleText(String text,
    {Color color = AppColors.primaryText,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    ),
  );
}
