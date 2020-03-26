import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild});
  Color colour;
  Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: colour),
            child: cardChild),
      ),
    );
  }
}
