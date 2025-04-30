import 'package:flutter/material.dart';

class RecipeInfoRow extends StatelessWidget {
  final IconData firstIcon;
  final String firstText;
  final IconData secondIcon;
  final String secondText;

  const RecipeInfoRow({
    super.key,
    required this.firstIcon,
    required this.firstText,
    required this.secondIcon,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(firstIcon, size: 16, color: Colors.grey[800]),
        const SizedBox(width: 5),
        Text(firstText, style: _infoTextStyle),
        const SizedBox(width: 15),
        Icon(secondIcon, size: 16, color: Colors.grey[800]),
        const SizedBox(width: 5),
        Text(secondText, style: _infoTextStyle),
      ],
    );
  }

  static final TextStyle _infoTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    color: Colors.grey[800],
  );
}