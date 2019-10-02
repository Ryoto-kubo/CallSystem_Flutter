import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Container(
                  child: Image.asset('images/people.png'),
                  width: 300.0,
                  height: 300.0,
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '現在の待ち組数',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.grey[800]
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: Text(
                            '3',
                            style:TextStyle(
                              fontSize: 180.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[700],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 120.0, left: 30.0),
                          child: Text(
                            '名',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.grey[800]
                            ),
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row( //button
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Container(
                  width: 660.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.cyan[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Text(
                      '受付する',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ],
          ),
          Row( //border
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 900.0,
                child: Divider(
                  color: Colors.grey[800]
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}