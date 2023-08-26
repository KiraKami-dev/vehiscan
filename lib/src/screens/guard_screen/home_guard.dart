import 'package:flutter/material.dart';

class GuardHome extends StatefulWidget {
  const GuardHome({super.key});

  @override
  State<GuardHome> createState() => _GuardHomeState();
}

class _GuardHomeState extends State<GuardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("This is Guard"),),);;
  }
}