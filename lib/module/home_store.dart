import 'package:events_all/values/app_colors.dart';
import 'package:events_all/values/enumerations.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final pageController = PageController();

  @observable
  BottomNavPage currentPage = BottomNavPage.explore;

  @action
  void setPage(BottomNavPage page) {
    currentPage = page;
    pageController.jumpToPage(page.index);
  }

  Color getIconColor(BottomNavPage page) {
    return page == currentPage ? AppColors.blueColor : AppColors.greyColor;
  }

  @action
  void onPageChange(pageIndex) => currentPage = BottomNavPage.parse(pageIndex);

  void dispose() => pageController.dispose();
}
