import 'package:flutter/material.dart';
import 'package:musica_api/widgets/card_swiper.dart';

class Musica_Screen extends StatelessWidget {
  const Musica_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 13, 13), // Cambiamos el fondo a negro
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Espacio alrededor del texto
            child: Text(
              'LISTA DE CANCIONES',
              style: TextStyle(
                fontSize: 24, // Tamaño de fuente
                fontWeight: FontWeight.bold, // Peso de la fuente
                color:  Color.fromARGB(255, 163, 163, 163), // Color del texto
              ),
            ),
          ),
          CardSwiper(), // Aquí se muestra el CardSwiper
        ],
      ),
    );
  }
}