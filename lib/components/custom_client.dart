import 'package:flutter/material.dart';
import 'package:tail/components/custom_avatar.dart';
import 'package:tail/components/index.dart';
import 'package:tail/core/extensions/index.dart';

class CustomClient extends StatefulWidget {
  final String name;
  final bool isVIP;
  final String number;
  final int orderNumber;

  const CustomClient({
    super.key,
    required this.name,
    required this.isVIP,
    required this.number,
    required this.orderNumber,
  });

  @override
  State<CustomClient> createState() => _CustomClientState();
}

class _CustomClientState extends State<CustomClient> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsetsGeometry.all(12.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              CustomAvatar(
                initials: widget.name.initials,
                backgroundColor: widget.isVIP
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
                textColor: widget.isVIP
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: "monro",
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5),
                      if (widget.isVIP) ...[
                        CustomBadge(
                          bkColor: const Color.fromARGB(105, 255, 214, 64),
                          txColor: const Color.fromARGB(255, 124, 98, 4),
                          txt: "VIP Client",
                        ),
                      ],
                    ],
                  ),
                  Text(widget.number, style: TextStyle(color: Colors.grey)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${widget.orderNumber}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: "monro",
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "orders",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
