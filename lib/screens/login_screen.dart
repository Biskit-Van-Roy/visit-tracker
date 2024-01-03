import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visit_tracker/screens/Administrador/home_screen.dart';
import 'package:visit_tracker/screens/Guardiania/home_screen.dart';
import 'package:visit_tracker/screens/Residente/home_screen.dart';
import 'package:visit_tracker/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    getUsuarios();
  }

  void getUsuarios() async {
    print('estoy dentro de la funcion');
    CollectionReference tipoUsuario =
        FirebaseFirestore.instance.collection('usuarios');
    QuerySnapshot querySnapshot = await tipoUsuario.get();
    if (querySnapshot.docs.length > 0) {
      String tipoUsuario = querySnapshot.docs[0].get('tipo_cuenta');
      print('Clave de autorización: $tipoUsuario');
      if (tipoUsuario == 'admin') {
        final route =
            MaterialPageRoute(builder: (context) => HomeScreenAdministrador());
        Navigator.pushReplacement(context, route);
      } else if (tipoUsuario == 'residente') {
        final route =
            MaterialPageRoute(builder: (context) => HomeScreenResidente());
        Navigator.pushReplacement(context, route);
      } else if (tipoUsuario == 'guardiania') {
        final route =
            MaterialPageRoute(builder: (context) => HomeScreenGuardiania());
        Navigator.pushReplacement(context, route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Hero(
                    tag: 'tracker',
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('assets/icon/logo.png'),
                          width: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: 'visit',
                  child: Text(
                    'Iniciar Sesion',
                    style: GoogleFonts.khand(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Email', icon: Icon(Icons.mail)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(Icons.remove_red_eye_rounded)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          final route = MaterialPageRoute(
                              builder: (context) => RegisterScreen());
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          'REGISTRARSE',
                          style: GoogleFonts.khand(
                              fontSize: 20,
                              color: Color.fromARGB(255, 9, 89, 155),
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Recuperar contraseña',
                      style: GoogleFonts.khand(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: 'boton',
                  child: GestureDetector(
                    onTap: getUsuarios,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Ingresar',
                        style: GoogleFonts.khand(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
