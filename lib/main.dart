import 'package:flutter/material.dart';
import 'package:task_one/login.dart';
import 'package:task_one/onboarding.dart';
import 'package:task_one/registerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes:{
        OnBoarding.routeName:(context)=>OnBoarding(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
      },
      initialRoute: OnBoarding.routeName,
    );
  }
}

