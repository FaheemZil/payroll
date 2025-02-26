import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/cdate_formfield.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/ctext.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';

class PaymentDetailsForm extends StatefulWidget {
  const PaymentDetailsForm({super.key});

  @override
  State<PaymentDetailsForm> createState() => _PaymentDetailsFormState();
}

class _PaymentDetailsFormState extends State<PaymentDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _paymentAmountController =
      TextEditingController();
  final TextEditingController _payrollCheckDateController =
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
        title: 'Payment Details',
        children: [
          Expanded(
            child: CTextField(
              labelText: "Payment Amount (\$)",
              controller: _paymentAmountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a payment amount';
                }
                return null;
              },
            ),
          ),
          HGap(8),
          Expanded(child: CDateFormField()),

          CTextField(
            labelText: "Card Holder Name",
            controller: _cardHolderNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the cardholder name';
              }
              return null;
            },
          ),
          CTextField(
            labelText: "Card Number",
            controller: _cardNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the card number';
              }
              // You can add card number validation here if needed (e.g., Luhn's algorithm)
              return null;
            },
          ),
          Expanded(
            child: CTextField(
              labelText: "Expiration Date",
              controller: _expirationDateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the expiration date';
                }
                return null;
              },
            ),
          ),
          SizedBox(width: 8),
          CTextField(
            labelText: "CVV",
            controller: _cvvController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the CVV';
              }
              return null;
            },
          ),
          CTextField(
            labelText: "Billing Zip",
            controller: _billingZipController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the billing zip code';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          CElevatedButton.modal(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, proceed with payment logic
              }
            },
            child: cText("Split Payments"),
          ),
          VGap(10),
          CElevatedButton.modal(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, proceed with payment logic
              }
            },
            child: cText("Continue"),
          ),
        ],
      ),
    );
  }
}
