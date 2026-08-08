import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/core/extensions/index.dart';
import 'package:tail/data/index.dart';
import 'package:tail/models/index.dart';

enum ClientSection { info, orders }

class ClientDetailPage extends StatefulWidget {
  final int clientID;
  const ClientDetailPage({super.key, required this.clientID});

  @override
  State<ClientDetailPage> createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage>
    with SingleTickerProviderStateMixin {
  late Client client;
  late List<Order> clientOrders;
  late TabController _controller;
  ClientSection selected = ClientSection.info;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    client = clients.firstWhere((client) => client.id == widget.clientID);
    clientOrders = orders
        .where((order) => order.clientID == client.id)
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                children: [
                  CustomAvatar(
                    initials: (client.firstName + client.lastName).initials,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${client.firstName} ${client.lastName}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontFamily: "monro",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        client.number,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          CustomClientDetailBox(
                            detail: 'orders',
                            value: '12',
                            detailColor: Colors.grey,
                            valueColor: Theme.of(context).colorScheme.tertiary,
                          ),
                          CustomClientDetailBox(
                            detail: 'Spent',
                            value: '\$4.0K',
                            detailColor: Colors.grey,
                            valueColor: Theme.of(context).colorScheme.tertiary,
                          ),
                          CustomClientDetailBox(
                            detail: 'Status',
                            value: 'VIP',
                            detailColor: Colors.grey,
                            valueColor: const Color.fromARGB(172, 99, 255, 104),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelColor: Theme.of(context).colorScheme.secondary,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.grey.shade600,
              onTap: (index) {
                setState(() {
                  selected = ClientSection.values[index];
                });
              },
              controller: _controller,
              tabs: const [
                Tab(text: "Info"),
                Tab(text: "Orders"),
              ],
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: switch (selected) {
                ClientSection.info => ClientInfoWidget(client: client),

                ClientSection.orders => ClientOrdersWidget(orders: orders),
              },
            ),
          ],
        ),
      ),
    );
  }
}

//* <----- Client Info Widget -----> *
class ClientInfoWidget extends StatefulWidget {
  final Client client;
  const ClientInfoWidget({super.key, required this.client});

  @override
  State<ClientInfoWidget> createState() => _ClientInfoWidgetState();
}

class _ClientInfoWidgetState extends State<ClientInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Column(
        spacing: 12,
        children: [
          CustomInfo(
            label: 'Date of Birth',
            value: 'March 14, 1988',
            icon: Icons.cake,
          ),
          CustomInfo(
            label: 'City',
            value: 'Ney York, NY',
            icon: Icons.location_city,
          ),
          CustomInfo(
            label: 'Preferred Style',
            value: 'Contemporary, Minimalist',
            icon: Icons.style,
          ),
          CustomInfo(
            label: 'Notes',
            value: 'Prefers fitted silhouettes. Allergic to wool.',
            icon: Icons.note_sharp,
          ),
        ],
      ),
    );
  }
}

//* <------ Client Order Widget -------> *
class ClientOrdersWidget extends StatefulWidget {
  final List<Order> orders;
  const ClientOrdersWidget({super.key, required this.orders});

  @override
  State<ClientOrdersWidget> createState() => _ClientOrdersWidgetState();
}

class _ClientOrdersWidgetState extends State<ClientOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Column(
        spacing: 12,
        children: [
          ...orders.map(
            (order) => CustomOrderCard(
              clientName: order.customerName,
              clientCloth: order.cloth,
              status: order.progress,
              orderNumber: order.orderNumber,
              delivery: order.deliveryTime,
              price: order.price,
            ),
          ),
        ],
      ),
    );
  }
}
