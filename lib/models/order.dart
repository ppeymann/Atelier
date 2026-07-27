enum Status { newOrder, inProgress, ready, delivery }

class Order {
  final int id;
  final String customerName;
  final Status progress;
  final String cloth;
  final int orderNumber;
  final DateTime deliveryTime;
  final int price;

  const Order({
    required this.id,
    required this.customerName,
    required this.progress,
    required this.cloth,
    required this.orderNumber,
    required this.deliveryTime,
    required this.price,
  });
}

class Client {
  final String name;
  final bool isVIP;
  final String number;
  final int orderNumber;

  const Client({
    required this.name,
    required this.isVIP,
    required this.number,
    required this.orderNumber,
  });
}
