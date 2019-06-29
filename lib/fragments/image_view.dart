import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Image.network(
                  'https://i.pinimg.com/originals/bc/c0/86/bcc0860537b4030e6e62fa0a38ef907b.jpg',
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent event) {
                    if(event == null) return child;
                    else 
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              // height: 150,
              child: Image.asset(
                'images/image1.jpeg',
                fit: BoxFit.cover,
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    ));
  }
}

// class ZigZagClipper extends CustomClipper<Path> {
//   // ClipType clipType;

//   // ZigZagClipper(this.clipType);

//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 4, size.height - 40, size.width / 2, size.height - 20);
//     path.quadraticBezierTo(
//         3 / 4 * size.width, size.height, size.width, size.height - 30);
//     path.lineTo(size.width, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }
