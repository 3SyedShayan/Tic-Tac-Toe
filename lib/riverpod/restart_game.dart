import 'package:flutter_riverpod/flutter_riverpod.dart';

final emptyBoxes = StateProvider<List<String>>((ref) {
  return ['', '', '', '', '', '', '', '', ''];
});

final pauseGame = StateProvider<bool>((ref) {
  return false;
});
