import 'package:flutter/material.dart';

class CustomTier extends StatelessWidget {
  final String selected;
  final String describe;
  final String selecetedValue;
  final VoidCallback onTap;

  const CustomTier({
    super.key,
    required this.selected,
    required this.selecetedValue,
    required this.onTap,
    required this.describe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selecetedValue == selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected,
              style: TextStyle(
                color: selecetedValue == selected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontFamily: "monro",
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              describe,
              style: TextStyle(color: Colors.grey[800], fontSize: 12),
              textAlign: TextAlign.center,
            ),
            // Text("Priority\nservice"),
          ],
        ),
      ),
    );
  }
}
