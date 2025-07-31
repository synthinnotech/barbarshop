import 'package:barbar_client/controller/login_and_init_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/view/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class PolicyAndTerms extends ConsumerWidget {
  const PolicyAndTerms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final bool agreed = ref.watch(LoginAndInitController.isAgreed);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeController.baseColor,
              ThemeController.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = size.width > size.height;
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: isWide
                    ? ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: size.height - 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/start.jpg',
                                  height: size.height,
                                  fit: BoxFit.cover,
                                )
                                    .animate()
                                    .fadeIn(duration: 600.ms)
                                    .slideX(begin: -0.2, curve: Curves.easeOut),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                                child: _buildContent(context, ref, agreed)),
                          ],
                        ),
                      )
                    : ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: size.height - 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage('assets/images/start.jpg'),
                            ).animate().fadeIn(duration: 800.ms).scale(
                                begin: const Offset(0.8, 0.8),
                                curve: Curves.easeOut),
                            const SizedBox(height: 30),
                            _buildContent(context, ref, agreed),
                          ],
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, bool agreed) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white10.withAlpha(10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Before you begin",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'To use this app, you must accept our Terms of Service and Privacy Policy. These describe how your data is used, stored, and protected.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                  value: agreed,
                  onChanged: (val) {
                    ref.read(LoginAndInitController.isAgreed.notifier).state =
                        val!;
                  },
                  activeColor: ThemeController.amber,
                  side: const BorderSide(color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        const TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: agreed
                    ? () {
                        Get.off(() => const LoginScreen(),
                            transition: Transition.fadeIn);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: agreed ? Colors.white : Colors.white10,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'I Agree',
                  style: TextStyle(
                    color: agreed
                        ? ThemeController.baseColor
                        : Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
