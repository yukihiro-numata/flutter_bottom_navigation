import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/bottom_navigation.dart';
import 'package:flutter_bottom_navigation/color_detail_page.dart';
import 'package:flutter_bottom_navigation/tab_item.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.red;

  void _selectTab(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  void _push() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ColorDetailPage(
          color: getTabColor(_currentTab),
          title: getTabName(_currentTab),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: getTabColor(_currentTab),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: _push,
        child: const Text(
          'PUSH',
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}
