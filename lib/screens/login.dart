import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo/auth/services.dart';
import 'package:mimo/controllers/home_controller.dart';
import 'package:mimo/screens/categories.dart';
import 'package:mimo/screens/forgot_password.dart';
import 'package:mimo/screens/homescreen.dart';
import 'package:mimo/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(HomeController());
  final _auth = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;  
    Color cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;  
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              const Image(image: AssetImage("assets/mimo.png"),width: 500,height: 200,),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Form(
                  key: controller.loginFormKey,
                  child:Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          validator: (value){
                                    if (value!.isEmpty || !RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                                      return "Enter valid Email";
                                    }else{
                                      return null;
                                    }
                                  },
                          decoration: InputDecoration(
                            fillColor: cardColor,
                            contentPadding: const EdgeInsets.all(10),
                            border: InputBorder.none,  
                            enabledBorder: InputBorder.none,  
                            focusedBorder: InputBorder.none,
                            hintText: "Email"
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          validator: (value){
                                    if (value!.isEmpty || value == null ) {
                                      return "Password field can't be empty";
                                    }else{
                                      return null;
                                    }
                            },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: InputBorder.none,
                            fillColor: cardColor,  
                            enabledBorder: InputBorder.none,  
                            focusedBorder: InputBorder.none,
                            hintText: "Password"
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: (){
                          Get.to(ForgotPassword());
                        }, child: Text("Forgot Password?",style: TextStyle(color: textColor),))),
                        SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: login, child: Text("Continue",style: TextStyle(color: textColor),)),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 30,),
                          Text("Don't have an account?",style: TextStyle(color: textColor),),
                          TextButton(onPressed: (){
                            Get.to(SignUpScreen());
                          }, child: Text("Register",style: TextStyle(decoration: TextDecoration.underline,color: textColor),))
                        ],
                      )
                    ],
                  ) ),
              )
            ],
          ),
        ) 
      ),
    );
  }
    login() async{
    if (controller.loginFormKey.currentState!.validate()) {
      final user = await _auth.loginUserWithEmailAndPassword(controller.emailController.text, controller.passwordController.text);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User logged-in successfully"),backgroundColor: Colors.green,));
      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()));
    }
    }
  }
}