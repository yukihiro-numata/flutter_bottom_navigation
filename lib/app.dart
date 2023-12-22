import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/bottom_navigation.dart';
import 'package:flutter_bottom_navigation/tab_item.dart';
import 'package:flutter_bottom_navigation/tab_navigator.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final _navigatorKeys = {
    TabItem.red: Get.nestedKey(TabItem.red.index),
    TabItem.green: Get.nestedKey(TabItem.green.index),
    TabItem.blue: Get.nestedKey(TabItem.blue.index),
  };
  var _currentTab = TabItem.red;

  void _selectTab(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(TabItem.red),
          _buildOffstageNavigator(TabItem.green),
          _buildOffstageNavigator(TabItem.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}
