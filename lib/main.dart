import 'package:flutter/material.dart';
import 'input.dart';
import 'gender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';

final active = Color(0xFF1D1E33);
final inactive = Color(0xFF111328);
enum Genders { male, female }
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // change(Genders i) {
  // if (i == Genders.male) {
  //   if (malesel == inactive) {
  //     malesel = active;
  //     femalesel=inactive;
  //   } else {
  //     malesel = inactive;

  //   }
  // } else if (i == Genders.female) {
  //   if (femalesel == inactive) {
  //     femalesel = active;
  //     malesel=inactive;
  //   } else {
  //     femalesel = inactive;
  //   }
  // }

  // }
  var height = 180;
  var weight = 60;
  var age = 18;

  Genders gndr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: gender(
                      press: () {
                        setState(() {
                          gndr = Genders.male;
                        });
                      },
                      gicon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      str: "Male",
                      clr: gndr == Genders.male ? active : inactive,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                        child: gender(
                      press: () {
                        setState(() {
                          gndr = Genders.female;
                        });
                      },
                      gicon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      str: "Female",
                      clr: gndr == Genders.female ? active : inactive,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: inactive,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Height",
                        style: Txt,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Center(
                            child: Text(
                              "$height",
                              style: Knum,
                            ),
                          ),
                          Text(
                            'cm',
                            style: Txt,
                          )
                        ]),
                    SliderTheme(
                      data: SliderThemeData(
                          overlappingShapeStrokeColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          activeTrackColor: Colors.purple,
                          inactiveTrackColor: Colors.purple[100],
                          thumbColor: Colors.pink,
                          overlayColor: Color(0x29AF1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newvalue) {
                          print(newvalue);
                          setState(() {
                            height = newvalue.toInt();
                          });
                        },
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Center(
                            child: Text(
                          "Weight",
                          style: Txt,
                        )),
                        Center(
                            child: Text(
                          "$weight",
                          style: Knum,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              press: () {
                                 if(weight<0){
                                  setState(() {
                                  
                                  weight = 0;
                                });
                                }else{
                                setState(() {
                                  weight -= 1;
                                });}
                              },
                              kid: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconBtn(
                              press: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              kid: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.purple,
                              ),
                            )
                          ],
                        )
                      ]),
                  colour: inactive,
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: Txt,
                      ),
                      Text(
                        "$age",
                        style: Knum,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              press: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              kid: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconBtn(
                              press: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              kid: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.purple,
                              ),
                            )
                          ])
                    ],
                  ),
                  colour: inactive,
                ),
              ),
              
            ],
          )),
          GestureDetector(
                onTap: (){
                  CalculatorBrain cal=CalculatorBrain(height:height,weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmiresult: cal.calculateBMI(), resultinter: cal.getInterpretation(), resulttxt: cal.getResult())));

                },
                child: Container(
                  
                  width: 500,
                  color: Colors.pink,
                  height: 50.0,
                  child:Center(child:Text('Calculate',style:Kbtn ,))
                ),
              )

        ]));
  }
}

class RoundIconBtn extends StatelessWidget {
  Function press;
  Widget kid;
  RoundIconBtn({this.press, this.kid});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      disabledElevation: 50.0,
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      fillColor: Colors.white,
      onPressed: press,
      child: Center(child: kid),
    );
  }
}
