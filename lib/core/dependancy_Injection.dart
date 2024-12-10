import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_datasource_impl.dart';
import 'package:news_app/data/data_source_impl/sources_datasources_impl.dart';
import 'package:news_app/data/repository_impl/articles_repo_impl.dart';
import 'package:news_app/data/repository_impl/source_repo_impl.dart';
import 'package:news_app/domain/usecases/articles_usecases.dart';
import 'package:news_app/domain/usecases/sources_usecase.dart';

GetArticlesUseCase getArticleUseCase(){
  return GetArticlesUseCase(repository: getArticlesRepository());
}

ArticlesRepositoryImpl getArticlesRepository(){
  return ArticlesRepositoryImpl(dataSource: getArticlesDataSource());
}

ArticlesApiDataSourceImpl getArticlesDataSource(){
  return ArticlesApiDataSourceImpl(apiManager: getApiManager());
}

ApiManager getApiManager(){
  return ApiManager();
}

///////////////////////////////////////////////////////////////////////////////

GetSourcesUseCase getSourcesUseCase(){
  return GetSourcesUseCase(repository: getSourcesRepository());
}

SourcesRepositoryImpl getSourcesRepository(){
  return SourcesRepositoryImpl(dataSource: getSourcesDataSource());
}

SourcesApiDataSourceImpl getSourcesDataSource(){
  return SourcesApiDataSourceImpl(apiManager: getApiManager());
}

