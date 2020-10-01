import 'package:calculator/styles.dart';
import 'package:flutter/material.dart';

class ArithmeticButton extends StatelessWidget {
  final IconData arithmeticIcon;

  const ArithmeticButton({Key key, this.arithmeticIcon})
      : assert(arithmeticIcon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      arithmeticIcon,
      color: kYellow,
      size: 20,
    );
  }
}
