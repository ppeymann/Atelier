import 'package:flutter/material.dart';

class CustomSegmentControl extends StatelessWidget {
  final String selectedValue;
  final String selected;
  final VoidCallback onTap;

  const CustomSegmentControl({
    super.key,
    required this.selectedValue,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedValue == selected
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          border: Border.all(
            color: selectedValue == selected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          selected,
          style: TextStyle(
            color: selectedValue == selected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
