import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';

class CustomHomeOrder extends StatefulWidget {
  final String avatarName;
  final String name;
  final String cloth;
  final String badgeTxt;
  final Color bkBadge;
  final Color txtColorBadge;
  final String price;

  const CustomHomeOrder({
    super.key,
    required this.avatarName,
    required this.name,
    required this.cloth,
    required this.badgeTxt,
    required this.bkBadge,
    required this.txtColorBadge,
    required this.price,
  });

  @override
  State<CustomHomeOrder> createState() => _CustomHomeOrderState();
}

class _CustomHomeOrderState extends State<CustomHomeOrder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 179, 178, 178)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CustomAvatar(
              initials: widget.avatarName,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "monro",
                  ),
                ),
                Text(
                  widget.cloth,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                CustomBadge(
                  bkColor: widget.bkBadge,
                  txColor: widget.txtColorBadge,
                  txt: widget.badgeTxt,
                ),
                SizedBox(height: 5),
                Text(
                  "\$${widget.price}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "monro",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
