// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: duplicate_ignore
void main(){
  // ignore: prefer_const_constructors
  runApp(TTTGame());
}
class TTTGame extends StatelessWidget {
  const TTTGame({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ttt(),
    );
  }
}
// ignore: camel_case_types
class ttt extends StatefulWidget {
  const ttt({ Key? key }) : super(key: key);

  @override
  _tttState createState() => _tttState();
}

// ignore: camel_case_types
class _tttState extends State<ttt> {
  late List<List<String>> table;
  String player='X';
  String setcell(String lastmove,int x,int y){
    table[x][y]=lastmove;
    return table[x][y];
  }
  Color getcellcolor(String value){
    switch (value) {
      case 'X':
      return Colors.red;
      case 'O':
      return Colors.black;
      default:
      return Colors.grey;
    }
  }
  Widget buildbutton(int x,int y){
    String value = '';
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      // ignore: prefer_const_constructors
      minimumSize: Size(120, 120),
      primary: getcellcolor(value),
      ),
      // ignore: prefer_const_constructors
      child: Text(value,style: TextStyle(color: Colors.white),),
      onPressed: () {
        print(player);
        if(value==''){
          final lastmove=player=='X'?'X':'O';
          value=setcell(lastmove,x,y);
          //cellcolor=player=='X'?Colors.red:Colors.black;
          player=player=='X'?'O':'X';
        }
      },
    ),
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildbutton(1,1),
              buildbutton(1,2),
              buildbutton(1,3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildbutton(2,1),
              buildbutton(2,2),
              buildbutton(2,3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildbutton(3,1),
              buildbutton(3,2),
              buildbutton(3,3),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.redAccent,
          child: TextButton(
            onPressed: (){runApp(TTTGame());},
            child: Text("Reset",style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}