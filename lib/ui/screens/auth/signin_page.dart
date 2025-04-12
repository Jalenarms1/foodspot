import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/managers/network_manager.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/auth/verify_code_page.dart';
import 'package:foodspot/ui/shared/app_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _email = TextEditingController();
  String? _authErr;

  void getVerificationCode(BuildContext ctx) async {
    final email = _email.text;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    print(email);

    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      setState(() {
        _authErr = "please enter a valid email";
      });

      return;
    }

    setState(() {
      _authErr = null;
    });
    final resp = await NetworkManager.post(
      "/api/users/login",
      <String, dynamic>{"email": email},
    );

    if (resp.statusCode != 200) {
      setState(() {
        _authErr = resp.body;
      });
      return;
    }

    try {
      final respJson = jsonDecode(resp.body);
      final verificationId = respJson["verification_id"];

      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (context) {
            return VerifyCodePage(
              verificationId: verificationId,
              userEmail: email,
            );
          },
        ),
      );
    } on FormatException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white.withValues(alpha: 0.75),
            size: 20,
          ),
        ),
        title: Text("Sign In").appFontStyle(
          color: Colors.white.withValues(alpha: 0.75),
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  spacing: 50,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/food-icon.png", scale: 5),
                        Text("Welcome back!").appFontStyle(
                          weight: FontWeight.bold,
                          size: 28,
                          color: AppColors.darkRed,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: "ENTER YOUR EMAIL",
                            labelStyle: TextStyle(
                              color: Colors.black.withValues(alpha: 0.75),
                              fontSize: 12,
                            ),
                            focusColor: AppColors.darkRed,
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: AppColors.darkRed,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        if (_authErr != null)
                          Text(_authErr!).appFontStyle(
                            color: Colors.red,
                            size: 12,
                            textAlign: TextAlign.start,
                          ),
                        AppButton(
                          onPressed: () {
                            getVerificationCode(context);
                          },
                          bgColor: AppColors.darkRed,
                          label: Text("Confirm").appFontStyle(
                            size: 16,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        ),

                        Container(
                          width: 200,
                          child: Text(
                            "By continuing, you agree to the Terms of Service, and Privacy Policy.",
                          ).appFontStyle(
                            textAlign: TextAlign.center,
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            Expanded(
                              child: Container(height: 1, color: Colors.grey),
                            ),
                            Text("OR").appFontStyle(color: Colors.grey),
                            Expanded(
                              child: Container(height: 1, color: Colors.grey),
                            ),
                          ],
                        ),
                        AppButton(
                          onPressed: () {},
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google-logo.webp",
                                width: 30,
                                height: 30,
                              ),
                              Text("Sign in with google").appFontStyle(
                                color: Colors.black,
                                weight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
