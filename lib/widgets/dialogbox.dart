import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/restart_game.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';

class DialogBox extends ConsumerWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Color.fromRGBO(60, 22, 181, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Game Over, ${ref.read(winnerProvider).winner} Wins!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(108, 64, 253, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ref.read(isRestart.notifier).state = true;
              },
              child: Text(
                "Restart Game",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
