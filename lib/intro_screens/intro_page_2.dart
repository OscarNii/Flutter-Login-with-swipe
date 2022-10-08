import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // ignore: prefer_const_constructors
      shaderCallback: (bounds) => LinearGradient(
        colors: const [
          Color.fromARGB(235, 0, 0, 0),
          Color.fromARGB(13, 0, 0, 0)
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.colorBurn,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/burgers.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
