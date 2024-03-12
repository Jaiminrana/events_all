import 'package:events_all/generated/l10n.dart';
import 'package:events_all/module/category_sheet.dart';
import 'package:events_all/module/explore/explore_store.dart';
import 'package:events_all/resources/resources.dart';
import 'package:events_all/utils/common%20widgets/ae_bottom_sheet.dart';
import 'package:events_all/utils/common%20widgets/ae_event_list_view.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/app_colors.dart';
import 'package:events_all/values/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../utils/common widgets/ae_icon_tile.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<ExploreStore>();
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(AppConstant.roundedBorder50)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Observer(builder: (context) {
                return AEIconTile(
                  onTap: () => _showCategorySheet(
                    context: context,
                    store: store,
                  ),
                  icon: Vectors.category,
                  title: store.isAllCategory
                      ? Str.current.category
                      : store.currentCategory,
                  titleColor: store.isAllCategory ? null : AppColors.blueColor,
                );
              }),
              AEIconTile(
                icon: Vectors.calendar,
                title: Str.current.dateTime,
              ),
              Observer(builder: (context) {
                return AEIconTile(
                  icon: Vectors.sort,
                  title: store.view,
                  onTap: store.onToggleView,
                  titleColor: store.isGridView
                      ? AppColors.blueColor
                      : AppColors.blackFontColor,
                );
              }),
            ],
          ),
        ),
        Expanded(
          child: Observer(builder: (context) {
            return AeEventListView(
              networkState: store.eventState,
              eventList: store.eventList,
              isGridView: store.isGridView,
            );
          }),
        ),
      ],
    );
  }

  void _showCategorySheet({
    required BuildContext context,
    required ExploreStore store,
  }) {
    AEBottomSheet(
      title: Str.current.category,
      backGroundColor: AppColors.whiteColor,
      childFit: FlexFit.tight,
      child: const CategorySheet().wwithProviderValue(store),
    ).showBottomSheet(context: context);
  }
}
