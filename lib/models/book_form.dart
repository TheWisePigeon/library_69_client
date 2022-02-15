import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {

  late String title;
  late String isbn;
  late String pub_date;
  late String author;
  late String editor;
  late String category_id;

  BookForm(this.isbn, this.title, this.author, this.editor, this.pub_date, this.category_id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: TextFormField(

              onChanged: (value){
              },
              decoration: InputDecoration(
                  hintText: 'label',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                      color: Colors.grey
                  )
              ),
            ),
          ),
          SizedBox(height: 20.0,)

        ],
      ),
    );
  }
}
