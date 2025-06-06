import 'package:get/get.dart';
import 'package:key_concept_practical_task/routes/routes_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(RoutesName.home);
  }
}
