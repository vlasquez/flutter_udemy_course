import 'package:bmi_calculator/domain/model/bmi.dart';
import 'package:bmi_calculator/domain/model/gender_enum.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_content.dart';
import 'widget/bottom_button.dart';
import 'widget/rounded_icon_button.dart';
import 'domain/calculate_bmi_usecase.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  GenderEnum? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

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
                cardChild: const CardContentIcon(
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
                cardChild: const CardContentIcon(
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
                  const Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kContentTextStyle),
                      const Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x15EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
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
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kContentTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () => {
                            setState(() {
                              if (weight > 0) weight--;
                            })
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => {
                            setState(() {
                              weight++;
                            })
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                backgroundColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kContentTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () => {
                            setState(() {
                              if (age > 1) age--;
                            })
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => {
                            setState(() {
                              age++;
                            })
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
            ])),
            BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBmiUseCase calculatorBmiUseCase =
                      CalculatorBmiUseCase(height: height, weight: weight);

                  Navigator.pushNamed(context, '/results',
                      arguments: Bmi(
                        bmi: calculatorBmiUseCase.calculateBMI(),
                        resultText: calculatorBmiUseCase.getResult(),
                        interpretation:
                            calculatorBmiUseCase.getInterpretation(),
                      ));
                }),
          ],
        ));
  }
}
