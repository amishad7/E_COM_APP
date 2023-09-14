import 'package:flutter/material.dart';

class DeatailPage extends StatefulWidget {
  const DeatailPage({super.key});

  @override
  State<DeatailPage> createState() => _DeatailPageState();
}

class _DeatailPageState extends State<DeatailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Deatil Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
