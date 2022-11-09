// ignore_for_file: unnecessary_null_comparison, invalid_return_type_for_catch_error, avoid_print, unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:cloths_app/api_connection/api_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  // Form Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // decloration controller
  late TextEditingController nameController,
      passwordController,
      emailController;

  // valiable for controller with no value
  var name = '';
  var email = '';
  var password = '';

  //init function with decleration controller
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  // variable for complete mark
  var nameComplete = ''.obs;
  // name validation
  String? nameValidation(String value) {
    if (value == null || value.isEmpty) {
      nameComplete.value = 'false';
      return 'Please Fill this Field';
    } else {
      nameComplete.value = 'true';
      return null;
    }
  }

  // variable for complete mark
  var emailComplete = ''.obs;
  // email validation
  String? emailValidation(String value) {
    if (value == null || value.isEmpty) {
      emailComplete.value = 'false';
      return 'Please Fill this Field';
    } else if (!GetUtils.isEmail(value)) {
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
  final loading = false.obs;

  //check Signup
  void checkSignUp() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();
    loading.value = true;
    print(1);
    validateUserEmail();
    print(2);
  }

  //Validate User Email
  validateUserEmail() async {
    print(3);
    try {
      print(4);
      print(email.trim());
      var res = await http.post(Uri.parse(Api.validateEmail),
          body: {'user_email': email.trim()});
      print(jsonDecode(res.body));
      res.statusCode == 200
          ? print(jsonDecode(res.body))
          : print('Response donot come');
    } catch (e) {
      print(5);
      print(e);
    }
  }

  // close function
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
