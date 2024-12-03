import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/categories_DM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDM categoryDM;
  int index;

  CategoryWidget({super.key, required this.categoryDM, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
              bottomLeft: Radius.circular(index.isEven ? 25.r : 0.r),
              bottomRight: Radius.circular(index.isEven ? 0.r : 25.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            categoryDM.imagePath,
            width: 142.w,
            height: 126.h,
          ),
          Text(
            categoryDM.title,
            style: AppStyles.categoryTitle,
          )
        ],
      ),
    );
  }
}
