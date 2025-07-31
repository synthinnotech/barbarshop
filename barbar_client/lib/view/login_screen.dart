import 'package:barbar_client/controller/login_and_init_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabler_icons/tabler_icons.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  void submit() {
    bool canRegister = !ref.read(LoginAndInitController.isLogin);
    final img = ref.read(LoginAndInitController.profile);
    LoginAndInitController.submit(
        canRegister, name.text, password.text, phone.text, img);
  }

  Widget inputField(String hint, IconData icon,
      {TextEditingController? controller, bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 0),
            color: Colors.grey.withAlpha(150),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        obscureText: obscure,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.white),
          filled: true,
          fillColor: ThemeController.baseColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    phone.dispose();
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = ref.watch(LoginAndInitController.isLogin);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ThemeController.baseColor,
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          isLogin ? 'LOGIN' : 'REGISTER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/booking.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                        isLogin ? 'Welcome Back!' : 'Add New Profile!',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: isLogin ? null : () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 0),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    color: Colors.grey.withAlpha(200),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: ThemeController.baseColor,
                              ),
                            ),
                          ),
                          if (!isLogin)
                            Positioned(
                              child: CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.add),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 30),
                      inputField('Full Name', TablerIcons.user,
                          controller: name),
                      if (!isLogin) SizedBox(height: 10),
                      if (!isLogin)
                        inputField('Phone Number', TablerIcons.phone,
                            controller: phone),
                      SizedBox(height: 10),
                      inputField('Password', TablerIcons.lock,
                          controller: password),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: submit,
                          style: FilledButton.styleFrom(
                            foregroundColor: ThemeController.baseColor,
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            isLogin ? 'SignIn' : 'Create Account',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        TextSpan(
                          text: isLogin
                              ? 'Don\'t have an account? '
                              : 'Already have an account? ',
                          children: [
                            TextSpan(
                              text: isLogin ? 'Register' : 'Login',
                              style: TextStyle(
                                color: ThemeController.amber,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  ref
                                      .read(LoginAndInitController
                                          .isLogin.notifier)
                                      .state = !isLogin;
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
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
