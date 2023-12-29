import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdatePAGE extends StatefulWidget {
  const UpdatePAGE({super.key, required this.studentkey});

  final String studentkey;

  @override
  State<UpdatePAGE> createState() => _UpdatePAGEState();
}

class _UpdatePAGEState extends State<UpdatePAGE> {
  final usernamecontroller = TextEditingController();
  final useragecontroller = TextEditingController();
  final usersalarycontroller = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("Student");
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentkey).get();
    Map student = snapshot.value as Map;
    usernamecontroller.text = student['name'];
    useragecontroller.text = student['age'];
    usersalarycontroller.text = student['salary'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Record"),
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
                    dbRef.child(widget.studentkey).update(students).then(
                          (value) => {
                            Navigator.pop(context),
                          },
                        );
                  },
                  child: Text(
                    "Update Data",
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
