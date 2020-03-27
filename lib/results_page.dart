import 'package:flutter/material.dart';
import 'constants.dart';
import 'input.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          ),
        ),
        body: Column(children: [
          Text("hello"),
          ReuseableCard(
            colour: active,
            cardChild: Center(child: Text("hello")),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Container(
            child: Text("Go Back"),
          ))
        ]));
  }
}
