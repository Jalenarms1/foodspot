import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodspot/managers/auth_notifier.dart';
import 'package:foodspot/managers/cart_notifier.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/auth/auth_page.dart';
import 'package:foodspot/ui/screens/home/home_header.dart';
import 'package:foodspot/ui/screens/home/home_page.dart';
import 'package:foodspot/ui/screens/home/home_web.dart';
import 'package:foodspot/ui/screens/home/menu_list.dart';
import 'package:foodspot/ui/screens/menu/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthNotifier()),
        ChangeNotifierProvider(create: (context) => CartNotifier()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Lora",
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    return Consumer<AuthNotifier>(
      builder: (context, auth, child) {
        return kIsWeb
            ? (auth.isLoggedIn || auth.isGuest)
                ? HomePage()
                : HomeWeb()
            : (auth.isLoggedIn || auth.isGuest)
            ? HomePage()
            : AuthPage();
      },
    );
  }
}
