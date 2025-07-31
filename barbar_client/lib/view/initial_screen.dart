import 'package:barbar_client/controller/login_and_init_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/local/initial_contents.dart';
import 'package:barbar_client/view/policy_and_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class InitialScreen extends ConsumerStatefulWidget {
  const InitialScreen({super.key});

  @override
  ConsumerState<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends ConsumerState<InitialScreen> {
  final controller = PageController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(LoginAndInitController.currentIndex);
    final size = MediaQuery.of(context).size;

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeController.baseColor, ThemeController.secondary],
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
                        return Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: ThemeController.secondary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.asset(
                                            'assets/images/${InitialContents.images[i]}',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: size.width * 0.6,
                                          ).animate().fadeIn(duration: 600.ms),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          InitialContents.titles[i],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ).animate().fadeIn(delay: 200.ms),
                                        const SizedBox(height: 8),
                                        Text(
                                          InitialContents.subtitles[i],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ).animate().fadeIn(delay: 300.ms),
                                        const SizedBox(height: 15),
                                        Text(
                                          InitialContents.body[i],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
                                        ).animate().fadeIn(delay: 400.ms),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: ThemeController.avator,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index != 3)
                      IconButton(
                        onPressed: () => Get.off(() => const PolicyAndTerms()),
                        icon: const Icon(Icons.close, color: Colors.white),
                        tooltip: 'Skip',
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withAlpha(40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(4, (i) {
                        final active = i == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: active ? 24 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                                active ? ThemeController.amber : Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: nextPage,
                      icon: Icon(
                        index == 3 ? Icons.check : Icons.arrow_forward,
                        color: ThemeController.baseColor,
                      ),
                      tooltip: index == 3 ? 'Get Started' : 'Next',
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
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
