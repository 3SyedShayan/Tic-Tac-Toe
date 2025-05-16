import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerName1 = StateProvider<String>((ref) {
  return "Ahmed";
});

final playerName2 = StateProvider<String>((ref) {
  return "Ali";
});

final playerXTurn = StateProvider<bool>((ref) {
  return true;
});
