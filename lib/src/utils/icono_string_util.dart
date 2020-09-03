import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "slider": Icons.list,
  "listview": Icons.line_style,
};

Icon getIcono(String nombreaIcono) {
  return Icon(
    _icons[nombreaIcono],
    color: Colors.blue,
  );
}
