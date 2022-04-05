import 'package:flutter/material.dart';
import 'constant.dart';

class ReusableExpanded extends StatelessWidget {
  ReusableExpanded({Key? key, required this.colour,required this.cardChild}) : super(key: key);
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,

      margin: EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,spreadRadius: 1.0,
          ),
        ],
      ),
    );
  }
}