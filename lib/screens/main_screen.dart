import 'package:flutter/material.dart';
import 'package:mad2/localization/app_localization.dart';
import 'package:mad2/screens/class_screen.dart';
import 'package:mad2/screens/home_screen.dart';
import 'package:mad2/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;

  var screenList = [
    HomeScreen(),
    ClassScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalization.of(context)!.translate(LocKey.home.name),),
        BottomNavigationBarItem(icon: Icon(Icons.class_rounded), label: AppLocalization.of(context)!.translate(LocKey.classroom.name)),
        BottomNavigationBarItem(icon: Icon(Icons.more), label: AppLocalization.of(context)!.translate(LocKey.more.name))
      ],
      unselectedFontSize: 14,
      selectedFontSize: 16,
      elevation: 10,
      fixedColor: Colors.cyan,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      drawer: Drawer(

      ),
      body: screenList.elementAt(_currentIndex),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
