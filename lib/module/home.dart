import 'package:events_all/generated/l10n.dart';
import 'package:events_all/module/explore/explore_screen.dart';
import 'package:events_all/module/explore/explore_store.dart';
import 'package:events_all/module/feed/feed_screen.dart';
import 'package:events_all/module/feed/feed_store.dart';
import 'package:events_all/module/home_store.dart';
import 'package:events_all/module/profile/profile_screen.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();

    List<Widget> homeTab = [
      const ExploreScreen().withProvider<ExploreStore>(ExploreStore()),
      const FeedScreen().withProvider<FeedStore>(FeedStore()),
      const ProfileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'AllEvents',
            style: context.textTheme.displayLarge,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.7),
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
          child: Observer(builder: (context) {
            return BottomNavigationBar(
              currentIndex: store.currentPage.index,
              onTap: (index) => store.setPage(BottomNavPage.parse(index)),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: store.getIconColor(BottomNavPage.explore),
                  ),
                  label: Str.current.explore,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore,
                    color: store.getIconColor(BottomNavPage.feed),
                  ),
                  label: Str.current.feed,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: store.getIconColor(BottomNavPage.profile),
                  ),
                  label: Str.current.profile,
                ),
              ],
            );
          }),
        ),
        body: PageView(
          controller: store.pageController,
          onPageChanged: store.onPageChange,
          children: homeTab,
        ),
      ),
    );
  }
}
