import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/guest_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context)=> WelcomeScreen(),
        "/guest" : (context)=> GuestScreen(),
        "/admin": (context)=> AdminScreen()
      },
      initialRoute: "/",
    );
  }
}
