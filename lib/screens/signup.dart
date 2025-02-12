import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimo/auth/services.dart';
import 'package:mimo/controllers/home_controller.dart';
import 'package:mimo/screens/categories.dart';
import 'package:mimo/screens/forgot_password.dart';
import 'package:mimo/screens/homescreen.dart';
import 'package:mimo/screens/login.dart';
import 'package:mimo/widgets/mainhead.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        child:
        Column(
          children: [
            SizedBox(height: 150,),
            Mainhead(text: 'Create an Account',),
            SizedBox(height: 20,),
             Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Form(
                  key: controller.signupFormKey,
                  child:Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          controller: controller.usernameController,
                          validator: (value){
                                    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                      return "Enter correct name";
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
                            hintText: "Full Name"
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          controller: controller.emailController,
                          validator: (value){
                                    if (value!.isEmpty || !RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                                      return "Enter valid Email";
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
                            hintText: "Email"
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          controller: controller.passwordController,
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
                      const SizedBox(height: 20,),
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          controller: controller.passwordController,
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
                            hintText: "Confirm Password"
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: (){
                          Get.to(ForgotPassword());
                        }, child: const Text("Forgot Password?"))),
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
                          onPressed: signup, child: Text("Continue")),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 60,),
                          Text("Already have an account?",style: TextStyle(color: textColor),),
                          TextButton(onPressed: (){
                            Get.to(LoginScreen());
                          }, child: Text("Login",style: TextStyle(decoration: TextDecoration.underline,color: textColor),))
                        ],
                      )
                    ],
                  ) ),
              )
          ],
        ) ),
    );
  }
    signup()async{
    if (controller.signupFormKey.currentState!.validate()) {
        final user = await _auth.createUserWithEmailAndPassword(controller.emailController.text,controller.passwordController.text);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User created successfully"),backgroundColor: Colors.green,));
      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()));
      }  
    }
  }  
}

