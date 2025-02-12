import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainhead extends StatelessWidget {
  final String text;
  const Mainhead({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark; 
     Color textColor = isDarkMode ? Colors.white : Colors.black; 
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style:GoogleFonts.montserrat(fontSize: 25,color: textColor))
      ],
    );
  }
}