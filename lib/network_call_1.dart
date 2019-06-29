import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'service/api_service.dart';
import 'datamodel.dart';

class NetowrkList extends StatefulWidget {
  const NetowrkList({Key key}) : super(key: key);

  @override
  _NetowrkListState createState() => _NetowrkListState();
}

class _NetowrkListState extends State<NetowrkList> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('Yes');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        
        child: FutureBuilder(
          future: getData(),
          builder:
              (BuildContext context, AsyncSnapshot<DataResponse> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller:  _scrollController,
                itemCount: snapshot.data.offerList.length,
                itemBuilder: (context, index) {
                  OfferList data = snapshot.data.offerList[index];
                  return ListTile(
                    onTap:  () {
                      
                    },
                    trailing: Icon(Icons.check_box),
                    title: Text(data.des),
                    subtitle: Text(data.cash),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.image)
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Data not found'),
              );
            }
          },
        ),
      ),
    );
  }
}
