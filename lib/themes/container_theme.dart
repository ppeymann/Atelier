import 'package:flutter/material.dart';

class ContainerDecoration {
  static BoxDecoration basic(BuildContext context) {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
