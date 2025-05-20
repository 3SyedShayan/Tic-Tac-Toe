import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
        padding: EdgeInsets.all(20),
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Color.fromRGBO(92, 54, 216, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Player Names",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: player1Controller,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(60, 22, 181, 1),
                filled: true,
                prefixIcon: Text(
                  " X",
                  style: GoogleFonts.cherryBombOne(
                    color: Color.fromRGBO(241, 19, 81, 1),
                    fontSize: 25,
                  ),
                ),
                hintText: "Enter Player 1 Name",
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: player2Controller,

              decoration: InputDecoration(
                fillColor: Color.fromRGBO(60, 22, 181, 1),
                filled: true,
                prefixIcon: Text(
                  " O",
                  style: GoogleFonts.cherryBombOne(
                    color: Color.fromRGBO(251, 210, 46, 1),
                    fontSize: 25,
                  ),
                ),

                hintText: "Enter Player 2 Name",
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(60, 22, 181, 1),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                final name1 = player1Controller.text.trim();
                final name2 = player2Controller.text.trim();
                if (name1.length >= 2 && name2.length >= 2) {
                  ref.read(playerName1.notifier).state = player1Controller.text;
                  ref.read(playerName2.notifier).state = player2Controller.text;
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
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
