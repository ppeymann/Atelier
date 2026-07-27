import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final double size;
  final Color textColor;

  const CustomAvatar({
    super.key,
    required this.initials,
    this.backgroundColor = Colors.blue,
    this.size = 50,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor,
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
