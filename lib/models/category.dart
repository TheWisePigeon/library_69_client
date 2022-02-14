import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_69_client/constants.dart';

class Category{

  static Future getCategories(String url) async{
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories'));
    var data = jsonDecode(response.body.toString());
    return data;
  }

  static Future getCategory(String id) async{
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories/$id'));
    var data = jsonDecode(response.body.toString());
    return data;
  }

  static Future getBooksOfCategory(String id) async{
    http.Response response = await http.get(Uri.parse(kBaseUrl+'categories/$id/books'));
    var data = jsonDecode(response.body.toString());
    return data;
  }
}