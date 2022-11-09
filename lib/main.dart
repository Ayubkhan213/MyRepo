import 'package:cloths_app/users/auth/login_face.dart';
import 'package:cloths_app/users/binding/all_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Cloths App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LogInFace(),
    );
  }
}
