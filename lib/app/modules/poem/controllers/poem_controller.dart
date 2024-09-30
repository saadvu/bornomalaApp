import 'package:bornomala/app/data/poems/poem_model.dart';
import 'package:get/get.dart';

class PoemController extends GetxController {
  late Poem poem;

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      poem = Get.arguments as Poem;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
