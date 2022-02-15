import 'package:flutter/material.dart';

import 'categories.dart';

class CategoryForm extends StatelessWidget {
  late String newLabel;

  late String id;
  late String label;

  CategoryForm(this.label, this.id);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: TextFormField(
              onChanged: (value) {
                newLabel = value;
              },
              decoration: InputDecoration(
                  hintText: label,
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                      color: Colors.grey)),
            ),
          ),
          ElevatedButton(
            child: Text('UPDATE'),
            onPressed: () async {
              var response = await Category.updateCategory(id, newLabel);

            },
          )
        ],
      ),
    );
  }
}
