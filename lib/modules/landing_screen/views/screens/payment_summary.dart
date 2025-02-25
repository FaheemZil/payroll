import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/celevated_button.dart';
import 'package:myapp/core/widgets/gap.dart';
import 'package:myapp/modules/landing_screen/views/widgets/common_logo_screen.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLogoScreen(
      title: 'Payment Summary',
      step: 4,
      children: [
        VGap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Card Payment xxxx4444"),
            Text("\$333.00", style: TextStyle(color: Colors.black)),
          ],
        ),
        VGap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Processing Fee (2.9%)"),
            Text("\$9.66", style: TextStyle(color: Colors.black)),
          ],
        ),
        Divider(thickness: .5),

        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total:"),
            Text(
              "\$342.66",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        ColoredBox(
          color: Colors.deepPurpleAccent.withValues(alpha: .2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Payment Description:",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
                Text(
                  "234234 234 - Payroll For February 2025",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),

        CElevatedButton.modal(text: 'Continue', onPressed: () {}),
      ],
    );
  }
}
