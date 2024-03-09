import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/anotherpage.dart';
import 'pages/successpage.dart';
import 'components/textfield.dart';

void main() async {
  // Initialize Firebase asynchronously
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewClass(),
  ));
}

class NewClass extends StatefulWidget {
  const NewClass({Key? key}) : super(key: key);
  
  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if login is successful
      if (userCredential.user != null) {
        // Navigate to the SuccessPage if login is successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessPage()),
        );
      } else {
        // Handle unsuccessful login
        log("Invalid credentials");
      }
    } catch (e) {
      // Handle any errors that occur during the login process
      log("Error during login: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 195, 80, 71),
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Image(
              image: AssetImage('images/lockicon1.png'),
              height: 100.0,
            ),
            SizedBox(height: 40),
            Text(
              "Welcome Back!",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              height: 40.0,
            ),
           
            MyTextField(
              controller: emailController,
              hintText: 'Enter Email',
              obscureText: false,
            ),

            SizedBox(
              height: 20.0,
            ),
           
            MyTextField(
              controller: passwordController,
              hintText: 'Enter Password',
              obscureText: true,
            ),
            
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
               login();
              },
              child: const Text(
                "Log in",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60.0,
            ),
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnotherScreen()),
                );
              },
              child: Text("Sign Up",
              style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}

