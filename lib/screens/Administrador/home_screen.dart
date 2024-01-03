import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visit_tracker/screens/Administrador/settings_page.dart';
import 'package:visit_tracker/screens/Administrador/settings_residence.dart';

class HomeScreenAdministrador extends StatefulWidget {
  const HomeScreenAdministrador({super.key});

  @override
  State<HomeScreenAdministrador> createState() =>
      _HomeScreenAdministradorState();
}

class _HomeScreenAdministradorState extends State<HomeScreenAdministrador> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('BIENVENIDO!',style: GoogleFonts.khand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            ListTile(
              title: Text('Inicio',style: GoogleFonts.khand(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
            //  selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configurar residencia',style: GoogleFonts.khand(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
             // selected: _selectedIndex == 1,
              onTap: () {

                final route = MaterialPageRoute(builder: (context)=> SettingResidencePage());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: Text('Informacion de areas comunes',style: GoogleFonts.khand(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),),
              //selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Finanzas',style: GoogleFonts.khand(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),),
              //selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
          ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  'Bienvenido',
                  style: GoogleFonts.khand(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                alignment: Alignment.center,
              ),
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context)=> SettingsPageAdmin());
                  Navigator.pushReplacement(context, route);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,                
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Configurar',style: GoogleFonts.khand(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
