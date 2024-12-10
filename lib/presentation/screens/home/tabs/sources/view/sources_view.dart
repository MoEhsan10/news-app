import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/core/dependancy_Injection.dart';
import 'package:news_app/data_model/categories_DM.dart';
import 'package:news_app/presentation/common/error_state_widget/error_state_widget.dart';
import 'package:news_app/presentation/common/loading_state_widget/loading_state_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widgets/source_tabs.dart';
import 'package:provider/provider.dart';

// m     v     vm
// model view viewmodel
class SourcesView extends StatefulWidget {

  SourcesView({super.key, required this.categoryDM});
  CategoryDM categoryDM;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  var viewModel=SourcesViewModel(sourcesUseCase: getSourcesUseCase());


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
      child: Consumer<SourcesViewModel>(builder: (context, viewModel, child) {
        // if(viewModel.isLoading){
        //   return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
        // }
        // if(viewModel.errorMessage!=null){
        //   return Text(viewModel.errorMessage!);
        // }
        // return SourceTabs(sources:viewModel.source!,);
        var state = viewModel.state;
        switch(state){
          case SuccessState():
            return SourceTabs(sources: state.data);
          case ErrorState():
            return ErrorStateWidget(
              serverError: state.serverError,error: state.error,
              retryText: 'retry',
              retryButtonAction: (){
                viewModel.getSourcesByCategoryId(widget.categoryDM.backEndId??'');
              },
            );

          case LoadingState():
            return LoadingStateWidget(loadingMessage: 'please wait....',);
        }
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