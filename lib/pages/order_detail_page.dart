import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:progress_tracker/progress_tracker.dart';
import 'package:tail/components/index.dart';
import 'package:tail/core/extensions/index.dart';
import 'package:tail/core/utils/index.dart';
import 'package:tail/data/data.dart';
import 'package:tail/models/index.dart' hide Status;

class OrderDetailPage extends StatefulWidget {
  final int orderNumber;
  const OrderDetailPage({super.key, required this.orderNumber});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  Order get order =>
      orders.firstWhere((order) => order.orderNumber == widget.orderNumber);

  int progressNumber = 0;
  Client client = clients.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ORDER #${order.orderNumber}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                CustomBadge(
                  bkColor: const Color.fromARGB(80, 179, 139, 125),
                  txColor: const Color.fromARGB(255, 127, 56, 31),
                  txt: "In Progress",
                ),
              ],
            ),
            Text(
              order.cloth,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                fontFamily: "monro",
              ),
            ),
            DividerText(text: "PROGRESS"),
            ProgressTracker(
              horizontalPadding: 10,
              key: ValueKey(progressNumber),
              currentIndex: progressNumber,
              activeColor: Theme.of(context).colorScheme.primary,
              inActiveColor: Theme.of(context).colorScheme.secondary,
              trackerAtStart: false,
              statusList: [
                Status(name: "Received", icon: Icons.check),
                Status(name: "Cutting", icon: Icons.content_cut),
                Status(name: "Sewing", icon: Icons.checkroom),
                Status(name: "Finishing", icon: Icons.dry_cleaning),
                Status(name: "Ready", icon: Icons.shopping_bag),
              ],
            ),
            CustomBtn(
              text: "Next",
              height: 40,
              onPressed: () {
                setState(() {
                  if (progressNumber < 4) {
                    progressNumber++;
                  } else {
                    progressNumber = 0;
                  }
                });
              },
              foregroundColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.white,
            ),
            DividerText(text: "Client"),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 8,
                children: [
                  CustomAvatar(
                    initials: (client.firstName + client.lastName).initials,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client.firstName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "monro",
                        ),
                      ),
                      Text(
                        client.lastName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "monro",
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "${order.deliveryTime.year.toString()} ${DateFormat('MMM').format(order.deliveryTime)} ${order.deliveryTime.day.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "monro",
                        ),
                      ),
                      Text(
                        getDeliveryStatus(order.deliveryTime).text,
                        style: TextStyle(
                          color: getDeliveryStatus(order.deliveryTime).color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DividerText(text: "Measurements"),
            Center(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upper Measurements",
                      style: TextStyle(
                        fontFamily: 'monro',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: order.measurements.upper.values.entries.map((
                        item,
                      ) {
                        return Container(
                          padding: EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                item.key,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${item.value} cm",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lower Measurements",
                      style: TextStyle(
                        fontFamily: 'monro',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: order.measurements.lower.values.entries.map((
                        item,
                      ) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                item.key,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${item.value} cm",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            DividerText(text: "Payment"),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "\$${order.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(98, 255, 144, 64),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "50% Deposit Paid",
                          style: TextStyle(
                            fontFamily: "monro",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Text(
                        "\$${order.price - (order.price * 50) / 100} on delivery",
                        style: TextStyle(fontFamily: "monro"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
