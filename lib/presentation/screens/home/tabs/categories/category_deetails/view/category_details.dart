import 'package:flutter/material.dart';
import 'package:news_app/core/dependancy_Injection.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/view/sources_view.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';

// m     v     vm
// model view viewmodel
class CategoryDetails extends StatelessWidget {

   CategoryDetails({super.key, required this.categoryDM});
CategoryDM categoryDM;

var viewModel=SourcesViewModel(sourcesUseCase: getSourcesUseCase());

  @override
  Widget build(BuildContext context) {
    return SourcesView(categoryDM: categoryDM);
  }
}
















// return  FutureBuilder(future: ApiManager.getSources(categoryDM.backEndId),
//   builder: (context, snapshot) {
//   if(snapshot.connectionState==ConnectionState.waiting){
//     return const Center(
//       child: CircularProgressIndicator(color: ColorsManager.green,),
//     );
//   }if(snapshot.data?.status=='error' || snapshot.hasError){
//     return Text(snapshot.data?.message ?? 'check internet connection');
//   }
//   List<Source> sources =snapshot.data!.sources!;
//   return SourcesTabWidget(sources:sources,);
//
// },);