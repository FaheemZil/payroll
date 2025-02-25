import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/data/models/error_resoponse.dart';
import 'package:myapp/main.dart';

enum AlertType { confirm, logout, delete, alert, error, noConnection }

class CustomAlertDialog extends StatelessWidget {
  final AlertType alertType;
  final VoidCallback onTap;
  final String buttonKey;
  final String? titleApi;
  final String? subTitleApi;
  final String? buttonTextApi;
  final List<ErrorResponse>? errors;

  const CustomAlertDialog({
    super.key,
    this.errors,
    this.titleApi,
    this.subTitleApi,
    this.buttonTextApi,
    required this.buttonKey,
    required this.alertType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors and icons based on alert type
    final (
      Color iconColor,
      Color backgroundColor,
      IconData icon,
    ) = switch (alertType) {
      AlertType.confirm => (
        Colors.green,
        Colors.green.shade50,
        Icons.check_circle_outline,
      ),
      AlertType.logout => (
        Colors.orange,
        Colors.orange.shade50,
        Icons.exit_to_app,
      ),
      AlertType.delete => (
        Colors.red,
        Colors.red.shade50,
        Icons.delete_forever,
      ),
      AlertType.alert => (
        Colors.amber,
        Colors.amber.shade50,
        Icons.warning_amber_outlined,
      ),
      AlertType.error => (
        Colors.redAccent,
        Colors.red.shade50,
        Icons.error_outline,
      ),
      AlertType.noConnection => (
        Colors.blueGrey,
        Colors.blueGrey.shade50,
        Icons.wifi_off,
      ),
    };

    // Default texts
    final String title =
        titleApi ??
        switch (alertType) {
          AlertType.confirm => "Confirm Submission",
          AlertType.logout => "Confirm Logout",
          AlertType.delete => "Confirm Deletion",
          AlertType.alert => "Alert",
          AlertType.error => "Error",
          AlertType.noConnection => "No Internet Connection",
        };

    final String subTitle =
        subTitleApi ??
        switch (alertType) {
          AlertType.confirm => "Are you sure you want to submit the details?",
          AlertType.logout => "Are you sure you want to logout?",
          AlertType.delete => "Are you sure you want to delete your account?",
          AlertType.alert => "Are you sure you want to change this?",
          AlertType.error => "",
          AlertType.noConnection =>
            "Please check your connection and try again.",
        };

    final String buttonText =
        buttonTextApi ??
        switch (alertType) {
          AlertType.logout => "Logout",
          AlertType.delete => "Delete",
          AlertType.noConnection => "Retry",
          _ => "Confirm",
        };

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 8, // Add elevation for a better look
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with icon and title
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: .2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: iconColor, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        if (subTitle.isNotEmpty) const SizedBox(height: 4),
                        if (subTitle.isNotEmpty)
                          Text(
                            subTitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Error list (if any)
            if (errors != null && errors!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  children:
                      errors!
                          .map(
                            (error) => Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  error.errorMsg ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if ({
                    AlertType.error,
                    AlertType.noConnection,
                  }.contains(alertType)) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ), // Adjusting height

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Border radius
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: CElevatedButton(onPressed: onTap, text: buttonText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _dialogOpen = false;

Future<T?> cAlertDialog<T>({
  required AlertType alert,
  required VoidCallback onTap,
  String? buttonText,
  String? title,
  String? subtitle,
}) {
  if (_dialogOpen) {
    debugPrint('Prevented opening multiple dialogs!');
    return Future.value();
  }
  _dialogOpen = true;
  return showDialog<T>(
    context: currentContext,
    builder: (context) {
      return CustomAlertDialog(
        buttonKey: '',
        alertType: alert,
        onTap: onTap,
        buttonTextApi: buttonText,
        subTitleApi: subtitle,
        titleApi: title,
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return null;
  });
}

Future<T?> customDialog<T>({
  required Widget content,
  Widget? title,
  List<Widget>? actions,
  MainAxisAlignment actionsAlignment = MainAxisAlignment.center,
  double? borderRadius,
}) {
  if (_dialogOpen) {
    debugPrint('Prevented opening multiple dialogs!');
    return Future.value();
  }
  _dialogOpen = true;
  return showDialog<T>(
    context: currentContext,
    builder: (context) {
      return AnimatedAlertDialog(
        content: content,
        actionsAlignment: actionsAlignment,
        actions: actions,
        borderRadius: borderRadius,
        title: title,
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return null;
  });
}

class AnimatedAlertDialog extends StatefulWidget {
  const AnimatedAlertDialog({
    required this.content,
    required this.actionsAlignment,
    super.key,
    this.title,
    this.actions,
    this.borderRadius,
    this.contentPadding = EdgeInsets.zero,
  });
  final Widget content;
  final MainAxisAlignment actionsAlignment;

  final Widget? title;
  final List<Widget>? actions;
  final EdgeInsets contentPadding;
  final double? borderRadius;

  @override
  _AnimatedAlertDialogState createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // contentPadding: EdgeInsets.zero,
      elevation: 20,
      shadowColor: const Color(0x3F6B80B4),
      backgroundColor: Colors.transparent,
      // contentPadding: EdgeInsets.zero,
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            color: AppColors.backgroundPrimary,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F6B80B4),
                blurRadius: 42,
                offset: Offset(0, 14),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) ...[widget.title!, const VGap(10)],
              widget.content,
              if (widget.actions != null) ...[
                const VGap(25),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: widget.actionsAlignment,
                  children: widget.actions!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
