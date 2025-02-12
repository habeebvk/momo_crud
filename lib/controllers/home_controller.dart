import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
}