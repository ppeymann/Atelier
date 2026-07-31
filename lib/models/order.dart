enum Status { newOrder, inProgress, ready, delivery }

enum Progress { received, cutting, sewing, finishing, ready }

class Order {
  final int id;
  final String customerName;
  final Status progress;
  final Progress progressStatys;
  final String cloth;
  final int orderNumber;
  final DateTime deliveryTime;
  final int price;
  final BodyMeasurements measurements;

  const Order({
    required this.id,
    required this.customerName,
    required this.progress,
    required this.cloth,
    required this.orderNumber,
    required this.deliveryTime,
    required this.price,
    required this.progressStatys,
    required this.measurements,
  });
}

class Client {
  final String firstName;
  final String lastName;
  final bool isVIP;
  final String number;
  final int orderNumber;

  const Client({
    required this.firstName,
    required this.lastName,
    required this.isVIP,
    required this.number,
    required this.orderNumber,
  });
}

class BodyMeasurements {
  final UpperBodyMeasurements upper;
  final LowerBodyMeasurements lower;

  const BodyMeasurements({required this.upper, required this.lower});
}

class UpperBodyMeasurements {
  final double neck;
  final double shoulder;
  final double chest;
  final double waist;
  final double sleeveLength;
  final double arm;
  final double wrist;
  final double shirtLength;

  const UpperBodyMeasurements({
    required this.neck,
    required this.shoulder,
    required this.chest,
    required this.waist,
    required this.sleeveLength,
    required this.arm,
    required this.wrist,
    required this.shirtLength,
  });

  Map<String, double> get values => {
    "Neck": neck,
    "Shoulder": shoulder,
    "Chest": chest,
    "Waist": waist,
    "Sleeve": sleeveLength,
    "Arm": arm,
    "Wrist": wrist,
    "Length": shirtLength,
  };
}

class LowerBodyMeasurements {
  final double hip;
  final double thigh;
  final double knee;
  final double calf;
  final double ankle;
  final double inseam;
  final double outseam;

  const LowerBodyMeasurements({
    required this.hip,
    required this.thigh,
    required this.knee,
    required this.calf,
    required this.ankle,
    required this.inseam,
    required this.outseam,
  });

  Map<String, double> get values => {
    "Hip": hip,
    "Thigh": thigh,
    "Knee": knee,
    "Calf": calf,
    "Ankle": ankle,
    "Inseam": inseam,
    "Outseam": outseam,
  };
}
