import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/restart_game.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';
import 'package:tic_tac_toe/widgets/dialogbox.dart';

class Grid extends ConsumerStatefulWidget {
  Grid({super.key});

  @override
  ConsumerState<Grid> createState() => _GridState();
}

class _GridState extends ConsumerState<Grid> {
  bool playerX = true;

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
    winBoxes = [];
    Navigator.of(context).pop();
  }

  void displayXO(int index, BuildContext context) {
    if (playerX && grid[index] == '') {
      setState(() {
        grid[index] = 'X';
      });
    } else if (!playerX && grid[index] == '') {
      setState(() {
        grid[index] = 'O';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Move'), duration: Duration(seconds: 1)),
      );
      return;
    }
    playerX = !playerX;
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
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
                border: Border.all(color: Colors.black),
                color: winBoxes.contains(index) ? Colors.amber : Colors.pink,
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(grid[index], style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
    );
  }
}
