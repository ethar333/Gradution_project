
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sprint1/Register/register_screen.dart';
import 'package:sprint1/Register/register_page2.dart';
import 'package:sprint1/constants/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

    static const String routeName = 'splash_screen';      // routeName of this screen:

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: AnimatedSplashScreen(
          backgroundColor: Constant.mainColor,
          splashIconSize: 450,
          //rgba(112,182,189,255)
          splashTransition: SplashTransition.sizeTransition,
          splash:const CircleAvatar(
            radius: double.infinity,
            backgroundImage:
                AssetImage('assets/photo_2024-11-20_18-45-24.jpg'),
          ),
       
       nextScreen:  RegisterScreen(),
    ),
    );

    
  }
}