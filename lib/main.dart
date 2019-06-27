import 'package:flutter/material.dart';
import 'second_page.dart';
import 'home_page.dart';
import 'login.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      routes: {
        'second-page' : (BuildContext context) => Secondpage(), 
        'home-page' : (BuildContext context) => HomePage(), 
        '/' : (context) => LoginPage()
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



