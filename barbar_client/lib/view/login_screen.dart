import 'package:barbar_client/controller/theme_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            constraints: BoxConstraints(minHeight: size.height - 100),
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: ThemeController.baseColor,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Full Name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Phone Number'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {},
                    child: Text('SignIn'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
