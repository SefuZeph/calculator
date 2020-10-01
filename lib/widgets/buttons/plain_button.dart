import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final String plainButtonText;
  final Color color;

  const PlainButton({Key key, this.plainButtonText, this.color})
      : assert(plainButtonText != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      plainButtonText,
      style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 22),
    );
  }
}
