import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/ctext.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';
import 'package:myapp/utils/helpers/validation_helper.dart';

class SplitPaymentForm extends StatefulWidget {
  const SplitPaymentForm({super.key});

  @override
  State<SplitPaymentForm> createState() => _SplitPaymentFormState();
}

class _SplitPaymentFormState extends State<SplitPaymentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardAmountController = TextEditingController();
  final TextEditingController _remainingAmountController =
      TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _billingZipController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CommonLogoScreen(
        title: 'Payroll Information',
        children: [
          CElevatedButton.modal(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.credit_card, color: AppColors.white),
                HGap(8),
                cText('Second Card'),
              ],
            ),
          ),
          SizedBox(height: 10),
          CTextField(
            labelText: 'Card Amount',
            controller: _cardAmountController,
            validator: FormValidation.validateRequiredField,
          ),
          SizedBox(height: 10),
          CTextField(
            labelText: 'Remaining Amount',
            controller: _remainingAmountController,
            validator: FormValidation.validateRequiredField,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cText(
                "Total Amount:",
                style: TextStyle(color: AppColors.textNormalBlack),
              ),
              cText(
                "\$333",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Card holder name
          CTextField(
            labelText: "Card Holder Name",
            controller: _cardHolderNameController,
            validator: FormValidation.validateRequiredField,
          ),

          // Card number
          CTextField(
            labelText: "Card Number",
            controller: _cardNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Card number must be 13-19 digits and a recognizable card format';
              }
              return null;
            },
          ),

          // Expiration date, CVV, and Billing zip in one row
          Row(
            children: [
              Expanded(
                child: CTextField(
                  labelText: "Expiration Date",
                  controller: _expirationDateController,
                  validator: FormValidation.validateRequiredField,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CTextField(
                  labelText: "CVV",
                  controller: _cvvController,
                  validator: FormValidation.validateRequiredField,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CTextField(
                  labelText: "Billing Zip",
                  controller: _billingZipController,
                  validator: FormValidation.validateRequiredField,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Confirm Payment button
          CElevatedButton.modal(
            onPressed: () {
              debugPrint('message');
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, proceed with payment logic
              }
            },
            text: 'Confirm Payment',
          ),
        ],
      ),
    );
  }
}
