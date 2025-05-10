import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';

class Scoreboard extends ConsumerWidget {
  Scoreboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          "Scoreboard",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text("X Wins"),
        Text(ref.watch(winnerProvider).xWins.toString()),
      ],
    );
  }
}
