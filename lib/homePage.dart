import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool turn = true;
  List <String> showOX = ['','','','','','','','',''];

  var newTextStyle = TextStyle(fontSize: 25.0);

  int oscore = 0 , xscore = 0 , drawscore = 0 , filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text("Scoreboard",))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Player 1", style: newTextStyle,),
                                Text(oscore.toString(), style: newTextStyle,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Player 2", style: newTextStyle,),
                                Text(xscore.toString(), style: newTextStyle,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Draw", style: newTextStyle,),
                                Text(drawscore.toString(), style: newTextStyle,),
                              ],
                            ),
                          ),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  child: Center(
                    child:  Text("Tic Tac Toe",style: TextStyle(fontSize: 36.0,letterSpacing: 4.0))
                  ),
                ),
              ),
            ),
             Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: FlatButton(
                      child: Text('Reset Game',style: TextStyle(fontSize: 20),),
                      onPressed:(){
                        displayResetMsg();
                      }
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
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
    else if(showOX[3] == showOX[4] &&
       showOX[4] == showOX[5] &&
       showOX[3] != '')
      {
        displayWinMsg(showOX[3]);  // R2
    }
    else if(showOX[6] == showOX[7] &&
       showOX[7] == showOX[8] &&
       showOX[6] != '')
      {
        displayWinMsg(showOX[6]);  // R3
    }
    else if(showOX[0] == showOX[3] &&
       showOX[3] == showOX[6] &&
       showOX[0] != '')
      {
        displayWinMsg(showOX[0]);  //C1
    }
    else if(showOX[1] == showOX[4] &&
       showOX[4] == showOX[7] &&
       showOX[1] != '')
      {
        displayWinMsg(showOX[1]);  //C2
    }
    else if(showOX[2] == showOX[5] &&
       showOX[5] == showOX[8] &&
       showOX[2] != '')
      {
        displayWinMsg(showOX[2]);  //C3
    }
    else if(showOX[0] == showOX[4] &&
       showOX[4] == showOX[8] &&
       showOX[0] != '')
      {
        displayWinMsg(showOX[0]);  //D1
    }
    else if(showOX[2] == showOX[4] &&
       showOX[4] == showOX[6] &&
       showOX[2] != '')
      {
        displayWinMsg(showOX[2]);  //D2
    }
    else if(filledBoxes == 9){
      displayDrawMsg();
      drawscore+=1;
    }
  }

   void displayResetMsg(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Center(
            child: Text("Are you sure ?", style: TextStyle(fontSize: 20)),
          ),
          actions: <Widget>[
            Center(
              child: FlatButton(
                child: Text("OK", style: TextStyle(fontSize: 15,color: Colors.pinkAccent),),
                onPressed: (){
                  Navigator.of(context).pop();
                  clearBoard();
                      setState(() {
                        drawscore = 0;
                        xscore = 0;
                        oscore = 0;
                      });
                },
              ),
            ),
          ],
        );
      }
    );
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

