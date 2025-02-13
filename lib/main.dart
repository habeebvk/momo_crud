import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mimo/firebase_options.dart';
import 'package:mimo/screens/categories.dart';
import 'package:mimo/screens/forgot_password.dart';
import 'package:mimo/screens/login.dart';
import 'package:mimo/screens/settings.dart';
import 'package:mimo/screens/signup.dart';
import 'package:mimo/screens/tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();   
    bool isDarkMode = box.read('isDarkMode') ?? false; 
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),             
      darkTheme: ThemeData.dark(),          
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: SignUpScreen()
    );
  }
}