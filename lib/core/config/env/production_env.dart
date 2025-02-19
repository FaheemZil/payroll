import 'package:payroll_by_cc/core/config/env/env.dart';

class ProductionEnv implements Env {
  @override
  String get name => 'Production';

  @override
  String get baseUrl => 'https://api.example.com';

}