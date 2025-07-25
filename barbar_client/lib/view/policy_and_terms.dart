import 'package:barbar_client/controller/login_and_init_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/view/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PolicyAndTerms extends ConsumerWidget {
  const PolicyAndTerms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    bool agreed = ref.watch(LoginAndInitController.isAgreed);

    return Scaffold(
      backgroundColor: ThemeController.baseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            constraints: BoxConstraints(minHeight: size.height - 50),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('assets/images/start.jpg'),
                ),
                SizedBox(height: 25),
                Text(
                  'To continue using this app, User need to accept our Terms of Service and Privacy Policy. These outline how we collect, use, share and protect your data, and the rules for using this app. Please review these documents carefully. By accepting, you agree to comply with our terms and allow us to handle your data as described.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      activeColor: ThemeController.amber,
                      onChanged: (val) {
                        ref
                            .read(LoginAndInitController.isAgreed.notifier)
                            .state = val!;
                      },
                    ),
                    SizedBox(width: 4),
                    Builder(builder: (context) {
                      TextStyle style1 = TextStyle(color: Colors.white);
                      TextStyle style2 = TextStyle(
                          color: const Color.fromARGB(255, 0, 255, 255));
                      return Expanded(
                        child: Text.rich(
                          style: style1,
                          TextSpan(
                            text: 'I agreed to the ',
                            children: [
                              TextSpan(
                                text: 'Privacy Policy ',
                                style: style2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(text: 'and '),
                              TextSpan(
                                text: 'Terms & conditions.',
                                style: style2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: agreed
                        ? () {
                            Get.off(() => LoginScreen(),
                                transition: Transition.fadeIn);
                          }
                        : null,
                    style:
                        FilledButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      'I Agreed',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              agreed ? ThemeController.baseColor : Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
