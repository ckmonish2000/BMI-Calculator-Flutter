import 'package:flutter/material.dart';
import 'input.dart';

class gender extends StatelessWidget {
  gender({this.gicon, this.str,this.clr,this.press});
  Icon gicon;
  String str;
  Color clr;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ReuseableCard(
      onPress: press,
      colour: clr,
      cardChild: Center(
        child: Container(
          child: Center(
            child: Column(children: [
              // Icon(FontAwesomeIcons.mars,size: 80,)
              Center(child: gicon),
              SizedBox(
                height: 10.0,
              ),
              // Center(child: Text("Male",style:TextStyle(color:Color(0xFF8D8E98))),)
              Center(child: Text(str, style: TextStyle(color: Color(0xFF8D8E98))))
            ]),
          ),
        ),
      ),
    );
  }
}
