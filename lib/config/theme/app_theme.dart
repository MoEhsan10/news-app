import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      color: ColorsManager.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.white, // Change the side menu icon color here
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.white,
    ),
  );
}
