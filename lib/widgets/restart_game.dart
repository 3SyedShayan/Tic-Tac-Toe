import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/restart_game.dart';

class RestartGame extends ConsumerWidget {
  RestartGame({super.key, required this.restartGame});

  void Function() restartGame;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(onPressed: () {}, child: Text("Restart Game"));
  }
}
