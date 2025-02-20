import 'package:dio/dio.dart' as dio; // Add alias here
import 'package:get/get.dart';
import 'package:myapp/core/config/env/env.dart';


class ApiProvider {
  final Env _env = Get.find<Env>();

  Future<dio.Response> getData() async { // Use aliased Response
    return Get.find<dio.Dio>().get('${_env.baseUrl}/data');
  }
}