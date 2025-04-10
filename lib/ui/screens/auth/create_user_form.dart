import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/shared/app_button.dart';
import 'package:http/http.dart' as http;

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final _userForm = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void submitForm() async {
    if (_userForm.currentState!.validate()) {
      print(_userForm.currentState);
      print(_nameController.text);
      print(_emailController.text);

      final resp = await http.post(
        Uri.parse("http://localhost:8000/api/new-user"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          "name": _nameController.text,
          "email": _emailController.text,
          "phone_number": _phoneController.text,
        }),
      );

      print(resp.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _userForm,
      child: Column(
        spacing: 20,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: "NAME",
              labelStyle: TextStyle(
                color: Colors.black.withValues(alpha: 0.75),
                fontSize: 12,
              ),
              focusColor: AppColors.darkRed,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppColors.darkRed, width: 0.5),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid name";
              }

              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: "PHONE NUMBER",
              labelStyle: TextStyle(
                color: Colors.black.withValues(alpha: 0.75),
                fontSize: 12,
              ),
              focusColor: AppColors.darkRed,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppColors.darkRed, width: 0.5),
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "EMAIL",
              labelStyle: TextStyle(
                color: Colors.black.withValues(alpha: 0.75),
                fontSize: 12,
              ),
              focusColor: AppColors.darkRed,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppColors.darkRed, width: 0.5),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid name";
              }

              return null;
            },
          ),
          AppButton(
            onPressed: () {
              submitForm();
            },
            bgColor: AppColors.darkRed,
            label: Text("Confirm email").appFontStyle(
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
    );
  }
}
