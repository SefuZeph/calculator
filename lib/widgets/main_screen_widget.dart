import 'package:calculator/dimensions.dart';
import 'package:calculator/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key key}) : super(key: key);

  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  double _switchButtonPositionY = 58.0;

  // change application background color
  Color getSwitchBackgroundYellowToBlack() {
    return Color.lerp(
        kBlack, kYellow, (_switchButtonPositionY - 19) / (58.0 - 19));
  }

  Color getSwitchButtonBlackToYellow() {
    return Color.lerp(
        kYellow, kLBlack, (_switchButtonPositionY - 19) / (58.0 - 19));
  }

  Color getSwitchScaffoldBlackToWhite() {
    return Color.lerp(
        kLBlack, kWhite, (_switchButtonPositionY - 19) / (58.0 - 19));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getSwitchScaffoldBlackToWhite(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: kPaddingM,
                    top: kPaddingM,
                    child: Container(
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                          color: getSwitchBackgroundYellowToBlack(),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            FontAwesomeIcons.solidSun,
                            size: 16,
                          ),
                          Icon(
                            FontAwesomeIcons.solidMoon,
                            size: 16,
                            color: kYellow,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18.5,
                    top: _switchButtonPositionY,
                    child: GestureDetector(
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        _switchButtonPositionY += details.delta.dy;
                        _switchButtonPositionY =
                            _switchButtonPositionY.clamp(19.0, 58.0);
                        print(_switchButtonPositionY);
                        setState(() {});
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: kBlack.withOpacity(0.25),
                                  blurRadius: 2,
                                  offset: Offset(0, 3))
                            ],
                            color: getSwitchButtonBlackToYellow(),
                            borderRadius: BorderRadius.circular(17.5)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
