import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodspot/models/local_auth.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/managers/auth_notifier.dart';
import 'package:foodspot/managers/network_manager.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/shared/app_button.dart';
import 'package:provider/provider.dart';

class VerifyCodePage extends StatefulWidget {
  final String verificationId;
  final String userEmail;

  const VerifyCodePage({
    super.key,
    required this.verificationId,
    required this.userEmail,
  });

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  TextEditingController _codeInput = TextEditingController();
  String codeErr = "";

  void verifyCode() async {
    setState(() {
      codeErr = "";
    });
    final resp = await NetworkManager.post(
      "/api/users/verify/${widget.verificationId}",
      <String, dynamic>{"code": _codeInput.text, "email": widget.userEmail},
    );

    print(resp.statusCode);
    if (resp.statusCode != 200) {
      setState(() {
        codeErr = resp.body;
      });
      return;
    }
    try {
      final respJson = jsonDecode(resp.body);
      final token = respJson["token"];

      await LocalAuth.saveToken(token);
      final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
      await authNotifier.getUser();

      if (authNotifier.currUser?.isVerified ?? false) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
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
        title: Text("Verify").appFontStyle(
          color: Colors.white.withValues(alpha: 0.75),
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.asset("assets/images/verify-icon.png", scale: 2),
            ),
            Text(
              "Verify your code",
            ).appFontStyle(weight: FontWeight.bold, size: 28),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Text(
                "We sent a verification code to ${widget.userEmail}. Please enter the 6-digit verification code below. The code will expire after 15 minutes.",
              ).appFontStyle(
                textAlign: TextAlign.center,
                color: Colors.black.withValues(alpha: 0.75),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  TextField(
                    controller: _codeInput,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
                          width: 1.0,
                        ),
                      ),

                      label: Text(
                        "CODE",
                      ).appFontStyle(color: AppColors.darkRed, size: 14),
                    ),
                  ),
                  if (codeErr.isNotEmpty)
                    Text(codeErr).appFontStyle(color: Colors.red, size: 12),
                  AppButton(
                    onPressed: () {
                      verifyCode();
                    },
                    label: Text(
                      "Confirm",
                    ).appFontStyle(color: AppColors.darkRed, size: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
