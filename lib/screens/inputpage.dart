import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/componants/bottombutton.dart';
import 'package:bmi_calculator/componants/roundiconbutton.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/componants/roundiconbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

import '../componants/gender_widget.dart';
import '../componants/reusable_card.dart';

enum GenderType {
  nothing,
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.nothing;
  int userHeight = 180;
  int userWeight = 60;
  int userAge = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    colour: selectedGender == GenderType.male
                        ? kactiveCardColor
                        : kbgcolour,
                    cardChild: const genderWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      genderName: 'Male',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    colour: selectedGender == GenderType.female
                        ? kactiveCardColor
                        : kbgcolour,
                    cardChild: const genderWidget(
                      genderIcon: FontAwesomeIcons.venus,
                      genderName: 'Female',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              colour: kbgcolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Height',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        userHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: userHeight.toDouble(),
                    min: 120.0,
                    max: 200.0,
                    onChanged: (double newValue) {
                      setState(() {
                        userHeight = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    colour: kbgcolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Weight',
                          style: klabelTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    colour: kbgcolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: klabelTextStyle,
                        ),
                        Text(
                          userAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          bottombutton(
            cta: 'Calculate',
            navigate: () {
              Calculator calc =
                  Calculator(height: userHeight, weight: userWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResults: calc.calculateBMI(),
                            resultInterpreter: calc.getInterpretation(),
                            resultText: calc.getResult(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
