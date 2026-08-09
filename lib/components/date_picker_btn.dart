import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerBtn extends StatefulWidget {
  const DatePickerBtn({super.key});

  @override
  State<DatePickerBtn> createState() => _DatePickerBtnState();
}

class _DatePickerBtnState extends State<DatePickerBtn> {
  DateTime? selectedDate;
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          selectedDate == null
              ? "Select Date"
              : "${selectedDate!.day} ${DateFormat("MMM").format(selectedDate!)} ${selectedDate!.year}",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
