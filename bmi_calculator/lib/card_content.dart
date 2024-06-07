import 'package:flutter/material.dart';


const _labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class CardContentIcon extends StatelessWidget {
  final IconData iconData;
  final String label;

  const CardContentIcon({required this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: _labelTextStyle,
        )
      ],
    );
  }
}