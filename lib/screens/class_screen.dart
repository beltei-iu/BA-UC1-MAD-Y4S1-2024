import 'package:flutter/material.dart';
import 'package:mad2/localization/app_localization.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.translate(LocKey.classroom.name)),
        elevation: 5,
      ),
      body: Center(
        child: Text("No Data"),
      ),
    );
  }
}
