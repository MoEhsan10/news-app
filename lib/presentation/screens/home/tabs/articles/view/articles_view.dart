import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/core/dependancy_Injection.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/usecases/articles_usecases.dart';
import 'package:news_app/presentation/common/error_state_widget/error_state_widget.dart';
import 'package:news_app/presentation/common/loading_state_widget/loading_state_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/widget/article_widget.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});

  SourceEntity source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
var viewModel=ArticlesViewModel(articlesUseCase: getArticleUseCase());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id??'');
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source.id!=widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(builder: (context, viewModel, child) {
        // if(viewModel.isLoading){
        //   return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
        // }
        // if(viewModel.errorMessage!=null){
        //   return Text(viewModel.errorMessage!);
        // }
        // List<Article> articles = viewModel.articles!;
        // return Expanded(
        //   child: ListView.builder(itemBuilder: (context, index) =>
        //   ArticleWidget(article: articles[index]),
        // itemCount: articles.length,),
        // );
        var state = viewModel.state;
        switch (state) {

          case SuccessState():
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) =>
                  ArticleWidget(article: state.data[index]),
                itemCount: state.data.length,),
            );
          case ErrorState():
            return ErrorStateWidget(
                serverError: state.serverError,error: state.error,
                retryText: 'retry',
              retryButtonAction: (){
                  viewModel.getArticlesBySourceId(widget.source.id??'');
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









// return FutureBuilder(future: ApiManager.getArticle(source.id ?? ''),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator(color: ColorsManager.green,),);
//     }
//     if (snapshot.data?.status == 'error' || snapshot.hasError) {
//       return Text(snapshot.data?.message ?? 'check internet connection');
//     }
//     List<Article> articles = snapshot.data?.articles ?? [];
//     return Expanded(
//       child: ListView.builder(itemBuilder: (context, index) =>
//           ArticleItemWidget(article: articles[index]),
//         itemCount: articles.length,),
//     );
//   },);/