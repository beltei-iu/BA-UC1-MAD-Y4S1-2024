import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("AnimateContainer"),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            color: _isExpanded ? Colors.red : Colors.orange,
            alignment: _isExpanded ? Alignment.center : AlignmentDirectional.topCenter,
            curve: Curves.easeInOut,
          )
        ),
      )
    );
  }
}
