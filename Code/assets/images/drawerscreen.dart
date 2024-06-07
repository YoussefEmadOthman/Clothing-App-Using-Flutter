import 'package:flutter/material.dart';

class drawerpage extends StatefulWidget{
  @override
  _drawerpageState createState() => _drawerpageState();
}

class _drawerpageState extends State<drawerpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 243, 215, 191),
            Color.fromARGB(255, 215, 145, 97)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}