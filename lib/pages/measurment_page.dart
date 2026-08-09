import 'package:flutter/material.dart';
import 'package:tail/components/divider_text.dart';
import 'package:tail/components/index.dart';
import 'package:tail/pages/index.dart';
import 'package:tail/themes/container_theme.dart';

class MeasurmentPage extends StatefulWidget {
  const MeasurmentPage({super.key});

  @override
  State<MeasurmentPage> createState() => _MeasurmentPageState();
}

class _MeasurmentPageState extends State<MeasurmentPage> {
  // <--- for upper --->
  int? _neck;
  int? _chest;
  int? _waist;
  int? _shoulderWidth;
  int? _arcCircumferemce;
  int? _sleevLenght;

  // <--- for lower --->
  int? _hip;
  int? _thigh;
  int? _knee;
  int? _calf;
  int? _pantsLenght;
  int? _inseam;

  // <--- garment lenght
  int? _shirtLenght;
  int? _dressLenght;
  int? _jacketLenght;
  int? _backLenght;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Peyman Malek",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Body Measurements",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontFamily: "monro",
              ),
            ),
            Text(
              "All measurements in centimetres",
              style: TextStyle(color: Colors.grey, fontFamily: "monro"),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: ContainerDecoration.basic(context),
              child: Column(
                spacing: 24,
                children: [
                  DividerText(text: "Upper Body", isCentered: false),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'neck',
                          onChanged: (int value) {
                            setState(() {
                              _neck = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'chest',
                          onChanged: (int value) {
                            setState(() {
                              _chest = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'waist',
                          onChanged: (int value) {
                            setState(() {
                              _waist = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'shoulder widht',
                          onChanged: (int value) {
                            setState(() {
                              _shoulderWidth = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'arm circumference',
                          onChanged: (int value) {
                            setState(() {
                              _arcCircumferemce = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'sleeve lenght',
                          onChanged: (int value) {
                            setState(() {
                              _sleevLenght = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: ContainerDecoration.basic(context),
              child: Column(
                spacing: 24,
                children: [
                  DividerText(text: "Lower Body", isCentered: false),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'hip',
                          onChanged: (int value) {
                            setState(() {
                              _hip = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'thigh',
                          onChanged: (int value) {
                            setState(() {
                              _thigh = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'knee',
                          onChanged: (int value) {
                            setState(() {
                              _knee = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'calf',
                          onChanged: (int value) {
                            setState(() {
                              _calf = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'pants lenght',
                          onChanged: (int value) {
                            setState(() {
                              _pantsLenght = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'inseam',
                          onChanged: (int value) {
                            setState(() {
                              _inseam = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: ContainerDecoration.basic(context),
              child: Column(
                spacing: 24,
                children: [
                  DividerText(text: "Garment Lenghts", isCentered: false),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'shirt lenght',
                          onChanged: (int value) {
                            setState(() {
                              _shirtLenght = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'dress lenght',
                          onChanged: (int value) {
                            setState(() {
                              _dressLenght = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MeasurementField(
                          label: 'jacket length',
                          onChanged: (int value) {
                            setState(() {
                              _jacketLenght = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MeasurementField(
                          label: 'back lenght',
                          onChanged: (int value) {
                            setState(() {
                              _backLenght = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomBtn(
              text: "Add Order",
              height: 64,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
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
