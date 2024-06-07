import 'package:bmi_calculator/domain/model/gender_enum.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  GenderEnum? selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                  child: ReusableCard(
                backgroundColor: selectedGender == GenderEnum.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: CardContentIcon(
                    iconData: FontAwesomeIcons.mars, label: "MALE"),
                onCardClicked: () {
                  setState(() {
                    selectedGender = GenderEnum.male;
                  });
                },
              )),
              Expanded(
                  child: ReusableCard(
                backgroundColor: selectedGender == GenderEnum.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: CardContentIcon(
                    iconData: FontAwesomeIcons.venus, label: "FEMALE"),
                onCardClicked: () {
                  setState(() {
                    selectedGender = GenderEnum.female;
                  });
                },
              ))
            ])),
            Expanded(
                child: ReusableCard(
              backgroundColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kContentTextStyle),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: ReusableCard(
                backgroundColor: kActiveCardColor,
              )),
              Expanded(
                  child: ReusableCard(
                backgroundColor: kActiveCardColor,
              )),
            ])),
            Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
