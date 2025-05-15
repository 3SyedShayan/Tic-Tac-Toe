import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/riverpod/players_name.dart';

class NameDialog extends ConsumerWidget {
  NameDialog({super.key});

  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: player1Controller,

              decoration: InputDecoration(hintText: "Enter Player 1 Name"),
            ),
            TextField(
              controller: player2Controller,
              decoration: InputDecoration(hintText: "Enter Player 2 Name"),
            ),
            ElevatedButton(
              onPressed: () {
                final name1 = player1Controller.text.trim();
                final name2 = player2Controller.text.trim();
                if (name1.length >= 2 && name2.length >= 2) {
                  player1Controller.text = player1Controller.text;
                  player2Controller.text = player2Controller.text;
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter both names"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
