import 'package:calculator/dimensions.dart';
import 'package:calculator/styles.dart';
import 'package:calculator/widgets/buttons/arithmetic_button.dart';
import 'package:calculator/widgets/buttons/plain_button.dart';
import 'package:calculator/widgets/model/model.dart';
import 'package:calculator/widgets/text/math_flow.dart';
import 'package:calculator/widgets/text/results.dart';
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

  Color getSwitchNormalTextBlackToWhite() {
    return Color.lerp(
        kWhite, kLBlack, (_switchButtonPositionY - 19) / (58.0 - 19));
  }

  Color getSwitchArithmeticButtonYellowOpacityToGrey() {
    return Color.lerp(kYellowOpacity, kGreyOpacity,
        (_switchButtonPositionY - 19) / (58.0 - 19));
  }

  GridArithmeticModel arithmeticModel = GridArithmeticModel();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
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
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: kPaddingX, top: kPaddingM),
                        child: ResultsString(
                          resultString: "54",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: kPaddingX, top: kPaddingM),
                        child: MathFlowString(
                          mathFlowString: "35 + 25 - 6",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 30,
                      child: GridView.builder(
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 30, top: 16),
                            child: PlainButton(
                              plainButtonText:
                                  arithmeticModel.arithmeticNumber[index],
                              color: index == 0
                                  ? kYellow
                                  : getSwitchNormalTextBlackToWhite(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 30,
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          getSwitchArithmeticButtonYellowOpacityToGrey()),
                                  child: ArithmeticButton(
                                    arithmeticIcon:
                                        arithmeticModel.arithmeticIcon[index],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlainButton(
                      plainButtonText: "0",
                      color: getSwitchNormalTextBlackToWhite(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: PlainButton(
                        plainButtonText: ".",
                        color: getSwitchNormalTextBlackToWhite(),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:
                              getSwitchArithmeticButtonYellowOpacityToGrey()),
                      child: ArithmeticButton(
                        arithmeticIcon: FontAwesomeIcons.equals,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
