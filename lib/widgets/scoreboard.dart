import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/players_name.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';

class Scoreboard extends ConsumerWidget {
  Scoreboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          "Scoreboard",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Color.fromRGBO(17, 16, 50, 1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:
                      ref.watch(playerXTurn)
                          ? Colors.transparent
                          : Colors.green,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ref.read(playerName1),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "O",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${ref.watch(winnerProvider).oWins.toString()} wins",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 40),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Color.fromRGBO(17, 16, 50, 1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:
                      ref.watch(playerXTurn)
                          ? Colors.green
                          : Colors.transparent,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ref.read(playerName2),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${ref.watch(winnerProvider).xWins.toString()} wins",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Text(
            //   "X Wins",
            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            // ),
            // SizedBox(width: 20),
            // Text(
            //   "O Wins",
            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            // ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50),
            Text(ref.watch(winnerProvider).oWins.toString()),
          ],
        ),
      ],
    );
  }
}
