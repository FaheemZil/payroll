import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(this.height, this.width, {super.key});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(height: height, width: width);
}

class VGap extends StatelessWidget {
  const VGap(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => Gap(height, 0);
}

class HGap extends StatelessWidget {
  const HGap(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) => Gap(0, width);
}
