
import 'package:payroll_by_cc/core/config/env/env.dart';

class StagingEnv implements Env {
  @override
  String get name => 'Staging';

  @override
  String get baseUrl => 'https://api.staging.example.com';

}