import 'package:get/get.dart';

class LoaderController extends GetxController {
  List buttonLoader = [];
  List loader = [];

  static LoaderController get to => Get.find();
  void showLoader() {
    loader.add(null);
    update();
  }

  void hideLoader() {
    if (loader.isNotEmpty) {
      loader.removeAt(0);
      update();
    }
  }

  void showButtonLoader(key) {
    buttonLoader.add(key);
    update();
  }

  void hideButtonLoader(key) {
    buttonLoader.remove(key);
    update();
  }
}
