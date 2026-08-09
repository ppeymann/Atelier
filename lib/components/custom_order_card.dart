import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/core/extensions/index.dart';
import 'package:tail/models/index.dart';
import 'package:intl/intl.dart';
import 'package:tail/pages/order_detail_page.dart';

class CustomOrderCard extends StatelessWidget {
  final String clientName;
  final String clientCloth;
  final Status status;
  final int orderNumber;
  final DateTime delivery;
  final int price;

  const CustomOrderCard({
    super.key,
    required this.clientName,
    required this.clientCloth,
    required this.status,
    required this.orderNumber,
    required this.delivery,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailPage(orderNumber: orderNumber),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAvatar(
                  initials: clientName.initials,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: TextStyle(
                        fontFamily: "monro",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      clientCloth,
                      style: TextStyle(
                        fontFamily: "monro",
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CustomBadge(
                  bkColor: status.bkColor,
                  txColor: status.txtColor,
                  txt: status.label,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "ORDER",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "#$orderNumber",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontFamily: "monro",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "DELIVERY",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "${DateFormat('MMM').format(delivery)} ${delivery.day.toString()}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontFamily: "monro",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "PRICE",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w900,
                        fontFamily: "monro",
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
