
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: (
                  Text("Tic Tac Toe",style: TextStyle(fontSize: 50.0,letterSpacing: 4))
                )
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AvatarGlow(
                  animate: true,
                  shape: BoxShape.circle,
                  curve: Curves.fastOutSlowIn,
                  startDelay: Duration(milliseconds: 1000),
                  glowColor: Colors.black38,
                  endRadius: 150.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8,
                    shape: CircleBorder(),
                      child: CircleAvatar(
                        child: Image.asset('assets/images/xo_logo.png',                
                        fit: BoxFit.fill,
                        ),
                      radius: 80.0,
                    ),
                    
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      child: Text("Play Game", style: TextStyle(fontSize: 30.0)),
                      onPressed: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> HomePage()),
                         );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}