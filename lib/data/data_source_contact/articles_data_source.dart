import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/result.dart';

abstract class ArticlesDataSource{
  // this fun get list of article based on concrete dataSource
 Future<Result<List<Article>>> getArticles(String sourceId);
}