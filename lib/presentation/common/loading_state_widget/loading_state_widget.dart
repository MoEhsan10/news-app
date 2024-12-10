import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class LoadingStateWidget extends StatelessWidget {
   LoadingStateWidget({super.key,this.loadingMessage});

  String? loadingMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(loadingMessage != null)
          Text(loadingMessage!,),
         SizedBox(width: 8.w,),
        const Center(child: CircularProgressIndicator(color: ColorsManager.green,),),

      ],
    );
  }
}
