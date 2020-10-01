import 'package:calculator/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultsString extends StatelessWidget {
  final String resultString;

  ResultsString({Key key, @required this.resultString})
      : assert(resultString != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        resultString,
        style: TextStyle(
            color: kYellow, fontSize: 80, fontWeight: FontWeight.w700),
      ),
    );
  }
}
