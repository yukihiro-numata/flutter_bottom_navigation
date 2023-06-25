import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/color_detail_page.dart';
import 'package:flutter_bottom_navigation/color_list_page.dart';
import 'package:flutter_bottom_navigation/tab_item.dart';

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

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorListPage(
            color: getTabColor(tabItem),
            title: getTabName(tabItem),
            onPush: (materialIndex) => _push(
              context,
              materialIndex: materialIndex,
            ),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: getTabColor(tabItem),
            title: getTabName(tabItem),
            materialIndex: materialIndex,
          )
    };
  }

  void _push(BuildContext context, {int materialIndex = 500}) {
    final routeBuilders = _routeBuilders(context, materialIndex: materialIndex);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => routeBuilders[routeSettings.name]!(context),
      ),
    );
  }
}
