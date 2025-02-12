import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  final FirebaseFirestore a = FirebaseFirestore.instance;
  Future<void> sendData(String name, String place) async{
    Map<String,dynamic> contents = {
     "Name": name,
     "Place" : place
    };
    await a.collection("Identity").add(contents);
  }

  Future<void> deleteData(docid) async{
    await a.collection("Identity").doc(docid).delete();
  }

  Future<void> updateData(String name,String place,docid)async{
    await a.collection("Identity").doc(docid).update({"Name":name,"Place":place});
  }
}

class FireServices{
  final FirebaseFirestore b = FirebaseFirestore.instance;
  Future<void> retrieveData(String task) async{
    Map<String,dynamic> tasks = {
      "Task":task
    };
    await b.collection("Tasks").add(tasks);
  }
}