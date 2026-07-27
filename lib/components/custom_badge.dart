import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final Color bkColor;
  final Color txColor;
  final String txt;

  const CustomBadge({
    super.key,
    required this.bkColor,
    required this.txColor,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: bkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: txColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
