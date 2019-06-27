import 'package:test_app/datamodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DataResponse> getData() async {
  var data =
      await http.get('https://limo-9264.firebaseio.com/home_offers.json');
  DataResponse datamodel = DataResponse.fromJson(json.decode(data.body));

  if(data.statusCode == 200) {
    return datamodel;
  } else return DataResponse();

}
