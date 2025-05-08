import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/gridview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        children: [
          Expanded(child: Text("TIC TAC TOE")),
          Expanded(
            flex: 3,
            child: Padding(padding: EdgeInsets.all(10), child: GridWidget()),
          ),
          Expanded(flex: 2, child: Text("data")),
        ],
      ),
    );
  }
}
