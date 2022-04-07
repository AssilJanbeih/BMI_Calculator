import 'package:bmi_calculator/componants/bottombutton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/componants/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResults,
      required this.resultText,
      required this.resultInterpreter})
      : super(key: key);

  final String bmiResults;
  final String resultText;
  final String resultInterpreter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              colour: kbgcolour,
              onPress: () {},
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResults,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultInterpreter,
                    style: kInterpretationTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          bottombutton(
            cta: 'Re-Calculate',
            navigate: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
