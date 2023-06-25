import 'package:flutter/material.dart';

class ColorListPage extends StatelessWidget {
  ColorListPage({
    super.key,
    required this.color,
    required this.title,
    required this.onPush,
  });

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  final List<int> materialIndices = [
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50
  ];

  Widget _buildList() {
    return ListView.builder(
      itemCount: materialIndices.length,
      itemBuilder: (BuildContext context, int index) {
        final materialIndex = materialIndices[index];
        return ColoredBox(
          color: color[materialIndex]!,
          child: ListTile(
            title: Text(
              '$materialIndex',
              style: const TextStyle(fontSize: 24.0),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => onPush(materialIndex),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ColoredBox(
        color: color,
        child: _buildList(),
      ),
    );
  }
}
