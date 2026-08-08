import 'package:flutter/material.dart';

class CustomInfo extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const CustomInfo({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(icon, color: Colors.grey),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "monro",
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
