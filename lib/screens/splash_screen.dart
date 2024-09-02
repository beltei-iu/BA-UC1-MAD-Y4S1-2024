import 'package:flutter/material.dart';
import 'package:mad2/localization/app_localization.dart';
import 'package:mad2/routes.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10));
    _opacity = 1.0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 4),
                curve: Curves.easeInOut,
                child: Center(
                  child: Image.asset("assets/images/beltei_iu_logo.png", width: 100,),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(onPressed: (){
                  RouteGenerator.key.currentState?.pushReplacementNamed(RouteGenerator.homePage);
                }, child: Text(AppLocalization.of(context)!.translate(LocKey.getStart.name)))),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
