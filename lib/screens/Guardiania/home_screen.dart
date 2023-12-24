import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenGuardiania extends StatefulWidget {
  const HomeScreenGuardiania({super.key});

  @override
  State<HomeScreenGuardiania> createState() => _HomeScreenGuardianiaState();
}

class _HomeScreenGuardianiaState extends State<HomeScreenGuardiania> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Bienvenido!',
              style: GoogleFonts.khand(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}