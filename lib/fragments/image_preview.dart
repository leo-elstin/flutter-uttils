import 'package:flutter/material.dart';
import 'package:test_app/model/pixabay_model.dart';

class ImagePreview extends StatelessWidget {
  final Hit hit;
  ImagePreview(this.hit);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Hero(
                tag: hit.largeImageUrl,
                child: Image.network(
                  hit.largeImageUrl,
                  fit: BoxFit.cover,
                  // loadingBuilder: (context, child, event) {
                  //   return event == null
                  //       ? child
                  //       : Center(
                  //           child: SizedBox(
                  //             width: 32,
                  //             height: 32,
                  //             child: CircularProgressIndicator(),
                  //           ),
                  //         );
                  // },
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.all(32),
            //   child: IconButton(
            //     onPressed: () => Navigator.pop(context),
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ],
        ),
      
    );
  }
}
