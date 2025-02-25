import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final InputDecoration? decoration;
  final bool unFocusOnTapOutside;
  final ValueChanged<String>? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? padding;

  const CTextField({
    super.key,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.autovalidateMode,
    this.enabled,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.onTap,
    this.decoration,
    this.unFocusOnTapOutside = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        onTapOutside:
            unFocusOnTapOutside
                ? (event) => FocusScope.of(context).unfocus()
                : null,
        onTap: onTap,
        enabled: enabled,
        readOnly: readOnly,
        autovalidateMode: autovalidateMode,
        textAlign: TextAlign.start,
        controller: controller,
        validator: validator,
        decoration:
            decoration ??
            InputDecoration(
              suffixIcon: suffixIcon,
              labelText: labelText,

              hintText: hintText,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                // Focused border color
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ), // Custom padding
            ),
      ),
    );
  }
}
