import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/domain/entities/article_entity.dart'; // Use ArticleEntity
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetails extends StatelessWidget {
  const ArticlesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as ArticleEntity; // Cast to ArticleEntity
    String appBarTitle = 'News Details';
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          image: AssetImage(AssetsManager.bgPattern),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: AppStyles.appBar,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: article.urlToImage ?? '', // Use ArticleEntity's imageUrl property
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '', // Adjust property name
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: ColorsManager.green),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                article.source?.name ?? '', // Adjust property access if needed
                style: AppStyles.sourceName,
              ),
              SizedBox(height: 4.h),
              Text(article.title ?? '', style: AppStyles.articleTitle),
              SizedBox(height: 4.h),
              Text(
                article.publishedAt ?? '',
                style: AppStyles.publishedAt,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 50.h),
              Text(
                article.content ?? '',
                style: AppStyles.articleDescription,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await _launchUrl(article.url ?? '');
                    },
                    child: Text(
                      'View Full Article',
                      style: AppStyles.articleTitle,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: ColorsManager.blackAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    try {
      await launchUrl(_url);
    } catch (e) {
      // Handle URL not found
    }
  }
}


// GestureDetector