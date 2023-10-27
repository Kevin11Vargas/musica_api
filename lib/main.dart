import 'package:flutter/material.dart';
import 'package:musica_api/screens/home_screen.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // línea para ocultar el indicador de depuración
  builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child!
    );
    },
    home: HomeScreen(),
    
    )
);
