import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/domain/entities/source_entity.dart';

class SourceWidget extends StatelessWidget {
  SourceWidget({super.key, required this.source, required this.isSelected});
  final SourceEntity source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 8),
      padding: REdgeInsets.symmetric(vertical: 8,horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: ColorsManager.green, width: 2.w),
      ),
      child: Text(
        source.name ?? '',
        style: isSelected?AppStyles.selectedLabel:AppStyles.unselectedLabel,
      ),
    );
  }
}
