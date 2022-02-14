import 'package:flutter/material.dart';
import 'package:library_69_client/custom widgets/custom_card.dart';
import 'package:library_69_client/custom widgets/custom_fields.dart';

class GuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              CustomCard(
                'Get all books in store',
                () {
                  print("bruuh");
                },
              ),
              CustomCard(
                'Get all categories in store',
                () {
                  print("bruuh");
                },
              ),
              CustomField(
                'Enter a book Id',
              ),
              SizedBox(
                height: 10,
              ),
              CustomField(
                'Enter a category Id',
              ),
              SizedBox(
                height: 10,
              ),
              CustomField(
                'Enter a category Id for related books',
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
