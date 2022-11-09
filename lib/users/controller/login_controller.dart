// ignore_for_file: unnecessary_null_comparison, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  // initate GetStorage
  // final getStorage = GetStorage();
  // var splash = Get.find<SplashController>();
  // Form Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // decloration controller
  late TextEditingController emailController, passwordController;

  // valiable for controller with no value
  var email = '';
  var password = '';

  //init function with decleration controller
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  // variable for complete mark
  var emailComplete = ''.obs;

// email validation
  String? emailValidation(String value) {
    if (value == null || value.isEmpty) {
      emailComplete.value = 'false';
      return 'Please Fill this Field';
    } else if (!GetUtils.isEmail(value)) {
      emailComplete.value = 'false';
      return 'Please provide Validate Email';
    } else {
      emailComplete.value = 'true';
      return null;
    }
  }

  // variable for complete mark
  var passwordComplete = ''.obs;

  // password validation
  String? passwordValidation(String value) {
    if (value == null || value.isEmpty) {
      passwordComplete.value = 'false';
      return 'Please Fill this Field';
    } else if (value.length <= 5) {
      passwordComplete.value = 'false';
      return 'Password Must be 6 letter';
    } else {
      passwordComplete.value = 'true';
      return null;
    }
  }

  // variable for loading
  var loading = false.obs;

  // CheckLogin
  void checkLogin() async {
    final isValid = key.currentState!.validate();

    if (!isValid) {
      return;
    }
    key.currentState!.save();
    loading.value = true;
    // bool checkValidation = await emailValidate();
    if (emailValid.value) {
      // getStorage.write('id', 1);
      // Get.offAll(const HomeFace());
    } else {
      Get.snackbar(
        'You Enter Wrong Email or Password',
        'Please Enter a Correct Email And Password',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    emailController.text = '';
    passwordController.text = '';
    passwordComplete.value = '';
    emailComplete.value = '';
    loading.value = false;
  }

  var emailValid = false.obs;
// Validate Email
  // Future<bool> emailValidate() async {
  //   var data = await HomeDBHelper.instance.getData();
  //   for (var i = 0; i < data.length; i++) {
  //     if (data[i]['email'] == email && data[i]['password'] == password) {
  //       emailValid.value = true;

  //       break;
  //     }
  //   }
  //   return emailValid.value;
  // }

  // close  function
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
