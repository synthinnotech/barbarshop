import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAndInitController {
  static final currentIndex = StateProvider.autoDispose<int>((ref) => 0);
  static final isAgreed = StateProvider.autoDispose<bool>((ref) => false);
}
