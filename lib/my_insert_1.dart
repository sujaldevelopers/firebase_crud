import 'package:firebase3/my_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInsert1 extends StatefulWidget {
  const MyInsert1({super.key});

  @override
  State<MyInsert1> createState() => _MyInsert1State();
}

class _MyInsert1State extends State<MyInsert1> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  late DatabaseReference dbRef;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("user1");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Insert Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Insert Your Data Hear", style: TextStyle(fontSize: 30)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: namecontroller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Enter Name",
              labelText: "Name",
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
              hintText: "Enter Age",
              labelText: "Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Map<String, String> students = {
                "name": namecontroller.text,
                "age": agecontroller.text,
                // "salary": usersalarycontroller.text,
              };
              dbRef.push().set(students);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
            child: Text(
              "Insert Data",
            ),
            color: Colors.blue,
            textColor: Colors.white,
            minWidth: 300,
            height: 40,
          ),
        ],
      ),
    );
  }
}
