import 'package:flutter/material.dart';

class PaginationPage extends StatefulWidget {
  PaginationPage({Key key}) : super(key: key);

  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            
          );
        },
      ),
    );
  }
}
