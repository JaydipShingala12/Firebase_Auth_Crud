import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_crud/components/my_textfield.dart';
import 'package:firebase_auth_crud/pages/sign_in_page.dart';

import '../components/my_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controller for both the Text Fields
  final useremailcontroller = TextEditingController();
  final userpwdcontroller = TextEditingController();

  // Sign in User method
  void signInUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // user try to sign in
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: useremailcontroller.text,
      password: userpwdcontroller.text,
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
                const SizedBox(height: 20),
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
                MyButton(buttonText: "Sign in", onTap: signInUser),

                const SizedBox(height: 30),

                // not a member the Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Don't have account?",
                        fs: 16.0, clr: Colors.grey.shade800),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      ),
                      child: text(
                        "Register now",
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

Text text(txt, {clr, fW, fs}) {
  return Text(
    "$txt",
    style: TextStyle(
      color: clr ?? Colors.black,
      fontWeight: fW ?? FontWeight.bold,
      fontSize: fs ?? 20,
    ),
  );
}
