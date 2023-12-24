import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Controladores de las entradas
  TextEditingController nombreControlador = TextEditingController();
  TextEditingController apellidoControlador = TextEditingController();
  TextEditingController cedulaControlador = TextEditingController();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController telefonoControlador = TextEditingController();
  TextEditingController administradorControlar = TextEditingController();
  TextEditingController residenteControlador = TextEditingController();
  TextEditingController guardianiaControlador = TextEditingController();
  TextEditingController passwordControlador = TextEditingController();
  TextEditingController confirmPasswordControlador = TextEditingController();
  //Variables de los campos ocultos
  bool showAdminTextField = false;
  bool showResidentTextField = false;
  bool showGuardianiaTextField = false;
  String tipoDeCuenta = '';
  String claveAutorizacion = '';
  /**
   * FUNCION PARA REGISTRAR
   */
  Future<void> registrar() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (nombreControlador.text.isEmpty ||
        apellidoControlador.text.isEmpty ||
        cedulaControlador.text.isEmpty ||
        emailControlador.text.isEmpty ||
        telefonoControlador.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'No se puede continuar',
            style: GoogleFonts.khand(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          content: Text(
            'Por favor, completa todos los campos.',
            style: GoogleFonts.khand(
                color: const Color.fromARGB(255, 53, 146, 193),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      );
      return;
    } else if (!showAdminTextField &&
        !showGuardianiaTextField &&
        !showResidentTextField) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'No se puede continuar',
            style: GoogleFonts.khand(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          content: Text(
            'Selecciona al menos un rol',
            style: GoogleFonts.khand(
                color: const Color.fromARGB(255, 53, 146, 193),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      );
    } else if (showAdminTextField && administradorControlar.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'No se puede continuar',
            style: GoogleFonts.khand(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          content: Text(
            'Ingrese la clave porporcionada por Visit Tracker',
            style: GoogleFonts.khand(
                color: const Color.fromARGB(255, 53, 146, 193),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      );
    } else if (showResidentTextField && residenteControlador.text.isEmpty ||
        showGuardianiaTextField && guardianiaControlador.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'No se puede continuar',
            style: GoogleFonts.khand(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          content: Text(
            'Ingrese la clave porporcionada por el administrador',
            style: GoogleFonts.khand(
                color: const Color.fromARGB(255, 53, 146, 193),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      );
    } else {
      //PARA IMPLEMENTAR NOTIFICACIONES EN IOS TOCA PAGAR EL DEVELOP DE APP
      // String? token = await FirebaseMessaging.instance.getAPNSToken();
      // print(token);
      CollectionReference claveRegistro =
          FirebaseFirestore.instance.collection('claves_autorizacion');
      QuerySnapshot querySnapshot = await claveRegistro.get();
      if (querySnapshot.docs.length > 0) {
        claveAutorizacion = querySnapshot.docs[0].get('id_autorizacion');
        print('Clave de autorización: $claveAutorizacion');
      }
      if (claveAutorizacion == administradorControlar.text) {
        try {
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
            email: emailControlador.text,
            password: passwordControlador.text,
          );
          if (showAdminTextField) {
            tipoDeCuenta = 'admin';
          } else if (showResidentTextField) {
            tipoDeCuenta = 'residente';
          } else if (showAdminTextField) {
            tipoDeCuenta = 'guardiania';
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.black,
                title: Text(
                  'ERROR!!!',
                  style: GoogleFonts.khand(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                content: Text(
                  'Informar al creador',
                  style: GoogleFonts.khand(
                      color: const Color.fromARGB(255, 53, 146, 193),
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                      style: GoogleFonts.khand(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          }
          // Guardar datos adicionales en Firestore
          await FirebaseFirestore.instance
              .collection('usuarios')
              .doc(userCredential.user?.uid)
              .set({
            'nombres': nombreControlador.text,
            'apellidos': apellidoControlador.text,
            'cedula': cedulaControlador.text,
            'email': emailControlador.text,
            'telefono': telefonoControlador.text,
            'tipo_cuenta': tipoDeCuenta,
            'fe_creacion': FieldValue.serverTimestamp(),
          });

          print('Usuario registrado: ${userCredential.user?.email}');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                'BIENVENIDO!!!',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              content: Text(
                'Se ha registrado correctamente',
                style: GoogleFonts.khand(
                    color: const Color.fromARGB(255, 53, 146, 193),
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: GoogleFonts.khand(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          print('A ocurrido un error');
        }
      } else {
                  showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                'ERROR!!!',
                style: GoogleFonts.khand(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              content: Text(
                'La clave no es correcta',
                style: GoogleFonts.khand(
                    color: const Color.fromARGB(255, 53, 146, 193),
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: GoogleFonts.khand(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTRARSE',
          style: GoogleFonts.khand(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'INGRESE SU INFORMACION',
                    style: GoogleFonts.khand(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              /**
                   * INPUT NOMBRE
                   */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nombreControlador,
                  decoration: InputDecoration(
                      hintText: 'Nombres',
                      icon: Icon(Icons.account_circle_outlined)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * INPUT APELLIDO
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: apellidoControlador,
                  decoration: InputDecoration(
                      hintText: 'Apellidos',
                      icon: Icon(Icons.account_circle_outlined)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * CEDULA
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: cedulaControlador,
                  decoration: InputDecoration(
                      hintText: 'Cedula', icon: Icon(Icons.file_copy_outlined)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * EMAIL INPUT
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: emailControlador,
                  decoration: InputDecoration(
                      hintText: 'Email', icon: Icon(Icons.mail)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * PASSWORD INPUT
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: passwordControlador,
                  obscureText: true,
                  decoration:
                      InputDecoration(hintText: 'Clave', icon: Icon(Icons.key)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * CONFIRM PASSWORD INPUT
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  obscureText: true,
                  controller: confirmPasswordControlador,
                  decoration: InputDecoration(
                      hintText: 'Confirmar clave', icon: Icon(Icons.key)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /**
               * TELEFONO INPUT
               */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: telefonoControlador,
                  decoration: InputDecoration(
                      hintText: 'Telefono', icon: Icon(Icons.phone)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: showAdminTextField,
                          onChanged: (bool? value) {
                            setState(() {
                              showAdminTextField = value!;
                            });
                          },
                        ),
                        Text('Administrador'),
                      ],
                    ),
                    Visibility(
                      visible: showAdminTextField,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: administradorControlar,
                          decoration: InputDecoration(
                            hintText: 'Key generada por VisitTracker',
                            icon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: showResidentTextField,
                          onChanged: (bool? value) {
                            setState(() {
                              showResidentTextField = value!;
                            });
                          },
                        ),
                        Text('Residente'),
                      ],
                    ),
                    Visibility(
                      visible: showResidentTextField,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Key generada por el Administrador',
                            icon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: showGuardianiaTextField,
                          onChanged: (bool? value) {
                            setState(() {
                              showGuardianiaTextField = value!;
                            });
                          },
                        ),
                        Text('Guardiania'),
                      ],
                    ),
                    Visibility(
                      visible: showGuardianiaTextField,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Key generada por el Administrador',
                            icon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: registrar,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'REGISTRARSE',
                    style: GoogleFonts.khand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
