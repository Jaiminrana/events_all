import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_all/resources/resources.dart';
import 'package:events_all/utils/common%20widgets/ae_icon_card.dart';
import 'package:flutter/material.dart';

class AENetworkImage extends StatelessWidget {
  const AENetworkImage({
    required this.url,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius,
    super.key,
  });

  const AENetworkImage.oval({
    required this.url,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
    super.key,
  });

  final String url;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url,
        errorWidget: (_, __, error) {
          debugPrint(error.toString());
          return const PlaceHolder();
        },
        placeholder: (_, __) => const Placeholder(),
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: const AEIconCard(
        assetName: Vectors.imagePlaceholder,
      ),
    );
  }
}
