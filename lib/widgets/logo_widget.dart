import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, bottom: 50),
      child: Image.asset("assets/images/beltei_iu_logo.png", height: 150,),
    );
  }
}
