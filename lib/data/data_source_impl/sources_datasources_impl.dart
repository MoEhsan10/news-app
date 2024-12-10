import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data/data_source_contact/sources_datasource.dart';
import 'package:news_app/result.dart';
@Injectable(as: SourcesDataSource)
class SourcesApiDataSourceImpl extends SourcesDataSource{
  ApiManager apiManager;

  @factoryMethod
  SourcesApiDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Source>>> getSources(String categoryId)async {
  var result = await apiManager.getSources(categoryId);
  switch(result){

    case Success<List<Source>>():
      return Success(data: result.data);
    case ServerError<List<Source>>():
      return ServerError(code: result.code, message: result.message);
    case Error<List<Source>>():
      return Error(exception: result.exception);
  }
  }
}