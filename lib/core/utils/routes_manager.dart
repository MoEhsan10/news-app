import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/aritcle_details/articles_details.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/view/category_details.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';
  static const String articleDetails='/articleDetails';


  static Route? router(RouteSettings setting){
    switch(setting.name){
      case splash:
        return MaterialPageRoute(builder: (context) => Splash(),);
      case home:
        return MaterialPageRoute(builder: (context) => Home(),);
      case articleDetails:
        return MaterialPageRoute(
          settings: setting,
          builder: (context) => ArticlesDetails(),);
      // case categoryDetails:
      //   return MaterialPageRoute(builder: (context) => CategoryDetails(categoryDM: ,);
    }
  }
}