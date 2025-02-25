import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/utils/helpers/asset_helper.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({super.key,this.isWhite=true});
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Powered by', style:isWhite? TextStyle(color: Colors.white):null),
        HGap(8),

        Assets.images.zilLogo.svg(
          height: 20,
          colorFilter:isWhite? ColorFilter.mode(AppColors.white, BlendMode.srcIn):null,
        ),
      ],
    );
  }
}
