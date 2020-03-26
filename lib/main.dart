import 'package:flutter/material.dart';
import 'input.dart';
import 'gender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final active = Color(0xFF1D1E33);
final inactive = Color(0xFF111328);
enum Genders {male,female}
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
  change(Genders i) {
    if (i == Genders.male) {
      if (malesel == inactive) {
        malesel = active;
        femalesel=inactive;
      } else {
        malesel = inactive;
        
      }
    } else if (i == Genders.female) {
      if (femalesel == inactive) {
        femalesel = active;
        malesel=inactive;
      } else {
        femalesel = inactive;
      }
    }
  }

  var malesel = inactive;
  var femalesel = inactive;
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          change(Genders.male);
                        });
                      },
                      child: gender(
                        gicon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        str: "Male",
                        clr: malesel,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          change(Genders.female);
                        });
                      },
                      child: gender(
                        gicon: Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        str: "Female",
                        clr: femalesel,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: inactive,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: inactive,
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  colour: inactive,
                ),
              ),
            ],
          ))
        ]));
  }
}
