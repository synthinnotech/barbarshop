import 'package:barbar_client/controller/app_controller.dart';
import 'package:barbar_client/view/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LoginAndInitController {
  static final currentIndex = StateProvider.autoDispose<int>((ref) => 0);
  static final isAgreed = StateProvider.autoDispose<bool>((ref) => false);
  static final isLogin = StateProvider.autoDispose<bool>((ref) => true);
  static final profile = StateProvider.autoDispose<String>((ref) => '');

  static void submit(bool canRegister, String name, String password,
      String phone, String image) async {
    if (canRegister) {
      if (image.isEmpty) {
        AppController.appToast(
            'Invalid Profile', 'Please update a profile image!',
            purpose: Purpose.fail);
        return;
      }
      if (name.isEmpty || password.isEmpty || phone.isEmpty) {
        AppController.appToast(
            'Failed Registration', 'All fields are required!',
            purpose: Purpose.fail);
      } else {
        // final str = await AppController.postFetch(
        //   'endPoint',
        //   {'name': name, 'phone': phone, 'password': password},
        // );
      }
    } else {
      if (name.isEmpty || password.isEmpty) {
        AppController.appToast('Login Failed', 'All fields are required!',
            purpose: Purpose.fail);
      } else {
        // final str = await AppController.postFetch(
        //   'endPoint',
        //   {'name': name, 'phone': phone, 'password': password},
        // );
        Get.offAll(() => HomeScreen(), transition: Transition.zoom);
      }
    }
  }
}
