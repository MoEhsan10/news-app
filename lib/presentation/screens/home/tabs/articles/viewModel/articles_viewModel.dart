import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/articles_usecases.dart';
import 'package:news_app/result.dart';

import '../../../../../../domain/repository_contact/articles_repositry_contact.dart';
@injectable
class ArticlesViewModel  extends BaseViewModel<List<ArticleEntity>>{
@factoryMethod
 ArticlesViewModel({required this.articlesUseCase}):super(state: LoadingState());
GetArticlesUseCase articlesUseCase;

  void getArticlesBySourceId(String sourceId)async{

    var result = await articlesUseCase.execute(sourceId);
    emit(LoadingState());
    switch(result){

      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: result));
    }
  }
}

// sealed class ArticlesState{}
//
//  class ArticlesInitialState extends ArticlesState{}
//
// class ArticlesSuccessState extends ArticlesState{
//   List<Article> articles;
//   ArticlesSuccessState({required this.articles});
// }
//
// class ArticlesErrorState extends ArticlesState{
//   ServerError? serverError;
//   Error? error;
//   ArticlesErrorState({this.error,this.serverError});
// }
//
//
// class ArticlesLoadingState extends ArticlesState{
//   String? loadingMessage;
//   ArticlesLoadingState({this.loadingMessage});
// }

// try{
//   isLoading=true;
//   notifyListeners();
//   var response= await ApiManager.getArticle(sourceId);
//   isLoading=false;
//   if(response.status=='ok'){
//     articles=response.articles;
//   }else{
//     errorMessage=response.message;
//   }
//   notifyListeners();
// }catch(e){
//   isLoading=false;
//   errorMessage=e.toString();
//   notifyListeners();
// }