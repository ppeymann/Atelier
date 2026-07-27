import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Greeting function to add top of home page
  String greeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon";
    } else if (hour >= 18 && hour < 22) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greeting(),
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Peyman Malek",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontFamily: "monro",
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        CustomAvatar(
                          initials: 'PM',
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MONTHLY REVENUE",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "\$6,320",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 40,
                                    fontFamily: "monro",
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "12.4%",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "vs Last Month",
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                childAspectRatio: 1.6,
                children: [
                  CustomCard(
                    count: 8,
                    activity: 'New Orders',
                    types: 'Today',
                    backgroundColor: Color.fromARGB(147, 197, 202, 233),
                    countColor: Color.fromARGB(255, 48, 63, 159),
                    activityColor: Color.fromARGB(255, 26, 35, 126),
                    typesColor: Color.fromARGB(255, 91, 107, 192),
                  ),
                  CustomCard(
                    count: 14,
                    activity: 'In Progress',
                    types: 'Active',
                    backgroundColor: Color.fromARGB(133, 249, 233, 186),
                    countColor: const Color.fromARGB(255, 255, 160, 0),
                    activityColor: const Color.fromARGB(255, 255, 111, 0),
                    typesColor: const Color.fromARGB(255, 225, 178, 36),
                  ),
                  CustomCard(
                    count: 5,
                    activity: 'Ready',
                    types: 'To deliver',
                    backgroundColor: const Color.fromARGB(140, 200, 230, 201),
                    countColor: const Color.fromARGB(255, 54, 138, 58),
                    activityColor: const Color.fromARGB(255, 27, 94, 32),
                    typesColor: const Color.fromARGB(255, 102, 187, 106),
                  ),
                  CustomCard(
                    count: 47,
                    activity: 'Customer',
                    types: 'Total',
                    backgroundColor: const Color.fromARGB(168, 255, 206, 211),
                    countColor: const Color.fromARGB(255, 211, 47, 47),
                    activityColor: const Color.fromARGB(255, 183, 28, 28),
                    typesColor: const Color.fromARGB(255, 239, 83, 80),
                  ),
                ],
              ),
              DividerText(text: "Quick Action", isCentered: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: fix this funtion
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(5),

                            child: Icon(
                              Icons.star,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("New"),
                          Text("Order"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: fix this funtion
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(5),

                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Add"),
                          Text("Client"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: fix this funtion
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(5),

                            child: Icon(
                              Icons.circle_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Mea"),
                          Text("sure"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: fix this funtion
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(5),

                            child: Icon(
                              Icons.timer_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Sch"),
                          Text("edule"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DividerText(text: "TODAY'S ORDER", isCentered: false),
              Column(
                children: [
                  CustomHomeOrder(
                    avatarName: "JO",
                    name: "James Okafor",
                    cloth: "Bespoke Suit",
                    badgeTxt: "In Progress",
                    bkBadge: const Color.fromARGB(80, 179, 139, 125),
                    txtColorBadge: const Color.fromARGB(255, 127, 56, 31),
                    price: "350",
                  ),
                  SizedBox(height: 10),
                  CustomHomeOrder(
                    avatarName: "SA",
                    name: "Saman Akbari",
                    cloth: "Evening Gown",
                    badgeTxt: "Ready",
                    bkBadge: const Color.fromARGB(78, 63, 81, 181),
                    txtColorBadge: const Color.fromARGB(255, 22, 46, 179),
                    price: "520",
                  ),
                  SizedBox(height: 10),
                  CustomHomeOrder(
                    avatarName: "MC",
                    name: "Marcus Chen",
                    cloth: "Linen Shirt ×3",
                    badgeTxt: "New",
                    bkBadge: const Color.fromARGB(78, 67, 181, 63),
                    txtColorBadge: const Color.fromARGB(255, 22, 179, 43),
                    price: "870",
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
