import 'package:flutter/material.dart';

class AddNewsScreen extends StatefulWidget {

  const AddNewsScreen({super.key});

  @override
  State<AddNewsScreen> createState() => _State();
}

class _State extends State<AddNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add News"),
        elevation: 5,
      ),
      body: Center(
        child: Text(""),
      )
    );
  }
}
