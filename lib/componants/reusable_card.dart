import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class reusableCard extends StatelessWidget {
  const reusableCard(
      {required this.colour, required this.cardChild, required this.onPress});
  final Color colour;

  final Widget cardChild;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: colour, //Color(0xFF1D1E33),
        ),
        child: cardChild,
      ),
    );
  }
}
