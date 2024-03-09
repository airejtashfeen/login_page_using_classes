import 'package:flutter/material.dart';
  
class MyTextField extends StatelessWidget {
final TextEditingController controller;
final String hintText;
final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: hintText,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            );
  }
}