import 'package:flutter/material.dart';

class AppInputField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AppInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool obscure = false;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LABEL
          Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Focus(
            onFocusChange: (focus) {
              setState(() {
                hasFocus = focus;
              });
            },
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: obscure,

              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),

              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                filled: true,
                fillColor: Colors.white,

                prefixIcon: Icon(
                  widget.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),

                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      )
                    : null,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
