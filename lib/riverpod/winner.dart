import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameState {
  GameState({
    required this.winner,
    this.xWins = 0,
    this.oWins = 0,
    this.draws = 0,
  });

  String winner = "No Winner Yet";
  int xWins = 0;
  int oWins = 0;
  int draws = 0;

  GameState copyWith({String? winner}) {
    if (winner == "X") {
      xWins = xWins + 1;
    } else if (winner == "O") {
      oWins = oWins + 1;
    } else {
      draws = draws + 1;
    }

    return GameState(
      // winner: winner ?? this.winner
      winner: winner ?? this.winner,
      xWins: xWins ?? this.xWins,
      oWins: oWins ?? this.oWins,
      draws: draws ?? this.draws,
    );
  }
}

final winnerProvider = StateProvider<GameState>((ref) {
  return GameState(winner: "No Winner Yet");
});
