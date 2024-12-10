import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:news_app/data/api/model/news_response/article_response.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';
import 'package:news_app/result.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=3029f265d1e14dfb8b777a652ef9a831

@singleton
class ApiManager{
  static const String _baseUrl= 'newsapi.org';
  static const String _apiKey= '3029f265d1e14dfb8b777a652ef9a831';
  static const String _sourcesEndPoint= 'v2/top-headlines/sources';
  static const String _articlesEndPoint= '/v2/everything';


   Future<Result<List<Source>>>getSources(String categoryId)async{
    Uri url =Uri.https(_baseUrl,_sourcesEndPoint,{
      'apiKey' : _apiKey,
      'category' : categoryId,
    });

    // make network request
  try{
    http.Response serverResponse =await http.get(url);
    Map<String,dynamic> json =jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);

    if(sourcesResponse.status=='ok'){
      return Success(data: sourcesResponse.sources??[]);
    }else{
      return ServerError(code: sourcesResponse.code??'', message: sourcesResponse.message??'');
    }

  }on Exception catch(e){
    return Error(exception: e);
  }
  }


   Future<Result<List<Article>>>getArticle(String sourceId)async{
    Uri url =Uri.http(_baseUrl,_articlesEndPoint,{
      'apiKey' : _apiKey,
      'sources': sourceId,
    });

    try{

      http.Response serverResponse =await http.get(url);
      Map<String,dynamic> json=jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);

      if(articlesResponse.status=='ok'){
        return Success(data: articlesResponse.articles??[]);
      }else{
        return ServerError(code: articlesResponse.code??'', message: articlesResponse.message??'');
      }

    }on Exception catch(e){
      return Error(exception: e);
    }

  }

  static Future<Result<List<Article>>>searchArticle(String query)async{
    Uri url =Uri.http(_baseUrl,_articlesEndPoint,{
      'apiKey' : _apiKey,
      'q': query,
    });
    try{

      http.Response serverResponse =await http.get(url);
      Map<String,dynamic> json=jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);

      if(articlesResponse.status=='ok'){
        return Success(data: articlesResponse.articles??[]);
      }else{
        return ServerError(code: articlesResponse.code??'', message: articlesResponse.message??'');
      }

    }on Exception catch(e){
      return Error(exception: e);
    }

  }
}


// jsonEncode(object) convert from json to strong