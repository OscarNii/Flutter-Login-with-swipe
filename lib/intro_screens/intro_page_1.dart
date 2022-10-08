import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // ignore: prefer_const_constructors
      shaderCallback: (bounds) => LinearGradient(
        colors: const [
          Color.fromARGB(235, 0, 0, 0),
          Color.fromARGB(13, 0, 0, 0)
        ],
        begin: Alignment.bottomRight,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.colorBurn,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/taste.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
