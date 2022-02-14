import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class BookTile extends StatelessWidget {

  late String title;
  late String isbn;
  late String author;

  BookTile(this.title, this.author, this.isbn);
  @override
  Widget build(BuildContext context) {
    return GFListTile(
        titleText:title,
        subTitleText:isbn,
        icon: Icon(Icons.book),
      description: Text(author),
    );
  }
}
