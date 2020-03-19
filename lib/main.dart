import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData.dark(),
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

  var newTextStyle = TextStyle(fontSize: 25.0);

  int oscore = 0 , xscore = 0 , filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text("Player 1", style: newTextStyle,),
                        Text(oscore.toString(), style: newTextStyle,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text("Player 2", style: newTextStyle,),
                        Text(xscore.toString(), style: newTextStyle,),
                      ],
                    ),
                  ),
              ],),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: GridView.builder(
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
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: null,
            ),
          ),
        ],
      ),
    );
  }

  void ontapOX(int index){
    setState(() {
      if(turn && showOX[index]==''){
        showOX[index] = "O";
        filledBoxes+=1;

      }else if(!turn && showOX[index]==''){
        showOX[index] = "X";
        filledBoxes+=1;

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
    else if(filledBoxes == 9){
      displayDrawMsg();
    }
  }

  void displayDrawMsg(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Center(
            child: Text(" GAME DRAW ",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          actions: <Widget>[
            Center(
              child: FlatButton(
                child: Text("Play Again",style: TextStyle(color: Colors.pinkAccent, fontSize: 15),),
                onPressed: (){
                  clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      });
  }

  void displayWinMsg(String winner){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Center(
            child: Text(winner + " WON ",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          actions: <Widget>[
            Center(
              child: FlatButton(
                child: Text("Play Again",style: TextStyle(color: Colors.pinkAccent, fontSize: 15),),
                onPressed: (){
                  clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      });

    if(winner == 'O'){
      oscore+=1;
    }else if(winner == 'X'){
      xscore+=1;
    }

  }

  void clearBoard(){
    setState(() {
      showOX = ['','','','','','','','',''];
    });
    filledBoxes = 0;
  }

}

