import 'package:flutter/material.dart';

class HomeScreenResidente extends StatefulWidget {
  const HomeScreenResidente({super.key});

  @override
  State<HomeScreenResidente> createState() => _HomeScreenResidenteState();
}

class _HomeScreenResidenteState extends State<HomeScreenResidente> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      body: Column(
        children: [Container(child: const SizedBox(width: 200 ,),)],
      ),
  
        );
  }
}