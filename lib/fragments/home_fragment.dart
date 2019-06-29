import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<DataModel> _myList = [
    DataModel('Leo', "Nagercoil"),
    DataModel('Akhil', "Kerala"),
    DataModel('Abhijth', "Trivanduram"),
    DataModel('Akarsh', "Calicut"),
    DataModel('Sruthi', "Kottayam"),
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print('Yes');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: ListView.separated(
        itemCount: _myList.length,
        controller: _scrollController,
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
    ));
  }
}

class DataModel {
  String name;
  String city;
  DataModel(this.name, this.city);
}
