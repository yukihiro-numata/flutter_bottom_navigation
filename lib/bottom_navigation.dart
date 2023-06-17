import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentTab,
    required this.onSelectTab,
  });
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: currentTab == tabItem ? getTabColor(tabItem) : Colors.grey,
      ),
      label: tabName[tabItem],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: TabItem.values.indexOf(currentTab),
      selectedItemColor: getTabColor(currentTab),
      items: [
        _buildItem(TabItem.red),
        _buildItem(TabItem.green),
        _buildItem(TabItem.blue),
      ],
      onTap: (index) => onSelectTab(TabItem.values[index]),
    );
  }
}
