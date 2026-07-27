import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final int orderNumber;
  const OrderDetailPage({super.key, required this.orderNumber});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          print(widget.orderNumber);
        },
        child: Text("show order number"),
      ),
    );
  }
}
