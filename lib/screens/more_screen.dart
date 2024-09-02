import 'package:flutter/material.dart';
import 'package:mad2/localization/app_localization.dart';
import 'package:mad2/routes.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.translate(LocKey.more.name)),
        elevation: 5,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(AppLocalization.of(context)!.translate(LocKey.language.name)),
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.languagePage);
              },
            ),
          )
        ],
      ),
    );
  }
}
