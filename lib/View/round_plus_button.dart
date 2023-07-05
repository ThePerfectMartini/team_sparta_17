import 'package:flutter/material.dart';
import 'package:team_sparta_17/Resource/AppColors.dart';

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
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: AppColors.blackColor,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }
}
