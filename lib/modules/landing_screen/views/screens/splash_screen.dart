import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/data/controllers/auth_controller.dart';
import 'package:myapp/data/controllers/loader_controller.dart';
import 'package:myapp/modules/landing_screen/views/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      // Get.put(() => AuthController());
      // Get.put(() => LoaderController());
    }).then((_) {
      Get.to(LandingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: CircularProgressIndicator()));
  }
}
