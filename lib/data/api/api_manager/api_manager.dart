import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news_app/data/api/model/news_response/article_response.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=3029f265d1e14dfb8b777a652ef9a831
class ApiManager{
  static const String _baseUrl= 'newsapi.org';
  static const String _apiKey= '3029f265d1e14dfb8b777a652ef9a831';
  static const String _sourcesEndPoint= 'v2/top-headlines/sources';
  static const String _articlesEndPoint= '/v2/everything';


  static Future<SourcesResponse>getSources(String categoryId)async{
    Uri url =Uri.https(_baseUrl,_sourcesEndPoint,{
      'apiKey' : _apiKey,
      'category' : categoryId,
    });

    // make network request
   http.Response serverResponse =await http.get(url);
   Map<String,dynamic> json =jsonDecode(serverResponse.body);
   SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);
   return sourcesResponse;


  }

  static Future<ArticlesResponse>getArticle(String sourceId)async{
    Uri url =Uri.http(_baseUrl,_articlesEndPoint,{
      'apiKey' : _apiKey,
      'sources': sourceId,
    });
    http.Response serverResponse =await http.get(url);
    Map<String,dynamic> json=jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);
    return articlesResponse;

  }
}
// jsonEncode(object) convert from json to strong