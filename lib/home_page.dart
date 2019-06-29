import 'package:flutter/material.dart';
import 'package:test_app/fragments/bottom_navigation.dart';
import 'package:test_app/fragments/pagination.dart';
import 'package:test_app/network_call_1.dart';

import 'fragments/home_fragment.dart';
import 'fragments/image_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _widget = ListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _widget,
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text('Hello'),
      //   tooltip: 'hello',
      //   icon: Icon(Icons.person),
      //   onPressed: () {
      //     // Navigator.pushNamed(context, 'second-page');
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             'Hellooo',
      //           ),
      //           actions: <Widget>[
      //             ButtonBar(
      //               children: <Widget>[
      //                 RaisedButton(
      //                   child: Text(
      //                     'Yes',
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //                 RaisedButton(
      //                   child: Text(
      //                     'Cancel',
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   onPressed: () => Navigator.of(context).pop(),
      //                 )
      //               ],
      //             ),
      //           ],
      //         );
      //       },
      //     );
      //   },
      // ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                height: 250,
              ),
            ),
            ListTile(
              onTap: () {
                changeWidget('ListView', ListPage());
              },
              title: Text('ListView'),
              leading: Icon(
                Icons.list,
                color: Colors.red,
              ),
              subtitle: Text(
                'Listview Examples',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                changeWidget('ListView', ImageView());
              },
              title: Text('Images'),
              leading: Icon(
                Icons.image,
                color: Colors.green,
              ),
              subtitle: Text(
                'Loading image from url & asset',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
             ListTile(
              onTap: () {
                changeWidget('HTTP', NetowrkList());
              },
              title: Text('HTTP'),
              leading: Icon(
                Icons.pages,
                color: Colors.blue,
              ),
              subtitle: Text(
                'Populating list from url',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
             ListTile(
              onTap: () {
                changeWidget('BottomBar', Bottomnavigation());
              },
              title: Text('Bottom Bar'),
              leading: Icon(
                Icons.pageview,
                color: Colors.pink,
              ),
              subtitle: Text(
                'Bottom Navigation example',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),

             ListTile(
              onTap: () {
                changeWidget('Pagination', PaginationPage());
              },
              title: Text('Pagination Example'),
              leading: Icon(
                Icons.view_array,
                color: Colors.orange,
              ),
              subtitle: Text(
                'Paginating through a list of images',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeWidget(String name, Widget child) {
    setState(() {
      _widget = child;
    });
    Navigator.pop(context);
  }
}
