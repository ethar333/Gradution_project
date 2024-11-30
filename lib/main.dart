
import 'package:flutter/material.dart';
import 'package:sprint1/Auth/Register/register_screen.dart';
import 'package:sprint1/Auth/login/forget_password.dart';
import 'package:sprint1/Auth/login/login_screen.dart';
import 'package:sprint1/home/home_screen.dart';
import 'package:sprint1/profile/profile.dart';
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
        RegisterScreen.routeName : (context) => const RegisterScreen(),
        LoginScreen.routname : (context) => LoginScreen(),
        ForgetPassordScreen.routname : (contect) => ForgetPassordScreen(),
        HomeScreen.routeName :(context) => const HomeScreen(),
        ProfileScreen.routeName : (context) =>  const ProfileScreen(
        firstnameController: '', lastnameController: '', emailController:'', passwordController: '', cityController: '', phoneNumber: ''),
      },
     
     initialRoute: SplashScreen.routeName,

    );

  }
}

