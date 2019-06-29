import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/fragments/image_preview.dart';
import 'dart:io';
import 'dart:convert';

import 'package:test_app/model/pixabay_model.dart';

class PaginationPage extends StatefulWidget {
  PaginationPage({Key key}) : super(key: key);

  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  List<Hit> _imageList = List<Hit>();
  ScrollController _scrollController = ScrollController();
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getImages(page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page += 1;

        print('Scroll pos $_scrollController.position');
        print('Length ${_imageList.length}');

        print(page);
        getImages(page);
        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              Hit hit = _imageList[index];

              return Hero(
                tag: hit.largeImageUrl,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagePreview(hit)));
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.60,
                      margin: EdgeInsets.all(4),
                      // color: Colors.black,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                hit.webformatUrl,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isLoading
                ? Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                        Text(
                          'Loading..',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.only(
                      left: 4,
                      right: 4,
                      top: 16,
                      bottom: 16,
                    ),
                    width: 175,
                    // height: 45,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.blue,width: 4),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  void getImages(int _page) async {
    final response = await http.get(
        'https://pixabay.com/api?key=12900320-f89616c91146daffabb68bab0&page=$page',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
        });
    if (response.statusCode == 200) {
      PixabayModel pixabayModel =
          PixabayModel.fromJson(json.decode(response.body));
      // print(pixabayModel.toJson());

      if (pixabayModel.totalHits > 0) {
        setState(() {
          _imageList.addAll(pixabayModel.hits);
          isLoading = false;
        });
      }
    } else {}
  }
}
