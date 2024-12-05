import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/widget/article_item_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/viewModel/articles_viewModel.dart';
import 'package:provider/provider.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
var viewModel=ArticlesViewModel();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id??'');
  }

  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
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
        if(viewModel.isLoading){
          return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
        }
        if(viewModel.errorMessage!=null){
          return Text(viewModel.errorMessage!);
        }
        List<Article> articles = viewModel.articles!;
        return Expanded(
          child: ListView.builder(itemBuilder: (context, index) =>
          ArticleItemWidget(article: articles[index]),
        itemCount: articles.length,),
        );
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
//   },);