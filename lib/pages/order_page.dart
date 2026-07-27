import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/data/index.dart';
import 'package:tail/models/index.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String selectedValue = "All";
  List<Order> get filteredOrders {
    switch (selectedValue) {
      case "New":
        return orders
            .where((order) => order.progress == Status.newOrder)
            .toList();

      case "In Progress":
        return orders
            .where((order) => order.progress == Status.inProgress)
            .toList();

      case "Ready":
        return orders.where((order) => order.progress == Status.ready).toList();

      case "Delivery":
        return orders
            .where((order) => order.progress == Status.delivery)
            .toList();

      default:
        return orders;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Orders",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "monro",
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "27 orders this month",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSegmentControl(
                        selectedValue: selectedValue,
                        selected: "All",
                        onTap: () => {
                          setState(() {
                            selectedValue = "All";
                          }),
                        },
                      ),
                      SizedBox(width: 10),
                      CustomSegmentControl(
                        selectedValue: selectedValue,
                        selected: "New",
                        onTap: () => {
                          setState(() {
                            selectedValue = "New";
                          }),
                        },
                      ),
                      SizedBox(width: 10),
                      CustomSegmentControl(
                        selectedValue: selectedValue,
                        selected: "In Progress",
                        onTap: () => {
                          setState(() {
                            selectedValue = "In Progress";
                          }),
                        },
                      ),
                      SizedBox(width: 10),
                      CustomSegmentControl(
                        selectedValue: selectedValue,
                        selected: "Ready",
                        onTap: () => {
                          setState(() {
                            selectedValue = "Ready";
                          }),
                        },
                      ),
                      SizedBox(width: 10),
                      CustomSegmentControl(
                        selectedValue: selectedValue,
                        selected: "Delivery",
                        onTap: () => {
                          setState(() {
                            selectedValue = "Delivery";
                          }),
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              ...filteredOrders.map(
                (order) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomOrderCard(
                    clientName: order.customerName,
                    clientCloth: order.cloth,
                    status: order.progress,
                    orderNumber: order.orderNumber,
                    delivery: order.deliveryTime,
                    price: order.price,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
