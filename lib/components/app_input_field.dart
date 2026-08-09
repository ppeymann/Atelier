import 'package:flutter/material.dart';

class AppInputField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const AppInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.onChanged,
    this.onTap,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
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
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: colors.secondary,
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
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: obscure,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            minLines: widget.minLines,
            readOnly: widget.readOnly,
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            validator: widget.validator,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            style: TextStyle(color: colors.primary),

            decoration: InputDecoration(
              hintText: widget.hint,

              hintStyle: TextStyle(color: colors.secondary),

              filled: true,
              fillColor: Colors.white,

              prefixIcon: Icon(widget.icon, color: colors.secondary),

              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                        color: colors.secondary,
                      ),
                    )
                  : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
