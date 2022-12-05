//how to switch theme mode in flutter getx?
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }

  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        actions: [
          GetBuilder<ThemeController>(
            builder: (controller) => IconButton(
                icon: Icon(
                  controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: () => controller.toggleDarkMode()),
          ),
        ],
      ),
    );
  }
}
