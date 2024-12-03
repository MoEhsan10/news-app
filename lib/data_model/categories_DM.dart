import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constant_Manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDM {
  String backEndId;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDM({
    required this.backEndId,
    required this.title,
    required this.bgColor,
    required this.imagePath,
  });

 static List<CategoryDM> getCategoriesList() => [
    CategoryDM(backEndId: ConstantManager.sportsBackEndId,
            title: StringManager.sports,
            bgColor: ColorsManager.red,
            imagePath: AssetsManager.sports),
    CategoryDM(backEndId: ConstantManager.generalBackEndId,
        title: StringManager.general,
        bgColor: ColorsManager.darkBlue,
        imagePath: AssetsManager.general),
    CategoryDM(backEndId: ConstantManager.healthBackEndId,
        title: StringManager.health,
        bgColor: ColorsManager.pink,
        imagePath: AssetsManager.health),
    CategoryDM(backEndId: ConstantManager.businessBackEndId,
        title: StringManager.business,
        bgColor: ColorsManager.brown,
        imagePath: AssetsManager.business),
    CategoryDM(backEndId: ConstantManager.entertainmentBackEndId,
        title: StringManager.entertainment,
        bgColor: ColorsManager.lightBLue,
        imagePath: AssetsManager.entertainment),
    CategoryDM(backEndId: ConstantManager.scienceBackEndId,
        title: StringManager.science,
        bgColor: ColorsManager.yellow,
        imagePath: AssetsManager.science),
    CategoryDM(backEndId: ConstantManager.technologyBackEndId,
        title: StringManager.technology,
        bgColor: ColorsManager.green,
        imagePath: AssetsManager.technology),
  ];

}


// 3029f265d1e14dfb8b777a652ef9a831