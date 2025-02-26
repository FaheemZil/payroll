import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/data/controllers/loader_controller.dart';

class CLoader extends StatelessWidget {
  const CLoader({
    this.child,
    this.independent = false,
    this.color,
    this.bgColor,
    super.key,
  });

  final Widget? child;

  final bool independent;
  final Color? color;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (loader) {
        return Stack(
          children: [
            if (child != null) child!,
            if (loader.loader.isNotEmpty || independent)
              if (loader.buttonLoader.isNotEmpty)
                const ColoredBox(color: Colors.transparent, child: Center())
              else
                ColoredBox(
                  color: bgColor ?? AppColors.black.withValues(alpha: 0.2),
                  child: Center(
                    child:
                        !kIsWeb && Platform.isIOS
                            ? CupertinoActivityIndicator(
                              color: color ?? AppColors.white,
                              radius: 15,
                            )
                            : const RefreshProgressIndicator(),
                  ),
                ),
          ],
        );
      },
    );
  }
}
