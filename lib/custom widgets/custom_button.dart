import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   String title;
   Function callback;
   Color colour;

  CustomButton(this.title,  this.colour,   this.callback);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),

      elevation: 5.0,
      onPressed: callback(),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0
        ),
      ),
      color: colour,

    );
  }
}
