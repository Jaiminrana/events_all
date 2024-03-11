import 'package:events_all/utils/common%20widgets/ae_svg_picture.dart';
import 'package:flutter/material.dart';

class AEIconCard extends StatelessWidget {
  const AEIconCard({
    super.key,
    required this.assetName,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.iconColor = Colors.grey,
    this.padding = const EdgeInsets.all(8),
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  final String assetName;
  final BorderRadiusGeometry borderRadius;
  final Color? iconColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 1,
            ),
          ],
        ),
        child: AESvgPicture(
          assetName: assetName,
          height: 20,
          width: 20,
          color: iconColor,
        ),
      ),
    );
  }
}
