import 'package:firebase3/update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FatchData extends StatefulWidget {
  const FatchData({super.key});

  @override
  State<FatchData> createState() => _FatchDataState();
}

class _FatchDataState extends State<FatchData> {
  Query dbRef = FirebaseDatabase.instance.ref().child("Student");
  DatabaseReference reference=FirebaseDatabase.instance.ref().child("Student");

  Widget listItem({required Map student}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 110,
      color: Colors.blue.shade600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Text(
                student['name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),

          SizedBox(
            height: 5,
          ),
          Text(
            student['age'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                student['salary'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>UpdatePAGE(studentkey:student['key']),
                        ),
                      );
                    },
                    child: Row(
                      children: [Icon(Icons.edit)],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("hello");
                      reference.child(student['key']).remove();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fatch Data"),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map student = snapshot.value as Map;
            student['key'] = snapshot.key;
            return listItem(student: student);
          },
        ),
      ),
    );
  }
}
