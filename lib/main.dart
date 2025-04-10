import 'package:flutter/material.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/auth/auth_page.dart';
import 'package:foodspot/ui/screens/home/home_header.dart';
import 'package:foodspot/ui/screens/home/menu_list.dart';
import 'package:foodspot/ui/screens/menu/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthPage();
  }
}
