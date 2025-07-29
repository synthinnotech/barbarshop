import 'package:barbar_client/controller/login_and_init_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/local/initial_contents.dart';
import 'package:barbar_client/view/policy_and_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController();
    final index = ref.watch(LoginAndInitController.currentIndex);
    final size = MediaQuery.of(context).size;
    final isLarge = size.height > 700;

    void nextPage() {
      if (index == 3) {
        Get.off(() => const PolicyAndTerms(), transition: Transition.fadeIn);
      } else {
        ref.read(LoginAndInitController.currentIndex.notifier).state++;
        controller.animateToPage(
          index + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF101820), Color(0xFF2A2D34)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return PageView.builder(
                      controller: controller,
                      itemCount: InitialContents.images.length,
                      onPageChanged: (val) => ref
                          .read(LoginAndInitController.currentIndex.notifier)
                          .state = val,
                      itemBuilder: (_, i) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.85,
                                    height: size.width * 0.85,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.asset(
                                            'assets/images/${InitialContents.images[index]}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ).animate().fadeIn(duration: 600.ms),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Color(0xFF101820),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  InitialContents
                                                      .headlines[index],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                                    .animate()
                                                    .fadeIn(delay: 200.ms),
                                                const SizedBox(height: 4),
                                                Text(
                                                  InitialContents
                                                      .subtitles[index],
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 14,
                                                  ),
                                                )
                                                    .animate()
                                                    .fadeIn(delay: 300.ms),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    InitialContents.titles[i],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    InitialContents.body[i],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) {
                  final active = i == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 24 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: active ? ThemeController.amber : Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    if (index != 3)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              Get.off(() => const PolicyAndTerms()),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (index != 3) const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: ThemeController.baseColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          index == 3 ? 'Get Started' : 'Next',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
