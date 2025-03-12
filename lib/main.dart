import 'package:e_commerce/presentaion/Home.dart';
import 'package:e_commerce/presentaion/Sign_in.dart';
import 'package:e_commerce/presentaion/Sign_up.dart';
import 'package:e_commerce/presentaion/home_pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IEEE Tasks',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: SignUp(),
    );
  }
}
