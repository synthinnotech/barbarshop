import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialisationController {
  static final currentIndex = StateProvider.autoDispose<int>((ref) => 0);
}
