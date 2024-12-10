import 'package:news_app/domain/entities/source_entity.dart';

class ArticleEntity{
  SourceEntity? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleEntity(
      {this.source,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}