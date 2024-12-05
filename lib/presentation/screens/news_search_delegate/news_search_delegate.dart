import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/api/model/news_response/article_response.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/widget/article_item_widget.dart';

class NewsSearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.green,
    ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
      ),

    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back,color: ColorsManager.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(future: ApiManager.searchArticle(query), builder: (context, snapshot) {

      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
      }
      if(snapshot.hasError || snapshot.data==null){
        return Center(child: Text(snapshot.error.toString()),);
      }
      var articlesResponse =snapshot.data as ArticlesResponse;
      if(articlesResponse.articles==null || articlesResponse.articles!.isEmpty){
        return const Center(child: Text('No result found'),);
      }
      return ListView.builder(itemBuilder: (context, index) =>
          ArticleItemWidget(article: articlesResponse.articles![index]),itemCount: articlesResponse.articles!.length ??0,);

    },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(future: ApiManager.searchArticle(query), builder: (context, snapshot) {

      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
      }
      if(snapshot.hasError || snapshot.data==null){
        return Center(child: Text(snapshot.error.toString()),);
      }
      var articlesResponse =snapshot.data as ArticlesResponse;
      if(articlesResponse.articles==null || articlesResponse.articles!.isEmpty){
        return const Center(child: Text('No result found'),);
      }
      return ListView.builder(itemBuilder: (context, index) =>
          ArticleItemWidget(article: articlesResponse.articles![index]),itemCount: articlesResponse.articles!.length ??0,);

    },);
  }

}
