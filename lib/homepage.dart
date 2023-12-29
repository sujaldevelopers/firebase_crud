import 'package:firebase3/fatchdata.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernamecontroller = TextEditingController();
  final useragecontroller = TextEditingController();
  final usersalarycontroller = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("Student");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Insert Data IN FireBase RealTimeDatabase",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: usernamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Name",
                    labelText: "Name",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: useragecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Age",
                    labelText: "Age",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: usersalarycontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Salary",
                    labelText: "Salary",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> students = {
                      "name": usernamecontroller.text,
                      "age": useragecontroller.text,
                      "salary": usersalarycontroller.text,
                    };
                    dbRef.push().set(students);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FatchData(),
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
          ),
        ),
      ),
    );
  }
}
