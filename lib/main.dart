import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/app_config.dart';
import 'core/config/environment.dart';
import 'modules/landing_screen/views/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      title: 'Flutter Environment Demo',
      initialRoute: '/',
      home: LandingScreen(),
      // ... other config
    );
  }
}
