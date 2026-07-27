import 'package:tail/models/index.dart';

List<Order> orders = [
  Order(
    id: 1,
    customerName: "James Okafor",
    progress: Status.inProgress,
    cloth: "Bespoke Suit",
    orderNumber: 2401,
    deliveryTime: DateTime(2026, 7, 22),
    price: 380,
  ),

  Order(
    id: 2,
    customerName: "Ali Ahmadi",
    progress: Status.ready,
    cloth: "Evening Gown",
    orderNumber: 2402,
    deliveryTime: DateTime(2026, 7, 29),
    price: 520,
  ),

  Order(
    id: 2,
    customerName: "Marcus Chen",
    progress: Status.newOrder,
    cloth: "Linen Shirts ×3",
    orderNumber: 2403,
    deliveryTime: DateTime(2026, 8, 29),
    price: 210,
  ),

  Order(
    id: 2,
    customerName: "Rafael Torres",
    progress: Status.delivery,
    cloth: "Chino Trousers ×2",
    orderNumber: 2404,
    deliveryTime: DateTime(2026, 8, 10),
    price: 280,
  ),
];

final List<Client> clients = [
  Client(
    name: 'Peyman Malek',
    isVIP: true,
    number: '09123456789',
    orderNumber: 1001,
  ),
  Client(
    name: 'Ali Ahmadi',
    isVIP: false,
    number: '09351234567',
    orderNumber: 1002,
  ),
  Client(
    name: 'karim Mohammadi',
    isVIP: true,
    number: '09121112233',
    orderNumber: 1003,
  ),
  Client(
    name: 'Reza Karimi',
    isVIP: false,
    number: '09031239876',
    orderNumber: 1004,
  ),
  Client(
    name: 'milad Hosseini',
    isVIP: true,
    number: '09125557788',
    orderNumber: 1005,
  ),
  Client(
    name: 'Amir Hosseini',
    isVIP: false,
    number: '09211234567',
    orderNumber: 1006,
  ),
  Client(
    name: 'sina Rahimi',
    isVIP: true,
    number: '09193334455',
    orderNumber: 1007,
  ),
  Client(
    name: 'Mohammad Karimi',
    isVIP: false,
    number: '09381112233',
    orderNumber: 1008,
  ),
];
