import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, -1.1),
          child: Container(
            height: 364,
            width: 364,
            decoration: const BoxDecoration(color: Colors.orange),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(7, 0.5),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-7, 0.5),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
