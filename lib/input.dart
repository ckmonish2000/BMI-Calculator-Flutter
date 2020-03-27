import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild,this.onPress});
  Color colour;
  Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress ,
      child: Container(
        
        child: Center(
          child: Container(
            
              margin: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: colour),
              child: cardChild),
        ),
      ),
    );
  }
}
