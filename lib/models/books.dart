import 'dart:convert';
import 'package:library_69_client/constants.dart';
import 'package:http/http.dart' as http;

class Book{

  static Future getBooks(String  url) async{
    http.Response response= await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    return data;
  }

  static Future getBook(String id) async{
    http.Response response = await http.get(Uri.parse(kBaseUrl+'books/$id'));
    var data = jsonDecode(response.body.toString());
    return data;
  }
}