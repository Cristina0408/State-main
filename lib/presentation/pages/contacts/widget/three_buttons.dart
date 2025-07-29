import 'package:flutter/material.dart';

class ThreeButtons extends StatelessWidget {
  final void Function()? onFirstPressed;
  final void Function()? onSecondPressed;
  final void Function()? onThirdPressed;

  final String firstLabel;
  final String secondLabel;
  final String thirdLabel;

  const ThreeButtons({
    super.key,
    this.onFirstPressed,
    this.onSecondPressed,
    this.onThirdPressed,
    this.firstLabel = 'Botón 1',
    this.secondLabel = 'Botón 2',
    this.thirdLabel = 'Botón 3',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: onFirstPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.transparent,
          ),
          child: Text(firstLabel),
        ),
        TextButton(
          onPressed: onSecondPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.transparent,
          ),
          child: Text(secondLabel),
        ),
        TextButton(
          onPressed: onThirdPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.transparent,
          ),
          child: Text(thirdLabel),
        ),
      ],
    );
  }
}
