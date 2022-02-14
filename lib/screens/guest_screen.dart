import 'package:flutter/material.dart';

class GuestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Logged in as a Guest'),
        ),
      ),
    );
  }
}
