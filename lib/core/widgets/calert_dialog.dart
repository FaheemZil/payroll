import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/utils/helpers/log_helper.dart';

/// A top level function that can be used to show an alert dialog
/// It also provides a default title as `Message` and `Close` as action
/// that dismiss the dialog.

/// boolean to show only one dialog at a time
bool _dialogOpen = false;

Future<T?> cAlertDialog<T>({
  required BuildContext context,
  required Widget content,
  Widget? title,
  List<Widget>? actions,
  MainAxisAlignment actionsAlignment = MainAxisAlignment.center,
  double? borderRadius,
}) {
  if (_dialogOpen) {
    printLog('Prevented opening multiple dialogs!');
    return Future.value();
  }
  _dialogOpen = true;
  return showDialog<T>(
    context: context,
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
          width: MediaQuery.sizeOf(context).width * .2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            // color: UIColors.backgroundPrimary,
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
              widget.title ??
                  Text(
                    'Message',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
              const VGap(10),
              widget.content,
              const VGap(25),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: widget.actionsAlignment,
                children:
                    widget.actions ??
                    [TextButton(child: Text('Close'), onPressed: () {})],
              ),
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
