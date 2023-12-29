import 'package:firebase3/my_insert_1.dart';
import 'package:firebase3/update2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Query dbRef = FirebaseDatabase.instance.ref().child("user1");
  DatabaseReference reference = FirebaseDatabase.instance.ref().child("user1");

  Widget listUSer({required Map user}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Name :",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                user['name'],
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text("Age :", style: TextStyle(fontSize: 25)),
              Text(
                user['age'],
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyUpdate(userKey: user['key']),
                    ),
                  );
                },
                child: Icon(Icons.edit),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(user['key']).remove();
                },
                child: Icon(Icons.delete),
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
        title: Text("My Lists"),
      ),
      body: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map user = snapshot.value as Map;
          user['key'] = snapshot.key;
          return listUSer(user: user);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyInsert1(),
              ));
        },
      ),
    );
  }
}
