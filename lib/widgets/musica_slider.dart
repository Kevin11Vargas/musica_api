import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Musica_Slider extends StatelessWidget {
  const Musica_Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Color.fromARGB(255, 163, 163, 163),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Text(
              'Musica',
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,  // Cambia 'Colors.blue' al color que desees
            ),
             ),
              ),
            Expanded(child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:20,
              itemBuilder: (_, int index) => _MoviePoster(),
            ))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                width: 130,
                height: 165,
                ),
              ),
          ),
          const SizedBox(height: 5),
          
        ],
      ),
    );
  }
}