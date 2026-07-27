import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/data/index.dart';
import 'package:tail/pages/add_client_page.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DIRECTORY", style: TextStyle(color: Colors.grey)),
                      Text(
                        "Client",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          fontFamily: "monro",
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    // TODO: add funtion for this funtion
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddClientPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 13),
                child: AppInputField(
                  label: "",
                  hint: "Search clients...",
                  icon: Icons.search,
                  controller: _search,
                ),
              ),
              SizedBox(height: 20),
              ...clients.map(
                (client) => CustomClient(
                  name: client.name,
                  isVIP: client.isVIP,
                  number: client.number,
                  orderNumber: client.orderNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
