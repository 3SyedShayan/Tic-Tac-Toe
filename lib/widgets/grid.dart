import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';

class Grid extends ConsumerStatefulWidget {
  Grid({super.key});

  @override
  ConsumerState<Grid> createState() => _GridState();
}

class _GridState extends ConsumerState<Grid> {
  bool playerX = true;

  List<String> grid = ['', '', '', '', '', '', '', '', ''];


  void winnerXO() {
    bool anyWinner = false;
    final gameState = ref.read(winnerProvider);
    if (grid[0] == grid[1] &&
        grid[0] == grid[2] &&
        grid[0] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
    } else if (grid[3] == grid[4] &&
        grid[3] == grid[5] &&
        grid[3] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[3],
      );
    } else if (grid[6] == grid[7] &&
        grid[6] == grid[8] &&
        grid[6] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[6],
      );
    } else if (grid[0] == grid[3] &&
        grid[0] == grid[6] &&
        grid[0] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
    } else if (grid[1] == grid[4] &&
        grid[1] == grid[7] &&
        grid[1] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[1],
      );
    } else if (grid[2] == grid[5] &&
        grid[2] == grid[8] &&
        grid[2] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[2],
      );
    } else if (grid[0] == grid[4] &&
        grid[0] == grid[8] &&
        grid[0] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[0],
      );
    } else if (grid[2] == grid[4] &&
        grid[2] == grid[6] &&
        grid[2] != '' &&
        !anyWinner) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: grid[2],
      );
    } else if (!grid.contains('')) {
      ref.read(winnerProvider.notifier).state = gameState.copyWith(
        winner: 'draw',
      );
    }
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

  @override
  Widget build(BuildContext context) {
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
                color: Colors.green,
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
