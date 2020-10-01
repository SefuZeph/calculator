import 'package:calculator/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MathFlowString extends StatelessWidget {
  final String mathFlowString;

  MathFlowString({Key key, @required this.mathFlowString})
      : assert(mathFlowString != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        mathFlowString,
        style: TextStyle(
            color: kYellow, fontSize: 30, fontWeight: FontWeight.w500),
      ),
    );
  }
}
