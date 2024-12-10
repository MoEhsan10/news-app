import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/data_source_contact/articles_data_source.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repository_contact/articles_repositry_contact.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl extends ArticlesRepository{
  ArticlesDataSource dataSource;

  @factoryMethod
  ArticlesRepositoryImpl({required this.dataSource});
  @override
 Future <Result<List<ArticleEntity>>> getArticles(String sourceId)async {
    var result=await dataSource.getArticles(sourceId);
    switch(result){

      case Success<List<Article>>():
      List<ArticleEntity> articles= result.data.map((article) => article.toArticleEntity(),).toList();
      return Success(data: articles);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception:  result.exception);
    }
  }


}