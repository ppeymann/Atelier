import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.count,
    required this.activity,
    required this.types,
    required this.backgroundColor,
    required this.countColor,
    required this.activityColor,
    required this.typesColor,
  });

  final int count;
  final String activity;
  final String types;
  final Color backgroundColor;
  final Color countColor;
  final Color activityColor;
  final Color typesColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 200,
      height: 120,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$count",
            style: TextStyle(
              color: countColor,
              fontSize: 30,
              fontFamily: "monro",
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            activity,
            style: TextStyle(
              color: activityColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            types,
            style: TextStyle(
              color: typesColor,
              fontSize: 12,
              // fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
