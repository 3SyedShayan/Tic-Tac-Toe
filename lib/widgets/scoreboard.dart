import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
        SizedBox(height: 25),
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
                          : Colors.white,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ref.watch(playerName1),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "O",
                      style: GoogleFonts.cherryBombOne(
                        fontSize: 45,
                        color: Color.fromRGBO(251, 210, 46, 1),
                      ),
                    ),
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
                          ? Colors.white
                          : Colors.transparent,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ref.watch(playerName2),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "X",
                      style: GoogleFonts.cherryBombOne(
                        fontSize: 45,
                        color: Color.fromRGBO(241, 19, 81, 1),
                      ),
                    ),
                    Text(
                      "${ref.watch(winnerProvider).xWins.toString()} wins",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
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
