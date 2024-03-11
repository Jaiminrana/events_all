import 'package:events_all/resources/resources.dart';
import 'package:events_all/utils/common%20widgets/ae_divider.dart';
import 'package:events_all/utils/common%20widgets/ae_svg_picture.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/app_colors.dart';
import 'package:events_all/values/app_constant.dart';
import 'package:flutter/material.dart';

class AEBottomSheet extends StatelessWidget {
  const AEBottomSheet({
    required this.title,
    required this.child,
    this.childFlex = 0,
    this.childFit = FlexFit.loose,
    this.backGroundColor = AppColors.bottomSheetBackground,
    this.trailing,
    super.key,
  });

  final String title;
  final Widget child;
  final int childFlex;
  final FlexFit childFit;
  final Color backGroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.5,
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: AppConstant.roundedBorder10,
          ),
          child: ColoredBox(
            color: backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius:
                            BorderRadius.all(AppConstant.roundedBorder50)),
                    margin: const EdgeInsets.all(8),
                    height: 5,
                    width: 150,
                  ),
                ),
                ColoredBox(
                  color: AppColors.bottomSheetBackground,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: context.textTheme.displayLarge
                                ?.copyWith(fontSize: 20),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: Navigator.of(context).pop,
                              child: const SizedBox.square(
                                dimension: 16,
                                child: AESvgPicture(
                                  assetName: Vectors.close,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const AEDivider(
                  thickness: 2,
                  height: 26,
                ),
                Flexible(
                  fit: childFit,
                  flex: childFlex,
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
