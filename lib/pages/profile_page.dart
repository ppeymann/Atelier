import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotifActive = false;
  bool nightMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 20,
                children: [
                  Container(
                    width: 65,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/gold_logo.png",
                        width: 42,
                        height: 42,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Atelier Noir",
                        style: TextStyle(
                          fontFamily: "monro",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("New York, NY · Est. 2019"),
                      Row(
                        spacing: 5,
                        children: [
                          CustomBadge(
                            bkColor: Theme.of(context).colorScheme.tertiary,
                            txColor: Theme.of(context).colorScheme.primary,
                            txt: "Pro Plan",
                          ),
                          CustomBadge(
                            bkColor: const Color.fromARGB(255, 227, 227, 227),
                            txColor: Theme.of(context).colorScheme.primary,
                            txt: "47 clients",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
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
                spacing: 8,
                children: [
                  Text(
                    "BUSINESS",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 12),
                  CustomProfileDetail(
                    title: "Workshop Name",
                    detail: Text(
                      "Atelier Noir",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Address",
                    detail: Text(
                      "142 W 36th St, New York",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Contact Email",
                    detail: Text(
                      "p.malek32@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Phone",
                    detail: Text(
                      "+1 212 555 0198",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
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
                spacing: 8,
                children: [
                  Text(
                    "PREFERENCES",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomProfileDetail(
                    title: "Notifications",
                    detail: Switch(
                      value: isNotifActive,
                      onChanged: (bool val) {
                        setState(() {
                          isNotifActive = val;
                        });
                      },
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Dark Mode",
                    detail: Switch(
                      value: nightMode,
                      onChanged: (bool val) {
                        setState(() {
                          nightMode = val;
                        });
                      },
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Language",
                    detail: GestureDetector(
                      onTap: () {
                        // Open language selector page/dialog here
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Currency",
                    detail: GestureDetector(
                      onTap: () {
                        // Open language selector page/dialog here
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "USD (\$)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  CustomProfileDetail(
                    title: "Currency",
                    detail: GestureDetector(
                      onTap: () {
                        // Open language selector page/dialog here
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Measurements",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
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
                spacing: 8,
                children: [
                  GestureDetector(
                    child: Text(
                      "Export Data",
                      style: TextStyle(
                        fontFamily: "monro",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    child: Text(
                      "Help & Support",
                      style: TextStyle(
                        fontFamily: "monro",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        fontFamily: "monro",
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 150, 41, 33),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Atelier v2.4.1 · Made with care",
              style: TextStyle(
                fontFamily: "monro",
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
