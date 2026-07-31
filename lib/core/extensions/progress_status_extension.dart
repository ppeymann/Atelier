import 'package:tail/models/index.dart';

extension ProgressExtension on Progress {
  String get title {
    switch (this) {
      case Progress.received:
        return "Received";
      case Progress.cutting:
        return "Cutting";
      case Progress.sewing:
        return "Sewing";
      case Progress.finishing:
        return "Finishing";
      case Progress.ready:
        return "Ready";
    }
  }
}
