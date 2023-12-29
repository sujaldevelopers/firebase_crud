import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyUpdate extends StatefulWidget {
  const MyUpdate({super.key, required this.userKey});

  final String userKey;

  @override
  State<MyUpdate> createState() => _MyUpdateState();
}

class _MyUpdateState extends State<MyUpdate> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("user1");
    getuserdata();
  }

  void getuserdata() async {
    DataSnapshot snapshot = await dbRef.child(widget.userKey).get();
    Map user = snapshot.value as Map;
    namecontroller.text = user['name'];
    agecontroller.text = user['age'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Update Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Update Your Data Hear",
            style: TextStyle(fontSize: 25),
          ),
          TextFormField(
            controller: namecontroller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Update Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: agecontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Age",
              hintText: "Update Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Map<String, String> user = {
                "name": namecontroller.text,
                "age": agecontroller.text,
              };
              dbRef.child(widget.userKey).update(user).then((value) {
                Navigator.pop(context);
              });
            },
            child: Text("Update Data"),
          ),
        ],
      ),
    );
  }
}
