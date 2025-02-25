import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';

class CDropdown<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<T>>? items;
  final T? selectedValue;
  final Function(T?)? onChanged;

  const CDropdown({
    super.key,
    required this.labelText,
    required this.items,
    this.selectedValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(style: TextStyle(color: AppColors.textNormalBlack),
      value: selectedValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      items: items,
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select a value';
        }
        return null;
      },
    );
  }
}
