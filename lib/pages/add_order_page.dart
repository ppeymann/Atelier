import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/pages/index.dart';
import 'package:tail/themes/index.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _fabricType = TextEditingController();
  final _fabricColor = TextEditingController();
  final _linig = TextEditingController();
  final _price = TextEditingController();
  final _note = TextEditingController();

  String? selectedOption;
  final stylePreferences = [
    "Suit",
    "Dress",
    "Shirt",
    "Trousers",
    "Coat",
    "Gown",
    "Blouse",
    "Skirt",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Order",
              style: TextStyle(
                fontFamily: "monro",
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: ContainerDecoration.basic(context),
              child: Column(
                children: [
                  DividerText(text: "Client", isCentered: false),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Add Client",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "monro",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.add, color: Colors.white),
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
              decoration: ContainerDecoration.basic(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerText(text: "Cloth Type", isCentered: false),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: stylePreferences.map((option) {
                      final isSelected = selectedOption == option;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = option;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              decoration: ContainerDecoration.basic(context),
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  DividerText(text: "FABRIC & DETAILS", isCentered: false),
                  AppInputField(
                    label: "FABRIC TYPE",
                    hint: "Italian Wool Blend",
                    icon: Icons.checkroom,
                    controller: _fabricType,
                  ),
                  AppInputField(
                    label: "FABRIC Color",
                    hint: "Charcoal Grey",
                    icon: Icons.color_lens,
                    controller: _fabricColor,
                  ),
                  AppInputField(
                    label: "Lining",
                    hint: "Silk, Ivory",
                    icon: Icons.dry_cleaning,
                    controller: _linig,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: ContainerDecoration.basic(context),
              child: Column(
                children: [
                  DividerText(text: "DELIVERY & PRICE", isCentered: false),
                  Column(
                    spacing: 12,
                    children: [
                      DatePickerBtn(),
                      AppInputField(
                        label: "Price",
                        hint: "350\$",
                        icon: Icons.price_change,
                        controller: _price,
                      ),
                      AppInputField(
                        label: "Note",
                        hint: "Note ....",
                        icon: Icons.note,
                        controller: _note,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomBtn(
              text: "Add Measurment",
              height: 64,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MeasurmentPage()),
                );
              },
              foregroundColor: Theme.of(context).colorScheme.tertiary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
