import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<DataModel> _myList = [
    DataModel('Leo', "Nagercoil"),
    DataModel('Akhil', "Kerala"),
    DataModel('Abhijth', "Trivanduram"),
    DataModel('Akarsh', "Calicut"),
    DataModel('Sruthi', "Kottayam"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
        actions: <Widget>[
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _myList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_myList[index].name),
            subtitle: Text(_myList[index].city),
            leading: Icon(Icons.person),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return index == 3
              ? LimitedBox(
                  maxHeight: 4,
                  child: Container(
                    color: Colors.black,
                  ),
                  maxWidth: 4,
                )
              : Container();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Hello'),
        tooltip: 'hello',
        icon: Icon(Icons.person),
        onPressed: () {
          // Navigator.pushNamed(context, 'second-page');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Hellooo',
                ),
                actions: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
      drawer: Drawer(),
    );
  }
}

class DataModel {
  String name;
  String city;
  DataModel(this.name, this.city);
}
