import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/cdropdown.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/cfile_picker.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';

class PayrollInformation extends StatefulWidget {
  const PayrollInformation({super.key});

  @override
  State<PayrollInformation> createState() => _PayrollInformationState();
}

class _PayrollInformationState extends State<PayrollInformation> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedPayrollProvider;
  PlatformFile? _paymentStatementFile;

  final List<String> payrollProviders = [
    'Please Select Your Payroll Provider',
    'Provider A',
    'Provider B',
    'Provider C',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CommonLogoScreen(
        title: 'Split Payment',
        children: [
          VGap(20),
          CDropdown(
            selectedValue: _selectedPayrollProvider,
            labelText: "Select Payroll Provider",
            items:
                payrollProviders
                    .map(
                      (provider) => DropdownMenuItem(
                        value: provider,
                        child: Text(provider),
                      ),
                    )
                    .toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedPayrollProvider = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          CFilePicker(onFilePicked: (value) => _paymentStatementFile = value),
          SizedBox(height: 20),

          // Back and Continue buttons
          CElevatedButton.modal(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, proceed with next steps
              }
            },

            text: "Continue",
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
