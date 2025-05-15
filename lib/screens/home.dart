import 'package:flutter/material.dart';
import 'package:tic_tac_toe/riverpod/winner.dart';
import 'package:tic_tac_toe/widgets/grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/widgets/name_dialog.dart';
import 'package:tic_tac_toe/widgets/scoreboard.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key, this.winnerAnnouncement});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
  String? winnerAnnouncement;
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void getName() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => NameDialog(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 27, 79, 1),
      body: Column(
        children: [
          SizedBox(height: 70),
          Scoreboard(),
          Expanded(
            child: Container(
              color: Color.fromRGBO(92, 54, 216, 1),
              child: Padding(padding: EdgeInsets.all(10), child: Grid()),
            ),
          ),
          Text("Winner: ${ref.watch(winnerProvider).winner}"),
          SizedBox(height: 280),
        ],
      ),
    );
  }
}
