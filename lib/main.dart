import 'package:bloc_app/features/authentication/sign_up/sign_up.dart';
import 'package:bloc_app/features/home/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepOrange))),
        useMaterial3: true,
      ),
      home: const SignUp(),
    );
  }
}
