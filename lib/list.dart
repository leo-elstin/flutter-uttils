import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datamodel.dart';
import 'dart:convert';

class Listpage extends StatefulWidget {
  const Listpage({Key key}) : super(key: key);
  @override
  _ListpageState createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  ScrollController _scrollController = ScrollController();

  List<OfferList> _list = [];

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('Yes');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: _list.length > 0
            ? ListView.builder(
                controller: _scrollController,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  OfferList data = _list[index];

                  return ListTile(
                    title: Text(data.offer),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void getData() async {
    var data =
        await http.get('https://limo-9264.firebaseio.com/home_offers.json');
    DataResponse datamodel = DataResponse.fromJson(json.decode(data.body));
    print(datamodel.status);
    setState(() {
      _list = datamodel.offerList;
    });
  }
}
