import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/color_detail_page.dart';
import 'package:flutter_bottom_navigation/color_list_page.dart';
import 'package:flutter_bottom_navigation/tab_item.dart';
import 'package:get/get.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case TabNavigatorRoutes.root:
            return GetPageRoute(
              page: () => ColorListPage(
                color: getTabColor(tabItem),
                title: getTabName(tabItem),
                onPush: (materialIndex) => Get.toNamed(
                  TabNavigatorRoutes.detail,
                  id: tabItem.index,
                  arguments: materialIndex,
                ),
              ),
            );
          case TabNavigatorRoutes.detail:
            return GetPageRoute(
                page: () => ColorDetailPage(
                      color: getTabColor(tabItem),
                      title: getTabName(tabItem),
                      materialIndex: settings.arguments as int,
                    ));
        }
        return null;
      },
    );
  }
}
