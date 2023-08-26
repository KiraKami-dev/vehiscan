import 'package:flutter/material.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class InvalidScreen extends StatefulWidget {
  const InvalidScreen({super.key});

  @override
  State<InvalidScreen> createState() => _InvalidScreenState();
}

class _InvalidScreenState extends State<InvalidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(child: Text("Lamo")),
    );
  }
}
