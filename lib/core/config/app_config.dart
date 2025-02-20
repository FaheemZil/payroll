import 'package:get/get.dart';
import 'package:myapp/core/config/environment.dart';


import 'env/env.dart';
import 'env/production_env.dart';
import 'env/staging_env.dart';

class AppConfig extends GetxService {
  late Env _env;

  Env get env => _env;
  String get baseUrl => _env.baseUrl;


  Future<void> setup(String environment) async {
    switch (environment) {
      case Environment.production:
        _env = ProductionEnv();
        break;
      case Environment.staging:
        _env = StagingEnv();
        break;
      default:
        throw Exception('Unknown environment: $environment');
    }
    Get.put<Env>(_env);
  }
}