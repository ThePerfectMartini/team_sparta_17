import 'package:flutter/material.dart';

class RoundCrossButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;

  RoundCrossButton({required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(198, 219, 218, 1.0),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }
}
