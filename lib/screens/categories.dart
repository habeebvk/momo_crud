import 'package:cloud_firestore/cloud_firestore.dart';  
import 'package:flutter/material.dart';
import 'package:get/get.dart';  
import 'package:google_fonts/google_fonts.dart';  
import 'package:mimo/models/models.dart';
import 'package:mimo/screens/tasks.dart';  
import 'package:mimo/services/services.dart';  

class CategoryScreen extends StatefulWidget {  
  const CategoryScreen({super.key});  

  @override  
  State<CategoryScreen> createState() => _CategoryScreenState();  
}  

class _CategoryScreenState extends State<CategoryScreen> {  
  TextEditingController nameController = TextEditingController();  
  TextEditingController placeController = TextEditingController();  
  FirebaseService ser = FirebaseService();  
  FirebaseFirestore cool = FirebaseFirestore.instance;  

  @override  
  Widget build(BuildContext context) {  
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;  
    Color cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;  
    Color textColor = isDarkMode ? Colors.white : Colors.black; 
    Color butttonColor = isDarkMode ? Colors.blue : Colors.white;
    return Scaffold(  
      backgroundColor: isDarkMode ? Colors.black : Colors.white, 
      appBar: AppBar(  
        backgroundColor: isDarkMode ? Colors.black : Colors.white, 
        leading: Padding(  
          padding: const EdgeInsets.all(10),  
          child: CircleAvatar(  
            radius: 30,  
            backgroundImage: AssetImage("assets/bohemian-man-with-his-arms-crossed.jpg"),  
          ),  
        ),  
        title: Text("Categories", style: TextStyle(color: textColor)),  
        centerTitle: true,  
        actions: [  
          Padding(  
            padding: const EdgeInsets.all(10),  
            child: Icon(Icons.search, color: textColor),  
          )  
        ],  
      ),  
      body: SingleChildScrollView(  
        child: Column(  
          children: [  
            Card(  
              elevation: 3,  
              margin: EdgeInsets.all(20),  
              child: Container(  
                width: MediaQuery.of(context).size.width/.7,  
                height:MediaQuery.of(context).size.height/5,  
                color: cardColor,  
                child: Row(  
                  children: [  
                    SizedBox(width: 20,),  
                    CircleAvatar(  
                      radius: 30,  
                      backgroundImage: AssetImage("assets/bohemian-man-with-his-arms-crossed.jpg"),  
                    ),  
                    SizedBox(width: 20,),  
                    Column(  
                      mainAxisAlignment: MainAxisAlignment.center,  
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [  
                        Text("""\"The memory is a shield 
and life helper\"""", style:GoogleFonts.montserrat(fontSize: 16,color: textColor)),  
                        SizedBox(height: 10,),  
                        Text("Tammin Al Barghouthi",style: TextStyle(color: textColor),)  
                      ],  
                    )  
                  ],  
                ),  
              ),  
            ),  
            StreamBuilder(  
              stream: cool.collection("Identity").snapshots(),   
              builder: (context, snapshot) {  
                if (!snapshot.hasData) {  
                  return CircularProgressIndicator();  
                }  
                
                var a = snapshot.data!.docs;  
                return Padding(  
                  padding: const EdgeInsets.only(left: 18, right: 18),  
                  child: GridView.builder(  
                    shrinkWrap: true,  
                    physics: NeverScrollableScrollPhysics(),   
                    itemCount: a.length,  // Add 1 for the add button  
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                      mainAxisSpacing: 2,  
                      crossAxisSpacing: 2,  
                      childAspectRatio: 1,  
                    ),   
                    itemBuilder: (context, i) {  
                      // Add button card  
                      if (i == 0) {  
                        return Card(  
                          elevation: 3,  
                          child: Container(  
                            color: cardColor,   
                            child: IconButton(  
                              icon: CircleAvatar(  
                                radius: 40,  
                                backgroundColor: textColor,  
                                child: Icon(Icons.add, color: butttonColor),  
                              ),  
                              onPressed: () {  
                                _showAddDialog(context);  
                              }  
                            )  
                          )  
                        );  
                      }  
                      
                      // Actual content cards  
                      var details = a[i].data();  
                      var name = details["Name"];  
                      var place = details["Place"];  
                      var docid = a[i].id;  
                      
                      return GestureDetector(
                        onTap: () => Get.to(TaskScreen()),
                        child: Card(  
                          elevation: 3,  
                          child: Container(  
                            color: cardColor,  
                            child: Column(  
                              mainAxisAlignment: MainAxisAlignment.center,  
                              children: [  
                                Text(  
                                  name ?? 'No Name',   
                                  style: GoogleFonts.montserrat(  
                                    fontSize: 16, 
                                    color: textColor,  
                                    fontWeight: FontWeight.bold  
                                  )  
                                ),  
                                SizedBox(height: 10),  
                                Text(  
                                  place ?? 'No Place',   
                                  style: GoogleFonts.montserrat(
                                    color: textColor,  
                                    fontSize: 14  
                                  )  
                                ),  
                                SizedBox(height: 20,), 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(onPressed: (){
                                      ser.deleteData(docid);
                                    }, icon: Icon(Icons.delete,color: textColor,)),
                                    IconButton(onPressed: (){
                                showDialog(context: context, builder: (i){
                                  return AlertDialog(
                                  title: Column(
                                    children: [
                                      Text('Enter Name',style: TextStyle(fontSize: 18,color: textColor),),
                                      TextFormField(controller: nameController,),
                                      SizedBox(height: 20,),
                                      Text('Enter Place',style: TextStyle(fontSize: 18,color: textColor)),
                                      TextFormField(controller: placeController,),
                                      SizedBox(height: 20,),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black
                                        ),
                                        onPressed: (){
                                          ser.updateData(nameController.text,placeController.text,docid);
                                          Navigator.of(context).pop;
                                        }, child: Text("Update",style:TextStyle(color: Colors.white),))
                                    ],
                                        )
                                    ); 
                                          }
                                          );
                                      }, icon: Icon(Icons.edit,color: textColor,))
                                  ],
                                ),
                                
                              ],  
                            ),  
                          ),  
                        ),
                      );  
                    }  
                  )  
                );  
              }  
            ),  
            SizedBox(height: 20,),  
          ],  
        ),  
      ),  
    );  
  }  

  void _showAddDialog(BuildContext context) {  
    showDialog(  
      context: context,   
      builder: (context) {  
        return AlertDialog(  
          title: Text('Add New Entry'),  
          content: Column(  
            mainAxisSize: MainAxisSize.min,  
            children: [  
              TextField(  
                controller: nameController,  
                decoration: InputDecoration(  
                  labelText: 'Enter Name',
                ),  
              ),  
              SizedBox(height: 10),  
              TextField(  
                controller: placeController,  
                decoration: InputDecoration(  
                  labelText: 'Enter Place',  
                ),  
              ),  
            ],  
          ),  
          actions: [  
            TextButton(  
              onPressed: () {  
                Navigator.of(context).pop();  
              },   
              child: Text('Cancel',)  
            ),  
            ElevatedButton(  
              style: ElevatedButton.styleFrom(  
                backgroundColor: Colors.black  
              ),  
              onPressed: () {  
                // Send data to Firestore  
                ser.sendData(nameController.text, placeController.text);  
                
                // Clear controllers  
                nameController.clear();  
                placeController.clear();  
                
                // Close dialog  
                Navigator.of(context).pop();  
              },   
              child: Text(  
                "Add",   
                style: TextStyle(color: Colors.white)  
              )  
            )  
          ],  
        );  
      }  
    );  
  }
}