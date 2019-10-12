import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:callsystem/button/button_container.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: animation,
      // child: AnimatedOpacity(
        // opacity: 1.0,
        // duration: Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _waitingInfo(),
            ButtonContainer(
              buttonText:      '受付へすすむ',
              buttonTextColor: Color(0xFFFFFFFF),
              buttonColor:     Color(0xFF53C9C5),
              buttonBackColor: Color(0xFF008B8B),
              buttonWidth:     660.0,
              buttonHeight:    120.0,
              topPosition:     0.0,
              isDisabled:      true,
            ),
            _border(),
            _nowCallingNumber(),
          ]
        ),
      ),
    );
  }

  Widget _waitingInfo(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image.asset('images/people.png'),
          width: 300.0,
          height: 300.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 80.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  '現在の待ち組数',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(0xFF232323)
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 180.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3163ED)
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120.0, left: 30.0),
                    child: Text(
                      '名',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xFF232323)
                      ),
                    )
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _border(){
    return  Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: 1000.0,
              child: Divider(
                color: Colors.grey[800]
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
  
  Widget _nowCallingNumber(){
    return  Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                '現在呼び出し中の番号はこちらの番号です',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Color(0xFF232323)
                )
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3163ED)
                )
              ),
            ),
          ],
        )
      ],
    );
  }

}