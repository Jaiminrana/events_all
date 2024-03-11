import 'package:events_all/utils/common%20widgets/ae_svg_picture.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:flutter/material.dart';

class AEIconTile extends StatelessWidget {
  const AEIconTile({
    required this.icon,
    required this.title,
    this.titleColor,
    this.iconColor,
    this.onTap,
    super.key,
  });

  final String icon;
  final String title;
  final Color? titleColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          AESvgPicture(
            assetName: icon,
            color: iconColor,
            height: 20,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
