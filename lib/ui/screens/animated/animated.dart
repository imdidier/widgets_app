import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  final Random _random = Random();

  double? randomWidth;
  double? randomHeight;
  Color? randomColor;
  double? randomBorderRadius;

  void randomValues() {
    randomWidth = _random.nextDouble() * 500;
    randomHeight = _random.nextDouble() * 500;
    randomBorderRadius = _random.nextDouble() * 100;
    randomColor = Color.fromRGBO(
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
      1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInCubic,
          decoration: BoxDecoration(
            color: randomColor,
            borderRadius: BorderRadius.circular(randomBorderRadius ?? 25),
          ),
          width: randomWidth ?? 50,
          height: randomHeight ?? 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: randomValues,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
