import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/result.dart';

class ErrorStateWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  String? retryText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget({super.key,this.error,this.serverError,this.retryButtonAction,this.retryText});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(extractError(),textAlign: TextAlign.center,),
          SizedBox(height: 4.h,),

          if(retryText != null)

          ElevatedButton(onPressed: () {
            retryButtonAction?.call();
          }, child: Text(retryText!)),
        ],
      ),
    );
  }

  String extractError(){
    String message = 'something went wrong';
    if(serverError?.message!=null){
      message=serverError!.message;
      return message;
    }else if(error?.exception != null){
      Exception exception = error!.exception;
      switch(exception){
        case SocketException():
          message='No Internet connection';
        case HttpException():
          message= 'Couldn\'t find the post';
        case FormatException():
          message = 'Bad response format';
      }
      return message;
    }
    return message;
  }
}
