import 'package:cloths_app/users/controller/home_controller.dart';
import 'package:cloths_app/users/controller/login_controller.dart';
import 'package:cloths_app/users/controller/signup_controller.dart';
import 'package:get/instance_manager.dart';

class AllBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<LogInController>(LogInController());
    Get.put<SignupController>(SignupController());
  }
}
