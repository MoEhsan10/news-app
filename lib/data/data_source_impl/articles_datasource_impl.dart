import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/data_source_contact/articles_data_source.dart';
import 'package:news_app/result.dart';

@Injectable(as: ArticlesDataSource)
class ArticlesApiDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;

  @factoryMethod
  ArticlesApiDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async{
    // TODO: implement getArticles.
    var result = await  apiManager.getArticle(sourceId);
    // get list of articles from api
    switch(result){

      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}

class ArticlesFireStoreDataSourceImpl extends ArticlesDataSource {
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) {
    // TODO: implement getArticles
    throw UnimplementedError();
    // get list of articles from. fireStore
  }
}

class ArticlesOfflineDataSourceImpl extends ArticlesDataSource{
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) {
    // TODO: implement getArticles
    throw UnimplementedError();

  }

}