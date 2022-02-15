import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_69_client/models/books.dart';
import 'package:library_69_client/models/categories.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Widget> result = [];
  String bookId='';
  String categoryId='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Logged in as an Administrator'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      onChanged: (value){
                        bookId=value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Book id',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Icon(Icons.delete),
                      onPressed: () async {
                        var response = await Book.deleteBook(bookId);
                        print(response);
                        setState(() {
                          result = response;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Icon(Icons.edit),
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      onChanged: (value){
                        categoryId=value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Category id',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Icon(Icons.delete),
                      onPressed: () async {
                        var response = await Category.deleteCategory(categoryId);
                        print(response);
                        setState(() {
                          result = response;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    child: ElevatedButton(
                      child: Icon(Icons.edit),
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text('ADD BOOK'),
                onPressed: () async{

                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text('ADD CATEGORY'),
                onPressed: () async{

                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 400,
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
