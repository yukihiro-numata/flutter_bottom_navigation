import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

const Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
};

const Map<TabItem, Color> tabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};

String activeTabName(TabItem tabItem) => tabName[tabItem] ?? '';
Color activeTabColor(TabItem tabItem) => tabColor[tabItem] ?? Colors.red;
