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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "X Wins",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 20),
            Text(
              "O Wins",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(winnerProvider).xWins.toString()),
            SizedBox(width: 50),
            Text(ref.watch(winnerProvider).oWins.toString()),
          ],
        ),
      ],
    );
  }
}
