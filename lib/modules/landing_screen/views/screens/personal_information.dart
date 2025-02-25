import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';

class PersonalInformationForm extends StatelessWidget {
  PersonalInformationForm({super.key});
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CommonLogoScreen(
        title: 'Personal Information',
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CTextField(
                  labelText: 'First Name',

                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              HGap(8),
              Expanded(
                child: CTextField(
                  labelText: 'Last Name',

                  controller: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          // Company Name
          CTextField(
            labelText: 'Company Name',

            controller: companyController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your company name';
              }
              return null;
            },
          ),

          // Address
          CTextField(
            labelText: 'Address',

            controller: addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),

          // City, State, Zip
          CTextField(
            labelText: 'City',

            controller: cityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CTextField(
                  labelText: 'State',

                  controller: stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
              ),
              HGap(8),
              Expanded(
                child: CTextField(
                  labelText: 'Zip',

                  controller: zipController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          // Email Address
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CTextField(
                  labelText: 'Email Address',

                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    }
                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              HGap(8),
              SizedBox(
                height: 47,
                child: CElevatedButton(onPressed: () {}, text: 'Verify'),
              ),
            ],
          ),
          VGap(10),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CTextField(
                  labelText: 'Enter 5-digit code',

                  controller: emailController,
                  validator: (value) {
                    if ((value?.length ?? 0) < 5) {
                      return 'Please enter valid OTP';
                    }
                    return null;
                  },
                ),
              ),
              HGap(8),
              SizedBox(
                height: 47,
                child: CElevatedButton(onPressed: () {}, text: 'Verify'),
              ),
            ],
          ),
          VGap(10),
          CElevatedButton.modal(
            text: 'Continue',
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
