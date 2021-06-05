import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new loginstate();
  }
}

class loginstate extends State<login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            //image/profile
            new Image.asset(
              'image/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),

            //form

            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white60,
              child: new Column(
                children: [
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock),
                    ),
                  ),

                  //padding for ElevatedButton
                  new Padding(padding: new EdgeInsets.all(8.5)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new ElevatedButton(
                            onPressed: _showWelcome,
                            child: new Text("Login"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              textStyle: TextStyle(
                                fontSize: 16.9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 150.0),
                          child: new ElevatedButton(
                            onPressed: _erase,
                            child: new Text("Clear"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              textStyle: TextStyle(
                                fontSize: 16.9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //form ends here

            new Padding(padding: const EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome $_welcomeString",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//TextField used to input text from user.

//pubspec.yaml is used to set image asset.
//assets:
//     - image/face.png
// put it after uses-material-design: true

// controller used to fetch data which is input by user.
//TextEditingController is a inbuilt controller for an editable text field.
//hintText used as watermark in text field.
//InputDecoration used to decorate TextField decoration.
//new Image.asset, image is a directory and asset is image that is inside image directory.
