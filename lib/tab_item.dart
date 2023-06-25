import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

const Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
};

const Map<TabItem, MaterialColor> tabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};

String getTabName(TabItem tabItem) => tabName[tabItem] ?? '';
MaterialColor getTabColor(TabItem tabItem) => tabColor[tabItem] ?? Colors.red;
