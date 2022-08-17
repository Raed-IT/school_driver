import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class ThemeAppData {
  static ThemeData themeData = ThemeData(
    fontFamily: "font_app",
    scaffoldBackgroundColor: AppColors.SCAFFOLD_COLOR,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.PRIMARY_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.sp),
          bottomRight: Radius.circular(20.sp),
        ),
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 23.sp,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
        color: AppColors.TITLE_COLOR,
      ),
      headline2: TextStyle(fontSize: 17.sp, color: AppColors.HEAD2_COLOR),
      headline3: TextStyle(fontSize: 12.sp, color: AppColors.LABLE_COLOR),
    ),
  );
}
