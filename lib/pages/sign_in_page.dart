import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_crud/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_crud/components/my_textfield.dart';

import '../components/my_button.dart';
import 'login_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // text controller for both the Text Fields
  final usernamecontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final userpwdcontroller = TextEditingController();

  // create new user
  void createuser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: useremailcontroller.text,
      password: userpwdcontroller.text,
    );

    // add User data into Firebase Firestore

    DocumentReference reference = FirebaseFirestore.instance
        .collection('User')
        .doc(usernamecontroller.text);

    Map<String, dynamic> userdata = {
      'Name': usernamecontroller.text,
      'Email-id': useremailcontroller.text,
      'pwd': userpwdcontroller.text,
    };

    reference.set(userdata).whenComplete(() => print('Add Successful'));

    // navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Homepage(
          namectrl: usernamecontroller.toString(),
        ),
      ),
    );

    // pop the loading circle
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome Text
                text('!! Welcome !!'),

                const SizedBox(height: 25),

                // username TextField
                MyTextField(
                  ctrl: usernamecontroller,
                  hintText: "Enter your Name",
                  obscureText: false,
                ),

                // useremail TextField
                MyTextField(
                  ctrl: useremailcontroller,
                  hintText: "Enter your Email-id",
                  obscureText: false,
                ),

                // Password TextField
                MyTextField(
                  ctrl: userpwdcontroller,
                  hintText: "Enter your Password",
                  obscureText: true,
                ),

                // Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text(
                        'Forgot Password?',
                        clr: Colors.grey.shade700,
                        fs: 18.0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // signin button
                MyButton(buttonText: "Sign up", onTap: createuser),

                const SizedBox(height: 30),

                // not a member the Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Already Registered?",
                        fs: 16.0, clr: Colors.grey.shade800),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                      child: text(
                        "Sign in",
                        fs: 18.0,
                        clr: Colors.orange.shade900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
