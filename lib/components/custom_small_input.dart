import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeasurementField extends StatefulWidget {
  final String label;
  final int? value;
  final ValueChanged<int> onChanged;
  final String unit;

  const MeasurementField({
    super.key,
    required this.label,
    this.value,
    required this.onChanged,
    this.unit = 'cm',
  });

  @override
  State<MeasurementField> createState() => _MeasurementFieldState();
}

class _MeasurementFieldState extends State<MeasurementField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
  }

  @override
  void didUpdateWidget(covariant MeasurementField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final text = widget.value?.toString() ?? '';
    if (widget.value != oldWidget.value && _controller.text != text) {
      _controller.text = text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 1.1,
            fontWeight: FontWeight.w500,
            color: Color(0xFF8A8A8A),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3EFE7), // cream/beige background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE3DDCE)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 3,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    counterText: "",
                    contentPadding: EdgeInsets.zero,
                    hintText: '--',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFBFB9AA),
                    ),
                  ),
                  onChanged: (text) {
                    final parsed = int.tryParse(text);
                    if (parsed != null) {
                      widget.onChanged(parsed);
                    }
                  },
                ),
              ),
              Text(
                widget.unit,
                style: const TextStyle(fontSize: 15, color: Color(0xFF9A9A9A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
