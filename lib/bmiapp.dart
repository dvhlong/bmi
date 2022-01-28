// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bmi/resultbmi.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BMIapp());
}
class BMIapp extends StatelessWidget {
  const BMIapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: setbmi(),
      theme: ThemeData.dark(),
    );
  }
}
// ignore: camel_case_types
class setbmi extends StatefulWidget {
  const setbmi({ Key? key }) : super(key: key);

  @override
  _setBMIState createState() => _setBMIState();
}

// ignore: camel_case_types
class _setBMIState extends State<setbmi> {
  bool selected=false;
  int age=20;
  int height=160;
  int weight=60;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính BMI"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: (){
                      setState(() {
                        selected=!selected;
                      });
                    },
                    icon: selected?Icon(Icons.male,size: 100,color: Colors.amber,) : Icon(Icons.male,size: 100,)
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: (){
                      setState(() {
                        selected=!selected;
                      });
                    }, 
                    icon: selected
                        ? Icon(
                            Icons.female,
                            size: 100,
                            
                          )
                        : Icon(
                            Icons.female,
                            size: 100,
                            color: Colors.amber,
                          )
                    ),
                )
              ],
            )
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Age",style: TextStyle(fontSize: 30),),
                Text('$age',style: TextStyle(fontSize: 50),),
                Slider(
                  value: age.toDouble(),
                  min: 0.0,
                  max: 120.0,
                  onChanged: (newValue){
                    setState(() {
                      age=newValue.round();
                    });
                  }
                )
              ],
            ) 
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Height(cm)",style: TextStyle(fontSize: 30),),
                    Text('$height',style: TextStyle(fontSize: 50),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            child: Icon(
                                Icons.remove_circle,
                                size: 40,
                              ),
                            onTap: () {
                              setState(() {
                                height--;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (t) {
                                setState(() {
                                  height--;
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              _timer.cancel();
                            },
                            ),
                        ),
                    
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            child: Icon(Icons.add_circle, size: 40),
                            onTap: () {
                              setState(() {
                                height++;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (t) {
                                setState(() {
                                  height++;
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              _timer.cancel();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Weight(kg)",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text('$weight',style: TextStyle(fontSize: 50),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            child: Icon(Icons.remove_circle, size: 40),
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (t) {
                                setState(() {
                                  weight--;
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              _timer.cancel();
                            },
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: GestureDetector(
                              child: Icon(Icons.add_circle, size: 40),
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onTapDown: (TapDownDetails details) {
                                _timer = Timer.periodic(
                                    Duration(milliseconds: 100), (t) {
                                  setState(() {
                                    weight++;
                                  });
                                });
                              },
                              onTapUp: (TapUpDetails details) {
                                _timer.cancel();
                              },
                              onTapCancel: () {
                                _timer.cancel();
                              },
                            ),
                          )
                      ],
                    )
                  ]
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.red[400],
          child: TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return rsbmi(age: age,selected: selected,height: height,weight: weight,);
              }));
            },
            child: Text("Calculate",style: TextStyle(fontSize: 50,color: Colors.blue[900]),),
          ),
        ),
      ),
    );
  }
}

