import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool turn = true;
  List <String> showOX = ['','','','','','','','',''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              ontapOX(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45)
              ),
              child: Center(
                child: Text(showOX[index], style: TextStyle(fontSize: 40.0),),),
            ),
          );
        }),
    );
  }

  void ontapOX(int index){
    setState(() {
      if(turn){
        showOX[index] = "O";
      }else{
        showOX[index] = "X";
      }

      turn = !turn;
      checkWinner();

    });
  }

  void checkWinner(){
    if(showOX[0] == showOX[1] &&
       showOX[1] == showOX[2] &&
       showOX[0] != '')
      {
        displayWinMsg(showOX[0]);  // R1
    }
    if(showOX[3] == showOX[4] &&
       showOX[4] == showOX[5] &&
       showOX[3] != '')
      {
        displayWinMsg(showOX[3]);  // R2
    }
    if(showOX[6] == showOX[7] &&
       showOX[7] == showOX[8] &&
       showOX[6] != '')
      {
        displayWinMsg(showOX[6]);  // R3
    }
    if(showOX[0] == showOX[3] &&
       showOX[3] == showOX[6] &&
       showOX[0] != '')
      {
        displayWinMsg(showOX[0]);  //C1
    }
    if(showOX[1] == showOX[4] &&
       showOX[4] == showOX[7] &&
       showOX[1] != '')
      {
        displayWinMsg(showOX[1]);  //C2
    }
    if(showOX[2] == showOX[5] &&
       showOX[5] == showOX[8] &&
       showOX[2] != '')
      {
        displayWinMsg(showOX[2]);  //C3
    }
    if(showOX[0] == showOX[4] &&
       showOX[4] == showOX[8] &&
       showOX[0] != '')
      {
        displayWinMsg(showOX[0]);  //D1
    }
    if(showOX[2] == showOX[4] &&
       showOX[4] == showOX[6] &&
       showOX[2] != '')
      {
        displayWinMsg(showOX[2]);  //D2
    }
  }

  void displayWinMsg(String winner){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Center(
            child: Text(winner + " WON ",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        );
      });
  }

}

