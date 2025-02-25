import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/data/controllers/auth_controller.dart';
import 'package:myapp/data/models/login/login.dart';
import 'package:myapp/modules/landing_screen/views/social_media_icons.dart';
import 'package:myapp/modules/landing_screen/views/widgets/powered_by.dart';
import 'package:myapp/utils/helpers/validation_helper.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = Get.put(AuthController());
  final GlobalKey _emailFieldKey = GlobalKey();
  final Debouncer _debouncer = Debouncer(delay: Duration(milliseconds: 700));
  bool _acceptedTerms = false; // Checkbox state
  OverlayEntry? _overlayEntry;

  /// Validates input and triggers tooltip or success message
  void _validateAndSubmit() {
    final validationMesage = FormValidation.validateEmail(
      _emailController.text,
    );
    if (validationMesage != null) {
      _showTooltip(validationMesage);
    } else if (!_acceptedTerms && _auth.isNewuser) {
      _showSnackbar("Please accept the Terms & Conditions.");
    } else {
      if (!_auth.isNewuser) {
        _auth.authService.login(
          LoginRequest(
            username: _emailController.text,
            password: _passwordController.text,
          ),
        );
      }
      _showSnackbar("Form Submitted Successfully!");
    }
  }

  /// Shows tooltip exactly above the email field
  void _showTooltip(String message) {
    final renderBox =
        _emailFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final overlay = Overlay.of(context);
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: position.dx + (size.width / 4) - 75, // Centers tooltip
            top: position.dy + 65, // Places tooltip above email field
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error, color: Colors.orange, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      message,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(_overlayEntry!);

    // Auto-hide tooltip after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  /// Shows snackbar messages for form validation
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'PAYROLL BY CREDIT CARD',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Pay your employees using any credit card. Earn rewards while we handle the payroll payments securely.',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // Email Input Field
                CTextField(
                  onChanged: (value) {
                    _debouncer.call(() {
                      if (FormValidation.validateEmail(value) == null) {
                        _auth.userStatus(value);
                      }
                    });
                  },
                  key: _emailFieldKey,
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.roboto(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (authController) {
                    if (authController.isNewuser) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _acceptedTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                _acceptedTerms = value ?? false;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.blueGrey,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'I accept the ',
                                style: GoogleFonts.roboto(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CTextField(
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.roboto(color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    }
                  },
                ),

                SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                    onPressed: _validateAndSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(0, 0, 85, 113),
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    text: 'Getting Started',
                  ),
                ),
                const SizedBox(height: 24),

                // Already have an account? Log in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login screen
                      },
                      child: Text(
                        'Log in',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Social login icons
                Center(child: SocialMediaButtons()),

                const SizedBox(height: 24),

                // ZIL Money Branding
                Center(child: PoweredByWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
