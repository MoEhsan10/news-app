import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/api/model/news_response/article.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //navigate to article details screen
        // send params ->article
        // send to search the same end point q.

        Navigator.pushNamed(context, RoutesManager.articleDetails,
        arguments: article,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: article.urlToImage??'',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage??'',
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: ColorsManager.green,)),
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  ),),
            ),
            SizedBox(height: 4.h,),
            Text(article.source?.name ?? '', style: AppStyles.sourceName,),
            SizedBox(height: 4.h,),
            Text(article.title ?? '',style: AppStyles.articleTitle),
            SizedBox(height: 4.h,),
            Text(article.publishedAt ?? '',style: AppStyles.publishedAt,textAlign: TextAlign.end,),

          ],
        ),
      ),
    );
  }
}
