// ignore_for_file: unused_local_variable

import 'package:cloths_app/users/auth/signup_face.dart';
import 'package:cloths_app/users/common/reuse_widgets.dart';
import 'package:cloths_app/users/controller/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInFace extends StatelessWidget {
  const LogInFace({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var controller = Get.find<LogInController>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: height / 8,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: controller.key,
                  child: Column(
                    children: [
                      // ==== Email Field ======//
                      Obx(
                        () => inputField(
                            label: 'Email',
                            icon: controller.emailComplete.value == 'true'
                                ? Icon(Icons.check,
                                    color: Colors.green.shade800)
                                : controller.emailComplete.value == 'false'
                                    ? IconButton(
                                        onPressed: () {
                                          controller.emailController.text = '';
                                          controller.emailComplete.value = '';
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.red.shade800,
                                        ))
                                    : const Icon(null),
                            controller: controller.emailController,
                            isPassword: false,
                            save: (value) {
                              controller.email = value;
                            },
                            validate: (value) {
                              return controller.emailValidation(value);
                            }),
                      ),

                      //=======================//

                      //======= Password Field =====//
                      Obx(
                        () => inputField(
                          icon: controller.passwordComplete.value == 'true'
                              ? Icon(Icons.check, color: Colors.green.shade800)
                              : controller.passwordComplete.value == 'false'
                                  ? IconButton(
                                      onPressed: () {
                                        controller.passwordController.text = '';
                                        controller.passwordComplete.value = '';
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red.shade800,
                                      ))
                                  : const Icon(null),
                          label: 'Password',
                          controller: controller.passwordController,
                          isPassword: true,
                          save: (value) {
                            controller.password = value;
                          },
                          validate: (value) {
                            return controller.passwordValidation(value);
                          },
                        ),
                      ),

                      //============================//

                      //  == Row For Text of forget Password ==//
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Get.to(
                                //   const ForgotFace(),
                                // );
                              },
                              child: const Text(
                                'Forgot your password?',
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ),
                      //  ============== END OF ROW   ===============//

                      //  ===== SIZE box  ======//
                      const SizedBox(
                        height: 20.0,
                      ),
                      //============ End ========//

                      //========== Container For Log in button   =======//
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.checkLogin();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: controller.loading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      ),

                      //============= END of Log in Button ==========//
                    ],
                  ),
                ),
                //============= END OF FORM ================//
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ary You an Admin?',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 15.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          const SignUpFace(),
                        );
                      },
                      child: const Text(
                        '  SignUp!',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text('OR'),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not have Account',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 15.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(
                        // const SignUpFace(),
                        // );
                      },
                      child: const Text(
                        '  Click Here',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
