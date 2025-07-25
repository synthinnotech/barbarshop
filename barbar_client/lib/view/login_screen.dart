import 'package:barbar_client/controller/theme_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextStyle hintStyle = TextStyle(color: Colors.grey);
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ThemeController.baseColor,
        foregroundColor: Colors.white,
        title: Text(
          'LOGIN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).viewInsets.bottom > 0 ? 250 : null,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeController.baseColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Add New Profile!',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 0),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.grey.withAlpha(200),
                                )
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: ThemeController.baseColor,
                            ),
                          ),
                          Positioned(
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.person),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: textStyle,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.white,
                        style: textStyle,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.white,
                        style: textStyle,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            foregroundColor: ThemeController.baseColor,
                            backgroundColor: Colors.white,
                          ),
                          child: Text('SignIn'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
