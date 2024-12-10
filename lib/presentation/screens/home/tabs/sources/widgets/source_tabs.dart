import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/view/articles_view.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widgets/source_widget.dart';

class SourceTabs extends StatefulWidget {
   SourceTabs({super.key,required this.sources});
List<SourceEntity> sources;

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
int tappedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            labelPadding: REdgeInsets.symmetric(horizontal: 8),
            onTap: (index) {
              tappedIndex=index;
              setState(() {

              });
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.sources.map((source) =>SourceWidget(source: source, isSelected: widget.sources.indexOf(source)==tappedIndex) ,).toList(),
          )
        ),
        ArticlesView(source: widget.sources[tappedIndex],),
      ],
    );
  }
}
