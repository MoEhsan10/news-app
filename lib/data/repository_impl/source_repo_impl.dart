import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data/data_source_contact/sources_datasource.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repository_contact/sources_repo.dart';
@Injectable(as: SourcesRepository)
class SourcesRepositoryImpl extends SourcesRepository{

  SourcesDataSource dataSource;
  @factoryMethod
  SourcesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result =await dataSource.getSources(categoryId);

    switch(result){

      case Success<List<Source>>():
        return Success(data: result.data.map((source) => source.toSourceEntity()).toList());
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }

}