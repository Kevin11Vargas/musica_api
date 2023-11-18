import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:musica_api/screens/album_screen.dart';
import 'package:musica_api/screens/artistas_screen.dart';
import 'package:musica_api/screens/musica_screen.dart';
import 'package:musica_api/widgets/album_silider.dart';
import 'package:musica_api/widgets/artista_slider.dart';
import 'package:musica_api/widgets/musica_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 163, 163, 163), 
  );

  static const List<Widget> _widgetOptions = <Widget>[
    //AlbumSlider(),
   // ArtistaSlider(),
   Text(
      'HOME',
      style: optionStyle,
    ),
    AlbumScreen(),
    ArtistasScreen(),
    Musica_Screen(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 13, 13),//pantalla fondo
      appBar: AppBar
      (
       elevation: 0,
         backgroundColor: Color.fromARGB(255, 115, 115, 116),
         title: Center
         (
           child: Text
           (
             'AudiVelVars',
              style: TextStyle
               (
                fontSize: 24, // Ajusta el tamaño de fuente aquí
                fontWeight: FontWeight.bold, // Opcional: Puedes ajustar el peso de la fuente
                ),
            ),
           ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),//barra abajo
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color.fromARGB(255, 255, 255, 255),//texto
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 99, 98, 98),//el circulo de seleccion
              color: Color.fromARGB(255, 255, 255, 255),//iconos 
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'HOME',
                ),
                GButton(
                  icon: LineIcons.recordVinyl,
                  text: 'ÁLBUM',
                  
                ),
                GButton(
                  icon: LineIcons.napster,
                  text: 'ARTISTA',
                ),
                GButton(
                  icon: LineIcons.music,
                  text: 'MÚSICA',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}