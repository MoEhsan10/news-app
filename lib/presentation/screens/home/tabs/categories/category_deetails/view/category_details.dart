import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/view/articles_list_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/viewModel/sources_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/widgets/sources_tab_widget/sources_tab_bar.dart';
import 'package:provider/provider.dart';

// m     v     vm
// model view viewmodel
class CategoryDetails extends StatefulWidget {

   CategoryDetails({super.key, required this.categoryDM});
CategoryDM categoryDM;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
var viewModel=SourcesViewmodel();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.backEndId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
    // the consumer's listen always = true
      child: Consumer<SourcesViewmodel>(builder: (context, value, child) {
          if(viewModel.isLoading){
            return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
          }
          if(viewModel.errorMessage!=null){
            return Text(viewModel.errorMessage!);
          }
          return SourcesTabWidget(sources:viewModel.source!,);
        },
      ),
    );
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