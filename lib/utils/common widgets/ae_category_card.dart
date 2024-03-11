import 'package:events_all/module/explore/explore_store.dart';
import 'package:events_all/utils/common%20widgets/ae_chip.dart';
import 'package:events_all/utils/common%20widgets/ae_divider.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AECategoryCard extends StatelessObserverWidget {
  const AECategoryCard({
    super.key,
    required this.title,
    required this.categoryList,
    this.onChipTap,
    this.isDividerVisible = false,
  });

  final String title;
  final List<String> categoryList;
  final ValueChanged<String>? onChipTap;
  final bool isDividerVisible;

  @override
  Widget build(BuildContext context) {
    final store = context.read<ExploreStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: List.generate(
            categoryList.length,
            (index) => AEChip(
              isSelected: store.currentCategory == categoryList[index],
              onTap: () => onChipTap?.call(categoryList[index]),
              title: categoryList[index],
            ),
          ),
        ),
        if (isDividerVisible) const AEDivider(height: 26),
      ],
    );
  }
}
