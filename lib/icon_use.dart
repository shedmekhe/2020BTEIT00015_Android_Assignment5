import 'dart:ui';

import 'package:flutter/material.dart';
import 'constant.dart';
class IconContent extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IconContent({required this.icon1,required this.label});
  final IconData icon1;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10.0),
        Center(
          child: Icon(
            icon1,
            size: 65,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(label,style:labelTextStyle),
      ],
    );
  }
}

