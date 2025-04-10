import 'package:flutter/material.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/shared/app_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
                          onChanged: (value) {
                            // print(value);
                          },
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
                        AppButton(
                          onPressed: () {},
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
