import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/capp_bar.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/powered_by.dart';

class CommonLogoScreen extends StatelessWidget {
  const CommonLogoScreen({
    super.key,
    required this.children,
    required this.title,
    this.step,
  });
  final List<Widget> children;
  final String title;
  final int? step;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                // SizedBox(
                //   height:
                //       73, 
                //   child: Stepper(
                //     currentStep: step ?? 1,

                //     stepIconMargin: EdgeInsets.zero,
                //     margin: EdgeInsets.zero,
                //     elevation: 0,
                //     type: StepperType.horizontal,

                //     steps: List.generate(5, (index) {
                //       final isActive=index+1<= (step??1);
                //       return Step(isActive:isActive,stepStyle: StepStyle(color:isActive? AppColors.primaryColor:null),
                //         title: SizedBox.shrink(),
                //         content: SizedBox.shrink(), // No content needed
                       
                //       );
                //     }),
                //   ),
                // ),
                if (step != null) ...[
                  VGap(12),
                  Text(
                    "Step $step of 5",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
                ...children,
              ],
            ),
          ),

          PoweredByWidget(isWhite: false),
          VGap(15),
        ],
      ),
    );
  }
}
