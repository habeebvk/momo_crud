import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;  
    Color cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;  
    Color textColor = isDarkMode ? Colors.white : Colors.black; 
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title:Text("Settings",style: TextStyle(color: textColor),),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
      body:ListView(
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage:  NetworkImage("https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg")
                ),
              title: Text("Malak Idrissi",style: TextStyle(color: textColor)),
              subtitle: Text("Rabat,Morroco",style: TextStyle(color: textColor)),
              trailing: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
              ),
            ),
            const SizedBox(height: 10,),
            ListTile(
              title: Text("Hi! My Name is Malak.I'm a community manager from Rabat,Morroco.",style: TextStyle(color: textColor))
            ),
            const SizedBox(height: 20,),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text("Notifications",style: TextStyle(color: textColor)),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text("General",style: TextStyle(color: textColor)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Account",style: TextStyle(color: textColor)),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text("About",style: TextStyle(color: textColor)),
            )
          ],
      ),
    );
  }
}