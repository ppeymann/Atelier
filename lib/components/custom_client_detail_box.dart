import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClientDetailBox extends StatelessWidget {
  final String detail;
  final String value;
  final Color detailColor;
  final Color valueColor;

  const CustomClientDetailBox({
    super.key,
    required this.detail,
    required this.value,
    required this.detailColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                value,
                style: TextStyle(
                  color: valueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: "monro",
                ),
              ),
              Text(
                detail,
                style: TextStyle(
                  color: detailColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "monro",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
