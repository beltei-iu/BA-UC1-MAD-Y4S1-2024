import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
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
