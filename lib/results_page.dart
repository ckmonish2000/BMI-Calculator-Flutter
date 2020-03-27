import 'package:flutter/material.dart';
import 'constants.dart';
import 'input.dart';


class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiresult,@required this.resultinter,@required this.resulttxt});
  final String bmiresult;
  final String resulttxt;
  final String resultinter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          ),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Container(
              child: Text("Your Result", style: Ktitle),
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: active,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      '$resulttxt',
                      style: Resultstyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      "$bmiresult",
                      style: Ktitle2,
                    ),
                  ),
                  Text("$resultinter",style:Txt,textAlign: TextAlign.center,)
                ],
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  
                  Navigator.pop(context);
                },
                child: Container(
                  width: 500,
                  color: Colors.pink,
                  child: Center(
                      child: Text(
                    "Re-Calculate",
                    style: Kbtn,
                  )),
                )),
          )
        ]));
  }
}
