import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {




  @override
  Widget build(BuildContext context) {

    SnackBar snackBar = SnackBar(content: Text("Welcome"));

    Dialog dialog = Dialog(
      child: Text("Welcome"),
    );
    final okDialog =  showDialog(context: context, builder: (BuildContext context) {
      return dialog;
    });

    return const Placeholder();
  }
}
