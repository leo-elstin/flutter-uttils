import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  Bottomnavigation({Key key}) : super(key: key);

  _BottomnavigationState createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         bottomNavigationBar: BottomAppBar(
          //  color: Colors.pink,
           child: Row(
             children: <Widget>[
               IconButton(
                 onPressed: () {},
                 icon: Icon(Icons.home),
               )
             ],
           ),
         ),
       ),
    );
  }
}