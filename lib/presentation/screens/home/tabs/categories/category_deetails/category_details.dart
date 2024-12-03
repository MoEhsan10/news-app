import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/widgets/sources_tab_widget/sources_tab_bar.dart';

// m     v     vm
// model view viewmodel
class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key, required this.categoryDM});
CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(future: ApiManager.getSources(categoryDM.backEndId),
      builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(color: ColorsManager.green,),
        );
      }if(snapshot.data?.status=='error' || snapshot.hasError){
        return Text(snapshot.data?.message ?? 'check internet connection');
      }
      List<Source> sources =snapshot.data!.sources!;
      return SourcesTabWidget(sources:sources,);

    },);
  }

}
