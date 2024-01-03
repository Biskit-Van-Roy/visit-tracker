import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visit_tracker/screens/Administrador/settings_page.dart';

class SettingResidencePage extends StatefulWidget {
  const SettingResidencePage({super.key});

  @override
  State<SettingResidencePage> createState() => _SettingResidencePageState();
}

class _SettingResidencePageState extends State<SettingResidencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
          MyCard(title: 'Agregar Residencia', screen: SettingsPageAdmin()),
          MyCard(title: 'Agregar Áreas Comunes',screen: SettingsPageAdmin()),
                ],
              ),
        )
      ),
    );
  }
}
class MyCard extends StatelessWidget {
  final String title;
  final Widget screen;

  MyCard({required this.title, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          final route = MaterialPageRoute(builder: (context)=>screen);
          Navigator.push(context, route);
          print('Tocaste la tarjeta: $title');
        },
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.khand(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}