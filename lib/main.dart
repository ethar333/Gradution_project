import 'package:flutter/material.dart';
import 'package:sprint1/Register/register_screen.dart';
import 'package:sprint1/Register/register_page2.dart';
import 'package:sprint1/login/forget_password.dart';
import 'package:sprint1/login/login_screen.dart';
import 'package:sprint1/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(context) => const SplashScreen(),
        RegisterScreen.routeName : (context) =>  RegisterScreen(),
        LoginScreen.routname : (context) => LoginScreen(),
        forgetpassword.routname : (contect) => forgetpassword(),
      },
     
     initialRoute:RegisterScreen.routeName,

    );

  }
}

