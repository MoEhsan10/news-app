import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';

class SourcesViewmodel extends ChangeNotifier{
  List<Source>? source;
  String? errorMessage;
  bool isLoading=false;

  void getSourcesByCategoryId(String categoryId)async{
   try{
     isLoading=true;
     notifyListeners();
     var response =await ApiManager.getSources(categoryId);
     isLoading=false;
     if(response.status=='ok'){
       source=response.sources;

     }else{
       errorMessage=response.message;
     }
     notifyListeners();
   }catch(e){
     isLoading=false;
     errorMessage=e.toString();
   }
  }

}
