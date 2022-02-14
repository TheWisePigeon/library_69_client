import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_69_client/constants.dart';
import 'package:library_69_client/models/books.dart';
import 'package:library_69_client/models/categories.dart';

class GuestScreen extends StatefulWidget {
  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  String bookId = '';
  String categoryId = '';
  List<Widget> result =[];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Logged in as a Guest'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var response = await Book.getBooks(kBaseUrl + 'books');
                  print(response);
                  setState(() {
                    result = response;
                  });
                },
                child: Text('Get all books in store'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var response = await Category.getCategories();
                  print(response);
                  setState(() {
                    result = response;
                  });
                },
                child: Text('Get all categories from store'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    child: TextFormField(
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
                      onChanged: (value) {
                        bookId = value;
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Text('Go'),
                      onPressed: () async {
                        var response = await Book.getBook(bookId);
                        print(response);
                        setState(() {
                          result = response;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a category id',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        categoryId = value;
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Text('Go'),
                      onPressed: () async {
                        var response = await Category.getCategory(categoryId);
                        print(response);
                        setState(() {
                          result = response;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a category id to get books from',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        categoryId = value;
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Text('Go'),
                      onPressed: () async {
                        var response =
                            await Category.getBooksOfCategory(categoryId);
                        print(response);
                        setState(() {
                          result = response;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 430,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: ListView(
                  shrinkWrap: true,
                  children: result,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
