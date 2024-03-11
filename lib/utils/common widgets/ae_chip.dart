import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/app_colors.dart';
import 'package:events_all/values/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AEChip extends StatelessObserverWidget {
  const AEChip({
    required this.title,
    this.titleColor,
    this.onTap,
    this.chipColor,
    this.isSelected = false,
    super.key,
  });

  final String title;
  final Color? titleColor;
  final Color? chipColor;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Chip(
        backgroundColor: isSelected ? AppColors.blueColor : chipColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppConstant.roundedBorder50),
          side: BorderSide(color: AppColors.greyColor),
        ),
        label: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: isSelected ? AppColors.whiteFontColor : titleColor,
          ),
        ),
      ),
    );
  }
}
