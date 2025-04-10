import 'package:flutter/material.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/auth/create_user_form.dart';
import 'package:foodspot/ui/shared/app_button.dart';

class CreateAcctPage extends StatelessWidget {
  const CreateAcctPage({super.key});

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
        title: Text("Create Account").appFontStyle(
          color: Colors.white.withValues(alpha: 0.75),
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: 30.0,
                    left: 20.0,
                    right: 20.0,
                    bottom: 50.0,
                  ),
                  child: Column(
                    spacing: 50,
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          Image.asset("assets/images/food-icon.png", scale: 5),
                          Text("Welcome to Lalocura!").appFontStyle(
                            weight: FontWeight.bold,
                            size: 28,
                            color: AppColors.darkRed,
                          ),
                          Text(
                            "Create an account to start earning rewards now!",
                          ).appFontStyle(
                            color: Colors.grey,
                            size: 16,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      CreateUserForm(),
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
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Already have an account?",
                            ).appFontStyle(
                              weight: FontWeight.w600,
                              color: Colors.grey,
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
      ),
    );
  }
}
