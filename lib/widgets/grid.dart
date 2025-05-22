import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/riverpod/players_name.dart';
import 'package:tic_tac_toe/riverpod/restart_game.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';
import 'package:tic_tac_toe/widgets/dialogbox.dart';
import 'package:http/http.dart' as http;

class Grid extends ConsumerStatefulWidget {
  Grid({super.key});

  @override
  ConsumerState<Grid> createState() => _GridState();
}

class _GridState extends ConsumerState<Grid> {
  List<String> grid = ['', '', '', '', '', '', '', '', ''];
  List<int> winBoxes = [];
  bool anyWinner = false;

  void winnerXO() {
    final gameState = ref.read(winnerProvider);
    if (grid[0] == grid[1] &&
        grid[0] == grid[2] &&
        grid[0] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
      winBoxes = [0, 1, 2];
      gameDialog();
    } else if (grid[3] == grid[4] &&
        grid[3] == grid[5] &&
        grid[3] != '' &&
        !anyWinner) {
      winBoxes = [3, 4, 5];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[3],
      );
      gameDialog();
    } else if (grid[6] == grid[7] &&
        grid[6] == grid[8] &&
        grid[6] != '' &&
        !anyWinner) {
      winBoxes = [6, 7, 8];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[6],
      );
      gameDialog();
    } else if (grid[0] == grid[3] &&
        grid[0] == grid[6] &&
        grid[0] != '' &&
        !anyWinner) {
      winBoxes = [0, 3, 6];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
      gameDialog();
    } else if (grid[1] == grid[4] &&
        grid[1] == grid[7] &&
        grid[1] != '' &&
        !anyWinner) {
      winBoxes = [1, 4, 7];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[1],
      );
      gameDialog();
    } else if (grid[2] == grid[5] &&
        grid[2] == grid[8] &&
        grid[2] != '' &&
        !anyWinner) {
      winBoxes = [2, 5, 8];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[2],
      );
      gameDialog();
    } else if (grid[0] == grid[4] &&
        grid[0] == grid[8] &&
        grid[0] != '' &&
        !anyWinner) {
      winBoxes = [0, 4, 8];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
      gameDialog();
    } else if (grid[2] == grid[4] &&
        grid[2] == grid[6] &&
        grid[2] != '' &&
        !anyWinner) {
      winBoxes = [2, 4, 6];
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[2],
      );
      gameDialog();
    } else if (!grid.contains('')) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: 'draw',
      );
      gameDialog();
    }
  }

  void restartGame() {
    setState(() {
      grid = ['', '', '', '', '', '', '', '', ''];
    });
    print(ref.read(playerName1));
    print(ref.read(playerName2));
    winBoxes = [];
    Navigator.of(context).pop();
  }

  void displayXO(int index, BuildContext context) {
    bool _playerX = ref.read(playerXTurn);
    if (_playerX && grid[index] == '') {
      setState(() {
        grid[index] = 'X';
      });
    } else if (!_playerX && grid[index] == '') {
      setState(() {
        grid[index] = 'O';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Move'), duration: Duration(seconds: 1)),
      );
      return;
    }
    ref.watch(playerXTurn.notifier).state = !ref.watch(playerXTurn);
    winnerXO();
  }

  void gameDialog() {
    showDialog(context: context, builder: (context) => DialogBox());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(isRestart, (previous, next) {
      if (next) {
        restartGame();
        ref.read(isRestart.notifier).state = false;
      }
    });

    return GridView.builder(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 9,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              displayXO(index, context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

                color:
                    winBoxes.contains(index)
                        ? Color.fromRGBO(17, 16, 50, 1)
                        : Color.fromRGBO(17, 16, 50, 1),
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  grid[index],
                  style: GoogleFonts.cherryBombOne(
                    fontSize: 70,
                    color:
                        grid[index] == 'X'
                            ? Color.fromRGBO(241, 19, 81, 1)
                            : Color.fromRGBO(251, 210, 46, 1),
                  ),
                ),
              ),
            ),
          ),
    );

    //  GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3,
    //     crossAxisSpacing: 15,
    //     mainAxisSpacing: 15,
    //   ),
    //   itemCount: 9,
    //   itemBuilder:
    //       (context, index) => GestureDetector(
    //         onTap: () {
    //           displayXO(index, context);
    //         },
    //         child: Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15),

    //             color:
    //                 winBoxes.contains(index)
    //                     ? Color.fromRGBO(17, 16, 50, 1)
    //                     : Color.fromRGBO(17, 16, 50, 1),
    //           ),
    //           padding: EdgeInsets.all(10),
    //           child: Center(
    //             child: Text(
    //               grid[index],
    //               style: GoogleFonts.cherryBombOne(
    //                 fontSize: 70,
    //                 color:
    //                     grid[index] == 'X'
    //                         ? Color.fromRGBO(241, 19, 81, 1)
    //                         : Color.fromRGBO(251, 210, 46, 1),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    // );
  }
}
