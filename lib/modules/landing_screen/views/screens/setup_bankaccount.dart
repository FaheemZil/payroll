import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/cdropdown.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/cfile_picker.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';

class SetupBankaccount extends StatelessWidget {
  SetupBankaccount({super.key});

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<String?> _selectedPaymentType = ValueNotifier<String?>(
    null,
  );
  PlatformFile? _uploadedFile;

  final List<String> paymentTypes = [
    'Please Select Payment Type',
    'Type A',
    'Type B',
    'Type C',
  ];

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
        title: 'Setup Depository Bank Account',
        step: 4,
        children: [
          SizedBox(height: 20),
          // Use the reusable dropdown for Payment Type
          ValueListenableBuilder<String?>(
            valueListenable: _selectedPaymentType,
            builder: (context, selectedPaymentType, child) {
              return CDropdown(
                labelText: 'Payment Type',
                selectedValue: selectedPaymentType,
                items:
                    paymentTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                onChanged: (newValue) {
                  _selectedPaymentType.value = newValue;
                },
              );
            },
          ),
          SizedBox(height: 20),

          // File upload section
          CFilePicker(
            onFilePicked: (value) {
              _uploadedFile = value;
            },
          ),
          SizedBox(height: 10),
          Text(
            "PDF, PNG, JPG or GIF (MAX. 5MB)",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 20),

          // Instruction text
          Text(
            "Please upload your bank statement that shows you have payroll from this account.",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            "Please ensure that this bank account, integrated via Plaid, is exclusively designated for payroll purposes by your payroll provider.",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
          SizedBox(height: 20),

          // Back and Continue buttons
          CElevatedButton.modal(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, proceed with next steps
              }
            },
            text: 'Continue',
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
