
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payroll_by_cc/core/theme/app_colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey _emailFieldKey = GlobalKey();
  bool _acceptedTerms = false; // Checkbox state
  OverlayEntry? _overlayEntry;

  /// Validates input and triggers tooltip or success message
  void _validateAndSubmit() {
    if (_emailController.text.isEmpty) {
      _showTooltip();
    } else if (!_acceptedTerms) {
      _showSnackbar("Please accept the Terms & Conditions.");
    } else {
      _showSnackbar("Form Submitted Successfully!");
    }
  }

  /// Shows tooltip exactly above the email field
  void _showTooltip() {
    final renderBox = _emailFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final overlay = Overlay.of(context);
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + (size.width / 2) - 75, // Centers tooltip
        top: position.dy + 65, // Places tooltip above email field
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
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
                  "Please fill in this field.",
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
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
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Pay your employees using any credit card. Earn rewards while we handle the payroll payments securely.',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white,fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // Email Input Field
                TextFormField(
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

                const SizedBox(height: 16),

                // Terms & Conditions Checkbox
                Row(
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
                ),

                const SizedBox(height: 16),

                // "Getting Started" Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _validateAndSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Getting Started',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF028C9D),
                      ),
                    ),
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
                      onTap: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.amazon),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ZIL Money Branding
                Center(
                  child: Text(
                    'ZIL MONEY',
                    style: GoogleFonts.roboto(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}