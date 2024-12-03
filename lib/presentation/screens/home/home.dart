import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/home_Drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late Widget selectedWidget;
 String appBarTitle ='News App';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget= Categories(onCategoryClicked: OnCategoryClicked,);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.bgPattern),
         fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle,style: AppStyles.appBar,),
          centerTitle: true,
        ),
        drawer: HomeDrawer(onMenuItemClicked: onMenuItemClicked,),
      body: selectedWidget,
      ),
    );
  }

  // void onMenuItemClicked(int pos){
  //   Navigator.pop(context);
  //   if(pos==HomeDrawer.categories){
  //     selectedWidget=Categories();
  //   }else if(pos==HomeDrawer.settings){
  //     selectedWidget=Settings();
  //   }else{
  //
  //   }
  //   setState(() {
  //
  //   });
  // }

void OnCategoryClicked(CategoryDM categoryDM){
    selectedWidget=CategoryDetails(categoryDM: categoryDM);
    appBarTitle=categoryDM.title;
    setState(() {

    });
}

void onMenuItemClicked(MenuItem item){
    switch(item){
      case MenuItem.categories:
        selectedWidget=Categories(onCategoryClicked: OnCategoryClicked,);
        appBarTitle='News App';
      case MenuItem.settings:
        appBarTitle='News App';
        selectedWidget= Settings();
    }
    Navigator.pop(context);
    setState(() {

    });
}
}
