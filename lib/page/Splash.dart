import 'dart:async';

import 'package:bookstore/page/login_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 5), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)
    =>hotel_registration())));
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          body:Column(
            children: [
              Center(child:
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child:Column(
                    children: [
                      Lottie.asset("assets/animations/Good.json",fit: BoxFit.contain),
      
                    ],
      
      
                ),),
              ) ],
          )
      ),
    );
  }
}
