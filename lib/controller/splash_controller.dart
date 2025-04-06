import 'package:get/get.dart';

import '../routes/routes_name.dart';

class SplashController extends GetxController {
  var logoOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      logoOpacity.value = 1.0; // Fade in logo
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(RoutesName.roleSelectionScreen);
      });
    });
    // Get.offNamed(RoutesName.roleSelectionScreen);
  }
}
