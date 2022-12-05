import 'package:get/get.dart';
import 'package:infinitus/data/controller/theme_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);
  }
}
