import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contact/sources_repo.dart';
import 'package:news_app/result.dart';

@injectable
class GetSourcesUseCase{

  SourcesRepository repository;

  @factoryMethod
  GetSourcesUseCase({required this.repository});
  Future<Result<List<SourceEntity>>> execute(String categoryId){
    return repository.getSources(categoryId);

  }
}