import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class anim extends StatelessWidget {
  const anim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.asset('assets/animations/card.json') ,
        ),
      ),
    );
  }
}
