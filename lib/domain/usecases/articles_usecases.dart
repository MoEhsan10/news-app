import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repository_contact/articles_repositry_contact.dart';
import 'package:news_app/result.dart';

@injectable
class GetArticlesUseCase{
  ArticlesRepository repository;
  @factoryMethod
  GetArticlesUseCase({required this.repository});

 Future<Result<List<ArticleEntity>>> execute(String sourceId){
    return repository.getArticles(sourceId);
  }
}