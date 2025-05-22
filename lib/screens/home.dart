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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 70),
          Scoreboard(),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                // width: 450,
                // height: 410,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(92, 54, 216, 1),
                ),
                // padding: EdgeInsets.only(left: 10, right: 10),
                child: Grid(),
              ),
            ),
          ),
          Text("Winner: ${ref.watch(winnerProvider).winner}"),
          // SizedBox(height: 280),
        ],
      ),
    );
  }
}
