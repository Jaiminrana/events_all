import 'package:events_all/model/catergory_dm.dart';
import 'package:events_all/module/explore/explore_store.dart';
import 'package:events_all/utils/common%20widgets/ae_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CategorySheet extends StatelessObserverWidget {
  const CategorySheet({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<ExploreStore>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categoryList.length,
            (index) {
              final category = categoryList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AECategoryCard(
                    onChipTap: (category) => _onCategoryChange(
                      category: category,
                      store: store,
                      context: context,
                    ),
                    isDividerVisible: index != categoryList.length - 1,
                    title: category.title,
                    categoryList: category.item,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _onCategoryChange({
    required String category,
    required ExploreStore store,
    required BuildContext context,
  }) {
    store.onChangeCategory(category);
    Navigator.pop(context);
  }
}
