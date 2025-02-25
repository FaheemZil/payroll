// Suggested code may be subject to a license. Learn more: ~LicenseLog:2030667872.

class FormValidation {
  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address';
    }
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
