import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_crud/pages/login_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  // final Map show;
  final String namectrl;

  Homepage({super.key, required this.namectrl});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(
          'Home page',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: readData(),
            ),
            ElevatedButton(
              onPressed: updateData,
              child: text('Update'),
            ),
            ElevatedButton(
              onPressed: deleteData,
              child: text('Delete'),
            ),
          ],
        ),
      ),
    );
  }

  readData() {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('User').doc(widget.namectrl);

    reference.get().then((value) {
      return Column(
        children: [
          Text('Name :- ${value.get('Name')}'),
          Text('Email :- ${value.get('Email-id')}'),
          Text('Password :- ${value.get('pwd')}'),
        ],
      );
    });
  }

  updateData() {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('User').doc(widget.namectrl);

    Map<String, dynamic> userdata = {};

    reference.update(userdata).whenComplete(() => print('Updated Successful'));
  }

  deleteData() {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('User').doc(widget.namectrl);

    reference.delete().whenComplete(() => print('Deleted Successful'));
  }
}
