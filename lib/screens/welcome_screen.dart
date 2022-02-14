import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('69Lib Client'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Center(
                child: Hero(
                  tag: "69",
                  child: Text(
                    '69Lib Client',
                    style: TextStyle(
                        fontSize: 80.0,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Card(
                child: InkWell(
                  child: Center(child: Text('GUEST')),
                  onTap: (){},
                ),
                color: Colors.teal,
                elevation: 5.0,
              ),
              Card(
                child: InkWell(
                  child: Center(child: Text('ADMIN')),
                  onTap: (){},
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                ),
                color: Colors.teal,
                elevation: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
