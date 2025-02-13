import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo/auth/services.dart';
import 'package:mimo/models/models.dart';
import 'package:mimo/services/services.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
    TextEditingController taskController = TextEditingController();
    FireServices pat = FireServices();
    FirebaseFirestore tit4tat = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;  
    Color cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;  
    Color textColor = isDarkMode ? Colors.white : Colors.black; 
    Color butttonColor = isDarkMode ? Colors.blue : Colors.white;
    return Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white, 
        floatingActionButton: FloatingActionButton(foregroundColor: butttonColor,backgroundColor: textColor,shape:CircleBorder(),tooltip:"Increment",onPressed: (){
            showDialog(context: context, builder: (context){
                return AlertDialog(
                    title: Text("New Task",style: TextStyle(color: textColor),),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                            TextField(
                                controller: taskController,
                                decoration: InputDecoration(
                                    label: Text("Enter task",style: TextStyle(color: textColor),)
                                ),
                            ),
                            const SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                                pat.retrieveData(taskController.text);
                                taskController.clear();
                                Navigator.pop(context);
                            }, child: Text("Submit",style: TextStyle(color: textColor),))
                        ],
                    ),
                );
            });
        },child: const Icon(Icons.add),),
        appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white, 
            leading: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.arrow_back,color: textColor,)),
            title: const Text("Sports"),
            centerTitle: true,
            actions: [
                Padding(
                  padding:  const EdgeInsets.all(10),
                  child: Icon(Icons.search,color: textColor,),
                )
            ],
        ),
      body: StreamBuilder(stream: tit4tat.collection("Tasks").snapshots(), builder:(context,snapshot){
         if (!snapshot.hasData) {  
                  return Center(child: const CircularProgressIndicator());  
                }    
        var b = snapshot.data!.docs;
        return ListView.builder(
            shrinkWrap: true,
            itemCount: b.length,
            itemBuilder: (context,index){
            var info = b[index].data();
            var task = info["Task"];
            return ListTile(
                title: Text(task ?? '',style: TextStyle(color: textColor),),
        );
            }
      );
      })
    );
  }
}