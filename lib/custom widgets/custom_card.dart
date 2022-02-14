import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  late Function callback;
  late String title;

  CustomCard( this.title, this.callback, {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback(),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    );
  }
}
