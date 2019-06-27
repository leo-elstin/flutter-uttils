import 'package:flutter/material.dart';
import 'service/api_service.dart';
import 'datamodel.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List2'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder:
              (BuildContext context, AsyncSnapshot<DataResponse> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
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
