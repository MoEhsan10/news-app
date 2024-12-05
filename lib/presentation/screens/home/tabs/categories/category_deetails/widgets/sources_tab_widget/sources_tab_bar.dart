import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list_widget/view/articles_list_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_deetails/widgets/sources_tab_widget/source_item_widget.dart';

class SourcesTabWidget extends StatefulWidget {
   SourcesTabWidget({super.key,required this.sources});
List<Source> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
int tappedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 6,
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
            tabs: widget.sources.map((source) =>SourceItemWidget(source: source, isSelected: widget.sources.indexOf(source)==tappedIndex) ,).toList(),
          )
        ),
        ArticlesListWidget(source: widget.sources[tappedIndex],),
      ],
    );
  }
}
