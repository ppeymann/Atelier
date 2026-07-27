import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tail/models/index.dart';

extension StatusExtension on Status {
  String get label {
    switch (this) {
      case Status.newOrder:
        return "New";
      case Status.ready:
        return "Ready";
      case Status.delivery:
        return "Delivery";
      case Status.inProgress:
        return "In Progress";
    }
  }

  Color get bkColor {
    switch (this) {
      case Status.newOrder:
        return const Color.fromARGB(78, 63, 81, 181);
      case Status.ready:
        return const Color.fromARGB(78, 79, 181, 63);
      case Status.delivery:
        return const Color.fromARGB(103, 175, 175, 175);
      case Status.inProgress:
        return Color.fromARGB(255, 245, 238, 224);
    }
  }

  Color get txtColor {
    switch (this) {
      case Status.newOrder:
        return const Color.fromARGB(255, 22, 46, 179);
      case Status.ready:
        return const Color.fromARGB(255, 35, 81, 28);
      case Status.delivery:
        return const Color.fromARGB(255, 72, 71, 71);
      case Status.inProgress:
        return Color.fromARGB(255, 28, 25, 23);
    }
  }
}
