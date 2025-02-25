import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/data/controllers/loader_controller.dart';

enum ModalButtonType { small, medium, large }

class CElevatedButton extends StatelessWidget {
  const CElevatedButton({
    required this.onPressed,
    this.height,
    this.width,
    this.margin = EdgeInsets.zero,
    this.child,
    this.style,
    this.text = '',
    this.textStyle,
    this.loaderColor,
    super.key,
  });

  factory CElevatedButton.modal({
    Widget? child,
    double? height,
    EdgeInsets margin,
    VoidCallback? onPressed,
    ButtonStyle? style,
    String text,
    TextStyle? textStyle,
    double? width,
    ModalButtonType type,
    Key? key,
  }) = _CModalButton;

  final Widget? child;
  final double? height;
  final EdgeInsets margin;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final Color? loaderColor;
  @override
  Widget build(BuildContext context) {
    // final loader = ref.watch(buttonStateProvider);

    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (loader) {
        final isLoading = loader.buttonLoader.isNotEmpty;
        return Container(
          margin: margin,
          height: height,
          width: width,
          child: ElevatedButton(
            style:
                style ??
                ElevatedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
            onPressed: isLoading ? null : onPressed,
            child:
                isLoading
                    ? CircularProgressIndicator(
                      color: loaderColor ?? AppColors.white,
                      strokeWidth: 3,
                    )
                    : child ?? Text(text, style: textStyle),
          ),
        );
      },
    );
  }
}

class _CModalButton extends CElevatedButton {
  _CModalButton({
    super.onPressed,
    double? height,
    super.width,
    super.margin = EdgeInsets.zero,
    super.child,
    ButtonStyle? style,
    super.text = '',
    super.textStyle,
    ModalButtonType type = ModalButtonType.medium,
    super.key,
  }) : super(
         height:
             height ??
             (type == ModalButtonType.medium
                 ? 45
                 : type == ModalButtonType.small
                 ? 35
                 : 50), // For large button
         style: ElevatedButton.styleFrom(
           foregroundColor: AppColors.white,
           backgroundColor: AppColors.secondaryColor,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(12),
           ),
         ),
       );
}
