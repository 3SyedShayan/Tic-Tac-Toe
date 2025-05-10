import 'package:flutter/material.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';
import 'package:tic_tac_toe/widgets/grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/widgets/scoreboard.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key, this.winnerAnnouncement});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
  String? winnerAnnouncement;
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        children: [
          Expanded(child: Scoreboard()),
          Expanded(
            flex: 3,

            child: Padding(padding: EdgeInsets.all(10), child: Grid()),
          ),
          Expanded(
            flex: 2,
            child: Text("Winner: ${ref.watch(winnerProvider).winner}"),
          ),
        ],
      ),
    );
  }
}
