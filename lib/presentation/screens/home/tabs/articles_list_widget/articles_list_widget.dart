import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticle(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManager.green,),);
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Text(snapshot.data?.message ?? 'check internet connection');
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(itemBuilder: (context, index) =>
              ArticleItemWidget(article: articles[index]),
            itemCount: articles.length,),
        );
      },);
  }
}
