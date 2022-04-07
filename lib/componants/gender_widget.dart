import 'package:flutter/cupertino.dart';

Color textColor = const Color(0xFF8D8E98);

// ignore: camel_case_types
class genderWidget extends StatelessWidget {
  const genderWidget({required this.genderIcon, required this.genderName});
  final IconData genderIcon;
  final String genderName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          genderName,
          style: TextStyle(
            fontSize: 18.0,
            color: textColor,
          ),
        )
      ],
    );
  }
}
