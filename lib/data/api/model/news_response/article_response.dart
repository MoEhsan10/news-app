import 'article.dart';

class ArticlesResponse {
  ArticlesResponse({
    this.status,
    this.error,
    this.message,
    this.totalResults,
    this.articles,
  });

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  String? status;
  String? error;
  String? message;
  num? totalResults;
  List<Article>? articles;

  // ArticlesResponse copyWith({
  //   String? status,
  //   num? totalResults,
  //   List<Articles>? articles,
  // }) =>
  //     ArticlesResponse(
  //       status: status ?? this.status,
  //       totalResults: totalResults ?? this.totalResults,
  //       articles: articles ?? this.articles,
  //     );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}