import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget? cardChild;
  final Function()? onCardClicked;

  const ReusableCard(
      {super.key, required this.backgroundColor, this.cardChild, this.onCardClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onCardClicked != null) ? onCardClicked : null,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
