import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:library_69_client/constants.dart';
import 'package:http/http.dart' as http;
import 'book.dart';

class Book{

  static Future getBooks(String  url) async{
    List<Widget> result = [];
    http.Response response= await http.get(Uri.parse(url));

    var data = jsonDecode(response.body.toString())["books"];
    for(var book in data){
      result.add(
          BookTile(
            book["title"],
            book["author"],
            book["isbn"]
          )
      );
    }
    return result;

  }

  static Future getBook(String id) async{
    List<Widget> result = [];
    http.Response response = await http.get(Uri.parse(kBaseUrl+'books/$id'));
    var data = jsonDecode(response.body.toString())["book"];
      result.add(
          BookTile(
              data["title"],
              data["author"],
              data["isbn"]
          )
      );

    return result;
  }
}