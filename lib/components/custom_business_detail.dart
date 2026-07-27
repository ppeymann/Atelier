import 'package:flutter/material.dart';

class CustomProfileDetail extends StatelessWidget {
  final String title;
  final Widget? detail;

  const CustomProfileDetail({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: TextStyle(fontFamily: "monro", fontWeight: FontWeight.w900),
        ),
        if (detail != null) detail!,
      ],
    );
  }
}
