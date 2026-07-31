import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DeliveryStatus {
  final String text;
  final Color color;

  const DeliveryStatus({required this.text, required this.color});
}

DeliveryStatus getDeliveryStatus(DateTime date) {
  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);

  final difference = target.difference(today).inDays;

  if (difference > 0) {
    return DeliveryStatus(text: "$difference days left", color: Colors.green);
  }

  if (difference == 0) {
    return const DeliveryStatus(text: "Due today", color: Colors.orange);
  }

  return DeliveryStatus(
    text: "${difference.abs()} days overdue",
    color: Colors.red,
  );
}
