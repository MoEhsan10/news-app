import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/widgets/category_widget.dart';

typedef OnCategoryClicked= void Function(CategoryDM);

class Categories extends StatelessWidget {
  Categories({super.key,required this.onCategoryClicked});

OnCategoryClicked onCategoryClicked;
  List<CategoryDM> categoriesList = CategoryDM.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: AppStyles.picCategory,
          ),
          Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 20.h),
                itemBuilder: (context, index) =>
                    InkWell(
                        onTap: () {
                          onCategoryClicked(categoriesList[index]);
                        },
                        child: CategoryWidget(categoryDM: categoriesList[index], index: index)),
                itemCount: categoriesList.length,
              ))
        ],
      ),
    );
  }
}
