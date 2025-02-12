import 'package:flutter/material.dart';
import 'package:mimo/auth/services.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _auth = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        await _auth.signout(); 
        Navigator.pop(context);
      },child: Text("Logout"),),
    );
  }
}