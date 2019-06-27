import 'package:flutter/material.dart';
import 'second_page.dart';
import 'home_page.dart';
import 'login.dart';
import 'list2.dart';
import 'list.dart';
import 'sign_up.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      routes: {
        'second-page': (BuildContext context) => Secondpage(),
        'home-page': (BuildContext context) => HomePage(),
        'signup-page': (BuildContext context) => SignUpPage(),
        // '/': (context) => LoginPage()
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
