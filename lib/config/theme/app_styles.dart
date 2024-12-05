import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppStyles{
  static final TextStyle appBar = GoogleFonts.exo(fontSize: 22.sp,color: ColorsManager.white,fontWeight: FontWeight.w400);
  static final TextStyle drawerTitle = GoogleFonts.poppins(fontSize: 24.sp,color: ColorsManager.white,fontWeight: FontWeight.w700);
  static final TextStyle drawerItem = GoogleFonts.poppins(fontSize: 24.sp,color: ColorsManager.blackAccent,fontWeight: FontWeight.w700);
  static final TextStyle picCategory = GoogleFonts.poppins(fontSize: 22.sp,color: ColorsManager.grey,fontWeight: FontWeight.w700);
  static final TextStyle categoryTitle = GoogleFonts.exo(fontSize: 22.sp,color: ColorsManager.white,fontWeight: FontWeight.w400);
  static final TextStyle sourceName = GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w400,color:const Color(0xFF79828B));
  static final TextStyle articleTitle = GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF42505C));
  static final TextStyle articleDescription = GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w300, color: const Color(0xFF42505C));
  static final TextStyle publishedAt = GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w400, color:const Color(0xFFA3A3A3));
  static final TextStyle selectedLabel = GoogleFonts.exo(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static final TextStyle unselectedLabel = GoogleFonts.exo(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.green);
}