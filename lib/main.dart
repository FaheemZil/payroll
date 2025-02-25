import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/controllers/auth_controller.dart';
import 'package:myapp/data/controllers/loader_controller.dart';
import 'package:myapp/modules/landing_screen/views/landing_screen.dart';
import 'package:myapp/modules/landing_screen/views/screens/splash_screen.dart';

import 'core/config/app_config.dart';
import 'core/config/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoaderController());
  // Initialize environment (default to staging)
  const env = String.fromEnvironment('ENV', defaultValue: Environment.staging);

  // Setup configuration
  final appConfig = AppConfig();
  await appConfig.setup(env);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Environment Demo',
      initialRoute: '/',
      home: SplashScreen(),
      // ... other config
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get currentContext => navigatorKey.currentContext!;
