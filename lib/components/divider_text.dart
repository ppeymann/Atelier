import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;
  final bool isCentered;

  const DividerText({super.key, required this.text, this.isCentered = true});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          if (isCentered) Expanded(child: Divider(thickness: 1, color: color)),

          Padding(
            padding: EdgeInsets.only(left: isCentered ? 12 : 0, right: 12),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: isCentered ? FontWeight.normal : FontWeight.bold,
                fontSize: isCentered ? 12 : 16,
              ),
            ),
          ),

          Expanded(child: Divider(thickness: 1, color: color)),
        ],
      ),
    );
  }
}
