import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aao jee",
        )
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            "Success",
          style: TextStyle(color: Colors.white),),
            ),
      ),
    );
  }
}