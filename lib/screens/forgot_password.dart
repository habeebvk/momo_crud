import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimo/auth/services.dart';
import 'package:mimo/widgets/mainhead.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuthServices();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;  
    Color cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;  
    Color textColor = isDarkMode ? Colors.white : Colors.black; 
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            const SizedBox(height: 150,),
            const Mainhead(text: 'Forgot Password',),
            const SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Form(
                  child:Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: TextFormField(
                          controller: email,
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
                      SizedBox(height: 20,),
                      Text("Enter the email address you used to create your account and we will make you a link to reset your password",style: GoogleFonts.montserrat(color: textColor),),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: ()async{
                           await _auth.sendPasswordResetLink(email.text);
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An Email Reset link has been sent to your email.Please check it"),backgroundColor: Colors.red,));
                          }, child: Text("Continue")),
                      ),
                    ]
                      ),
                )
            )
          ],
        ) ),
    );
  }
}