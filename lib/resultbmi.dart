// ignore_for_file: prefer_const_constructors

import 'package:bmi/bmiapp.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class rsbmi extends StatelessWidget {
  const rsbmi({ Key? key, required this.selected, required this.height, required this.weight,required this.age}) : super(key: key);
  final bool selected;
  final int height;
  final int weight;
  final int age;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: resultbmi(selected: selected,height: height,weight: weight,age: age,),
      theme: ThemeData.dark(),
    );
  }
}
// ignore: camel_case_types
class resultbmi extends StatefulWidget {
  const resultbmi({ Key? key ,
      required this.selected,
      required this.height,
      required this.weight,
      required this.age}) : super(key: key);
  final bool selected;
  final int height;
  final int weight;
  final int age;
  @override
  _resultbmiState createState() => _resultbmiState();
}

// ignore: camel_case_types
class _resultbmiState extends State<resultbmi> {
  late bool gt=widget.selected;
  late int h=widget.height;
  late int w=widget.weight;
  late int a=widget.age;
  
  @override
  void initState(){
    super.initState();
    dynamic rs=w * 100 * 100 / (h * h);
    // ignore: avoid_print
    print("$rs");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kết quả BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((w*100*100/(h*h)).toStringAsFixed(2),style: TextStyle(color: Colors.white,fontSize: 50),),
            if(w * 100 * 100 / (h * h) < 18.5)(
              Text(
                  'Cân nặng thấp (Gầy)',
                  style: TextStyle(color: Colors.blue[100], fontSize: 60),textAlign: TextAlign.center,
                )
            )
            else if(w * 100 * 100 / (h * h) >= 18.5 && w * 100 * 100 / (h * h) <= 24.9)(
              Text(
                  'Bình thường',
                  style: TextStyle(color: Colors.green[300], fontSize: 60),
                )
            ) 
            else if(w * 100 * 100 / (h * h) >= 25 &&
                w * 100 * 100 / (h * h) <= 29.9)(
              Text(
                  'Thừa cân',
                  style: TextStyle(color: Colors.yellow, fontSize: 60),
                )
            ) 
            else if(w * 100 * 100 / (h * h) >= 30 &&
                w * 100 * 100 / (h * h) <= 34.9)(
              Text(
                  'Béo phì độ I',
                  style: TextStyle(color: Colors.red[400], fontSize: 60),
                )
            ) 
            else if(w * 100 * 100 / (h * h) >= 35 &&
                w * 100 * 100 / (h * h) <= 39.9)(
              Text(
                  'Béo phì độ II',
                  style: TextStyle(color: Colors.red, fontSize: 60),
                )
            )
            else(
              Text(
                  'Béo phì độ III',
                  style: TextStyle(color: Colors.red[600], fontSize: 60),
                )
            )  
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.red[400],
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BMIapp();
              }));
            },
            child: Text(
              "Re-Calculate",
              style: TextStyle(fontSize: 50, color: Colors.blue[900]),
            ),
          ),
        ),
      ),
    );
  }
}