import 'dart:convert';
import 'package:flutter/material.dart';
import 'book.dart';
import 'category.dart';
import 'package:http/http.dart' as http;
import 'package:library_69_client/constants.dart';

class Category{

  static Future getCategories() async{
    List<Widget> result = [];
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories'));
    var data = jsonDecode(response.body.toString())["categories"];
    for(var category in data){
      result.add(
          CategoryTile(
            category["id"].toString(),
            category["label"],
          )
      );
    }
    return result;
  }

  static Future getCategory(String id) async{
    List<Widget> result = [];
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories/$id'));
    var data = jsonDecode(response.body.toString())["category"];
      result.add(
          CategoryTile(
              data["label"],
              data["id"].toString(),

          )
      );
    return result;
  }

  static Future getBooksOfCategory(String id) async{
    List<Widget> result = [];
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories/$id/books'));
    var data = jsonDecode(response.body.toString())["books"];
    for(var books in data){
      result.add(
        BookTile(
          books["title"],
          books["author"],
          books["isbn"]
        )
      );
    }
    return result;
  }
}