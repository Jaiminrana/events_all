import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AESvgPicture extends StatelessWidget {
  const AESvgPicture({
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.onTap,
    super.key,
  });

  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
