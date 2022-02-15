import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:library_69_client/models/category_form.dart';
import 'book.dart';
import 'category.dart';
import 'package:http/http.dart' as http;
import 'package:library_69_client/constants.dart';

class Category {
  static Future getCategories() async {
    List<Widget> result = [];
    http.Response response = await http.get(Uri.parse(kBaseUrl + 'categories'));
    var data = jsonDecode(response.body.toString())["categories"];
    for (var category in data) {
      result.add(CategoryTile(
        category["id"].toString(),
        category["label"],
      ));
    }
    return result;
  }

  static Future getCategory(String id) async {
    List<Widget> result = [];
    http.Response response =
        await http.get(Uri.parse(kBaseUrl + 'categories/$id'));
    var data = jsonDecode(response.body.toString())["category"];
    result.add(CategoryTile(
      data["label"],
      data["id"].toString(),
    ));
    return result;
  }

  static Future getBooksOfCategory(String id) async {
    List<Widget> result = [];
    http.Response response =
        await http.get(Uri.parse(kBaseUrl + 'categories/$id/books'));
    var data = jsonDecode(response.body.toString())["books"];
    for (var books in data) {
      result.add(BookTile(books["title"], books["author"], books["isbn"]));
    }
    return result;
  }

  static Future deleteCategory(String id) async {
    List<Widget> result = [];
    http.Response response =
        await http.delete(Uri.parse(kBaseUrl + 'categories/$id'));
    var data = jsonDecode(response.body.toString())["deleted category"];
    result.add(CategoryTile(data["label"], data["id"].toString()));
    result.add(Text('Item deleted'));
    return result;
  }

  static Future getCategoryToUpdate(String id) async {
    List<Widget> result = [];
    http.Response response =
        await http.get(Uri.parse(kBaseUrl + 'categories/$id'));
    var data = jsonDecode(response.body.toString())["category"];
    result.add(CategoryForm(
      data["label"],
      data["id"].toString(),
    ));
    return result;
  }

  static Future updateCategory(String id, String newLabel) async {
    List<Widget> result = [];
    String url =
        "https://library-69-api.herokuapp.com/categories/$id?label=$newLabel";
    http.Response response = await http.put(Uri.parse(url));
    var data = jsonDecode(response.body.toString())["updated category"];
    result.add(CategoryTile(
      data["label"],
      data["id"].toString(),
    ));
    if(response.statusCode==200) {
      return true;
    }else {
      return false;
    }
  }
}
