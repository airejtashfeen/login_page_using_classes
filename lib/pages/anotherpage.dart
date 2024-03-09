
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/textfield.dart';


class AnotherScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  void createAccount() async{
    String email= emailController.text.trim();
    String password= passwordController.text.trim();
    String cpassword= cpasswordController.text.trim();

    if(email=='' || password=='' || cpassword==''){
      log("Please fill all the details");
    }
    else if(cpassword!=password){
      log("Passwords do not match");
    }
    else{
      //Create New Account
      UserCredential userCredential= await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: email, password: password);
      log('User created');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up page'),
      ),
      body: Center(
        child: Column(children: [
           SizedBox(
              height: 40.0,
            ),

            MyTextField(
              controller: emailController,
              hintText: 'Enter your email',
              obscureText: false
            ),

            SizedBox(
              height: 20.0,
            ),
            
           
            MyTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              obscureText: true
            ),

            SizedBox(
              height: 20.0,
            ),
            
            MyTextField(
              controller: cpasswordController,
              hintText: 'Confirm Password',
              obscureText: true
            ),
            SizedBox(
              height: 20.0,
            ),
             TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                createAccount();
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        ],),
      ),
    );
  }
}

