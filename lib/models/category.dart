import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class CategoryTile extends StatelessWidget {

  late String id;
  late String label;

  CategoryTile(this.id, this.label);
  @override
  Widget build(BuildContext context) {
    return GFListTile(
      titleText:id,
      subTitleText:label,
      icon: Icon(Icons.category),
    );
  }
}
