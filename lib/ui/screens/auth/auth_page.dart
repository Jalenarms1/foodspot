import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/auth/create_acct_page.dart';
import 'package:foodspot/ui/screens/auth/signin_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/food-collage.jpeg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            "assets/images/lalocura-logo.jpeg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(40.0),
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                spacing: 40,
                children: [
                  Text("Order, Save, Earn!").appFontStyle(
                    color: AppColors.darkRed,
                    size: 22,
                    weight: FontWeight.bold,
                  ),
                  Text(
                    "Sign in or create an account to earn points for your mobile order.",
                  ).appFontStyle(
                    color: AppColors.darkRed,
                    weight: FontWeight.w400,
                    size: 16,
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SigninPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign in",
                          ).appFontStyle(color: Colors.white, size: 14),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.darkRed,
                            padding: EdgeInsets.all(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) => CreateAcctPage(),
                              ),
                            );
                          },
                          child: Text("Create account").appFontStyle(size: 14),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Continue as guest",
                    ).appFontStyle(color: AppColors.darkRed, size: 14),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
