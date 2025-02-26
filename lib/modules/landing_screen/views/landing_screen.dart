import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/calert_dialog.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/ctext.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/data/controllers/auth_controller.dart';
import 'package:myapp/data/models/login/login.dart';
import 'package:myapp/modules/landing_screen/views/social_media_icons.dart';
import 'package:myapp/modules/landing_screen/views/widgets/powered_by.dart';
import 'package:myapp/utils/helpers/route_helper.dart';
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
  final buttonKey = UniqueKey();
  final Debouncer _debouncer = Debouncer(delay: Duration(milliseconds: 700));
  bool _acceptedTerms = false; // Checkbox state
  OverlayEntry? _overlayEntry;

  void _validateAndSubmit() {
    final validationMessage = FormValidation.validateEmail(
      _emailController.text,
    );
    if (validationMessage != null) {
      _showTooltip(validationMessage);
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
      } else {
        _auth.authService.registerAsGuest(_emailController.text);
      }
      Get.toNamed(AppRoutes.payrollInformation);
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
                    cText(
                      message,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(_overlayEntry!);
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: cText(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              cText(
                'PAYROLL BY CREDIT CARD',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Subtitle
              cText(
                'Pay your employees using any credit card. Earn rewards while we handle the payroll payments securely.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),

              const SizedBox(height: 32),

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
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password Input Field or Terms & Conditions
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
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: GoogleFonts.poppins(
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
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
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

              const SizedBox(height: 24),

              // Getting Started Button
              SizedBox(
                height: 55,
                width: double.infinity,
                child: CElevatedButton(
                  key: buttonKey,
                  onPressed: _validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff005571),
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: cText(
                    'Getting Started',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Already have an account? Log in
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Social login icons
              Center(child: SocialMediaButtons()),

              const SizedBox(height: 24),

              // ZIL Money Branding
              Center(child: PoweredByWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
