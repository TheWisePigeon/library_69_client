import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_69_client/constants.dart';
import 'package:library_69_client/custom widgets/custom_card.dart';
import 'package:library_69_client/custom widgets/custom_fields.dart';
import 'package:http/http.dart' as http;
import 'package:library_69_client/models/books.dart';

class GuestScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String id;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Logged in as a Guest'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async{
                  var response = await Book.getBooks(kBaseUrl+'books');
                  print(response);
                },
                child: Text('Get all books in store'),
              ),
              ElevatedButton(
                onPressed: () async{
                  var response = await Book.getBooks(kBaseUrl+'categories');
                  print(response);
                },
                child: Text('Get all categories from store'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a book id',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value){
                  id=value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a category Id',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value){
                  id=value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a category Id for related books',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value){
                  id=value;
                },
              ),
              CustomCard(
                'SUBMIT',
                () {
                  print("submitted");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
