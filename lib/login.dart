import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String dropdownValue = 'One';
  String _phone = '';
  String _password = '';
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text('Login'),
      ),
      body: Center(
        child: Card(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Text('Please Login to proceed.'),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: TextField(
                  onChanged: (value) {
                    _phone = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                      prefix: Text('+91 '),
                      prefixIcon: Icon(Icons.phone)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  obscureText: _hidePassword,
                  onChanged: (sruthi) {
                    _password = sruthi;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.black,
                onPressed: () {
                  print('$_phone $_password');
                  Navigator.pushNamed(context, 'home-page');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
