import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1,
      ),
      preferredSize: const Size.fromHeight(1),
    ),
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h, top: 5.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 12.w),
          width: 16.w,
          height: 16.h,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 280.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget password",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(
    String buttonName, String typeButton, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: typeButton == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
            color: typeButton == "login"
                ? Colors.transparent
                : AppColors.primaryFourElementText),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.1))
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            color: typeButton == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
