import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/capp_bar.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/cfile_picker.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/utils/helpers/asset_helper.dart';

class VerifyCreditCard extends StatelessWidget {
   VerifyCreditCard({super.key});
final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(title: Text('Verify Credit Card')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(key:_formKey,
          child: Column(
            children: [
              const VGap(20),
              Align(child: Assets.images.verifyDocument.svg()),
              const VGap(20),
              Text(
                'Before making your first payment with this new card, we kindly request you to upload the picture of your card with name and last 4 digits visible as shown in the picture below for the verification process.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.inputBorderDisabled,
                  fontSize: 13,
                ),
              ),
              const VGap(20),
              CFilePicker(onFilePicked: (value) {}),
              CFilePicker(onFilePicked: (value) {}),
              Spacer(),
              CElevatedButton.modal(
                text: 'Next',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with payment logic
                  }
                },
                width: double.infinity,
              ),
              VGap(12),
            ],
          ),
        ),
      ),
    );
  }
}
