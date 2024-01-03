import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPageAdmin extends StatefulWidget {
  const SettingsPageAdmin({super.key});

  @override
  State<SettingsPageAdmin> createState() => _SettingsPageAdminState();
}

class _SettingsPageAdminState extends State<SettingsPageAdmin> {
  Color containerColor = Colors.white;
  Color buttonColor = Colors.black;

  void changeColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccione los colores del tema',style: GoogleFonts.khand(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text('Color del contenedor:',style: GoogleFonts.khand(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                ColorPicker(
                  borderColor: containerColor,
                  onColorChanged: (Color color) {
                    setState(() {
                      containerColor = color;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text('Color del botón:',style: GoogleFonts.khand(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                ColorPicker(
                  borderColor: buttonColor,
                  onColorChanged: (Color color) {
                    setState(() {
                      buttonColor = color;
                    });
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
     int _index = 0;
  List<Step> steps = [
    Step(
        title: Text("Ingrese el nombre del edificio"),
        content: Text("This is the first step"),
        isActive: true
    ),
    Step(
      title: Text("Ingrese la direccion del edificio"),
      content: Text("This is the second step"),
      isActive: true,
    ),
    Step(
      title: Text("Ingrese una foto del edificio"),
      content: Text("This is the third step"),
      isActive: true,
    ),
    Step(
      title: Text("Ingrese los colores distintivos del edificio"),
      content: Text("This is the fourth step"),
      isActive: false,
    ),
  ];
    return Scaffold(
      appBar: AppBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: changeColor,
      //   backgroundColor: buttonColor,
      //   child: Icon(Icons.color_lens, color: Colors.white, size: 40),
      // ),
      // body: Column(
      //   children: [
      //     AnimatedContainer(
      //       duration: Duration(milliseconds: 200),
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //       decoration: BoxDecoration(color: containerColor),
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //         child: Column(
      //           children: [
      //             const SizedBox(height: 60),
      //             Row(children: [Icon(Icons.menu, size: 40)]),
      //             const SizedBox(height: 20),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         Icon(
      //                           Icons.home,
      //                           color: Colors.white,
      //                         ),
      //                         const SizedBox(
      //                           width: 5,
      //                         ),
      //                         Text(
      //                           'ECO-ESMIL',
      //                           style: GoogleFonts.khand(
      //                             color: Colors.white,
      //                             fontSize: 30,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         Icon(
      //                           Icons.location_on_outlined,
      //                           color: Colors.white,
      //                         ),
      //                         const SizedBox(
      //                           width: 5,
      //                         ),
      //                         Text(
      //                           'Av. Mango Inga',
      //                           style: GoogleFonts.khand(
      //                             color: Colors.white,
      //                             fontSize: 30,
      //                             fontWeight: FontWeight.normal,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //                 ClipRRect(
      //                   borderRadius: BorderRadius.circular(30),
      //                   child: Image(
      //                     image: AssetImage('assets/icon/logo.png'),
      //                     fit: BoxFit.cover,
      //                     width: 50,
      //                   ),
      //                 )
      //               ],
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             SizedBox(
      //               height: 200,
      //               width: MediaQuery.of(context).size.width,
      //                 child: Card(                        
      //               child: Center(child: Text('Calendario de eventos',style: GoogleFonts.khand(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),)),
      //               color: buttonColor,
      //             ))
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),

    body: Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: steps
    ),
    );
  }
}
