import 'package:injectable/injectable.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/usecases/sources_usecase.dart';
import 'package:news_app/result.dart';

@injectable
class SourcesViewModel extends BaseViewModel<List<SourceEntity>>{
GetSourcesUseCase sourcesUseCase;
@factoryMethod
  SourcesViewModel({required this.sourcesUseCase}) : super(state: LoadingState());

  void getSourcesByCategoryId(String categoryId)async {
    state = LoadingState();
    var result = await sourcesUseCase.execute(categoryId);

    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<SourceEntity>>():
        emit(ErrorState(error: result));
    }
  }
}


// sealed class SourcesState{}
//
// class SourcesSuccessState extends SourcesState{
//   List<Source> sources;
//   SourcesSuccessState({required this.sources});
// }
//
// class SourcesLoadingSate extends SourcesState{
//   String? loadingMessage;
//   SourcesLoadingSate({ this.loadingMessage});
// }
//
// class SourcesErrorSate extends SourcesState{
// ServerError? serverError;
// Error? error;
// SourcesErrorSate({this.serverError,this.error});
// }
//


//  try{
//    isLoading=true;
//    notifyListeners();
//    var response =await ApiManager.getSources(categoryId);
//    isLoading=false;
//    if(response.status=='ok'){
//      source=response.sources;
//
//    }else{
//      errorMessage=response.message;
//    }
//    notifyListeners();
//  }catch(e){
//    isLoading=false;
//    errorMessage=e.toString();
//  }