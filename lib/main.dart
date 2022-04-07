import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/inputpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: kpinkColor,
          inactiveTrackColor: ktextColor,
          overlayColor: kpinkColorLessOpacity,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
        ),
        primaryColor: const Color(0XFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
