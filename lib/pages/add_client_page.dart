import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/pages/index.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _city = TextEditingController();
  final _country = TextEditingController();
  String selectedValue = "Standard";

  final stylePreferences = [
    "Classic",
    "Modern",
    "Minimal",
    "Casual",
    "Formal",
    "Elegant",
    "Vintage",
    "Streetwear",
    "Sporty",
    "Bohemian",
  ];

  final Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add New Client",
                style: TextStyle(
                  fontFamily: "monro",
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Column(
                children: [
                  DividerText(text: "PERSONAL INFORMATION"),
                  AppInputField(
                    label: "First Name",
                    hint: "Peyman",
                    icon: Icons.person,
                    controller: _firstName,
                  ),
                  SizedBox(height: 20),
                  AppInputField(
                    label: "Last Name",
                    hint: "Malek",
                    icon: Icons.person,
                    controller: _lastName,
                  ),
                  SizedBox(height: 20),
                  AppInputField(
                    label: "Email",
                    hint: "peyman@email.com",
                    icon: Icons.email,
                    controller: _email,
                  ),
                  SizedBox(height: 20),
                  AppInputField(
                    label: "Phone",
                    hint: "+1 234 567 89",
                    icon: Icons.phone,
                    controller: _phone,
                  ),
                  SizedBox(height: 12),
                  DividerText(text: "ADDRESS"),
                  AppInputField(
                    label: "City",
                    hint: "New York",
                    icon: Icons.location_city,
                    controller: _city,
                  ),
                  SizedBox(height: 20),
                  AppInputField(
                    label: "Country",
                    hint: "United State",
                    icon: Icons.location_city,
                    controller: _country,
                  ),
                  DividerText(text: "Style Preferences"),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: stylePreferences.map((option) {
                      final isSelected = selectedOptions.contains(option);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedOptions.contains(option)) {
                              selectedOptions.remove(option);
                            } else {
                              selectedOptions.add(option);
                            }
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
                  DividerText(text: "CLIENT TIER"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTier(
                        selected: "Standard",
                        describe: "Default",
                        selecetedValue: selectedValue,
                        onTap: () => setState(() {
                          selectedValue = "Standard";
                        }),
                      ),
                      CustomTier(
                        selected: "VIP",
                        describe: "Priority\nservice",
                        selecetedValue: selectedValue,
                        onTap: () => setState(() {
                          selectedValue = "VIP";
                        }),
                      ),
                      CustomTier(
                        selected: "Bespoke",
                        describe: "Premium\nonly",
                        selecetedValue: selectedValue,
                        onTap: () => setState(() {
                          selectedValue = "Bespoke";
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              CustomBtn(
                text: "Add Client",
                height: 60,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ClientPage()),
                  );
                },
                foregroundColor: Theme.of(context).colorScheme.tertiary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
