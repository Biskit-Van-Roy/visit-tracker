import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visit_tracker/screens/login_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
            top:70,
            left: 50,
            child: Hero(
              tag: 'visit',
              child: SlideInLeft(
                 duration: const Duration(seconds: 2),
                child: SizedBox(
                  width: 400,
                  child: Text('VISIT', style: GoogleFonts.khand(
                                                textStyle: const TextStyle(color: Colors.black, fontSize: 130,fontWeight: FontWeight.bold),
                                                 ),
                              ),
                ),
              ),
            ),
          ),
          Positioned(
          top: 350,
          right: -150,
          child: Hero(
            tag: 'tracker',
            child: Transform.rotate(
              angle: -90 * (3.14159265358979323846264338327950288 / 180), // Convierte grados a radianes
              child: SlideInLeft(
                duration: const Duration(seconds: 2),
                child: Text(
                  'TRACKER',
                  style: GoogleFonts.khand(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 130,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
              ),
          ),
          ),
          Positioned(
          bottom: 30,          
          child: GestureDetector(
            onTap: (){
                   final route = MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
        Navigator.push(context, route);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FadeIn(
                        duration: const Duration(seconds: 2),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'boton', 
                      child: Text(
                        'CONTINUAR',
                        style: GoogleFonts.khand(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 9, 89, 155),
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                    ),
                      Icon(Icons.chevron_right,size: 50,color: Color.fromARGB(255, 8, 96, 154),)
                  ],
                ),
              ),
            ),
          ),
          ),

        ]),
      ),
      
    );
  }
}