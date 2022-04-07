import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

class bottombutton extends StatelessWidget {
  const bottombutton({
    Key? key,
    required this.cta,
    required this.navigate,
  }) : super(key: key);

  final String cta;
  final Function() navigate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
        color: kpinkColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Center(
          child: Text(
            cta,
            textAlign: TextAlign.center,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
