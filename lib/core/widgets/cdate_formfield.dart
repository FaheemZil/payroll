import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/utils/helpers/extensions.dart';

class CDateFormField extends StatefulWidget {
  const CDateFormField({
    super.key,
    this.validateEmpty,
    this.startDateData,
    this.allowFuture = true,
    this.allowpast = true,
    this.onChanged,
    this.style,
    this.labelText,
    this.margin = EdgeInsets.zero,

    ///Enble allow date selection
    this.enable = true,
  });

  final bool allowFuture;
  final bool allowpast;

  final bool enable;
  final String? labelText;
  final EdgeInsetsGeometry margin;
  final ValueChanged<DateTime>? onChanged;
  final DateTime? startDateData;
  final TextStyle? style;
  final String? validateEmpty;

  @override
  State<CDateFormField> createState() => _CDateFormFieldState();
}

class _CDateFormFieldState extends State<CDateFormField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return CTextField(
      onTap: () async {
        if (widget.onChanged != null || widget.enable) {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate:
                widget.allowFuture
                    ? DateTime.now().add(const Duration(days: 366))
                    : DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() => selectedDate = pickedDate);
            if (widget.onChanged != null) {
              widget.onChanged?.call(pickedDate);
            }
          }
        }
      },
      validator: (val) {
        if (selectedDate == null) {
          return 'This field is required';
        }
        return null;
      },
      controller: TextEditingController(text: selectedDate?.dmyFormString()),
      autovalidateMode: selectedDate != null ? AutovalidateMode.always : null,
      readOnly: true,

      // enabled: false,
      suffixIcon: Icon(Icons.calendar_month),
      labelText: 'Payroll Check Date',
    );
  }
}
