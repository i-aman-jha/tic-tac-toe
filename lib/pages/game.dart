import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utilities/player.dart';
import 'package:tic_tac_toe/utilities/result.dart';
import 'package:tic_tac_toe/utilities/tile.dart';

class Game extends StatefulWidget {
  static const String routeName = '/game';

  final String player1;
  final String player2;
  const Game({
    super.key,
    required this.player1,
    required this.player2,
  });

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer='';
  String winner='';

  @override
  void initState() {
    super.initState();
    currentPlayer = widget.player1;
  }

  IconData move(int row, int col) {
    return (board[row][col] == widget.player1) ? Icons.close : (board[row][col] == widget.player2) ?Icons.circle_outlined: Icons.question_mark;
  }


  void handleTap(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() { 
        board[row][col] = currentPlayer;
        // Switch players
        currentPlayer = (currentPlayer == widget.player1) ? widget.player2 : widget.player1;
        // Check for win or draw
        checkGameResult();
        if(winner.isNotEmpty){
          showDialog(
            context: context,
            barrierDismissible: false, 
            builder: (context){
              return Result(winner: winner, player1: widget.player1, player2: widget.player2);
            }
            );
        }
      });
      // print(board);
    }
  }

  void checkGameResult() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        setState(() {
          winner = board[i][0];
        });
        return ;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[0][i] != '' && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        setState(() {
          winner = board[0][i];
        });
        return;
      }
    }

    // Check diagonals
    if (board[0][0] != '' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      setState(() {
        winner = board[0][0];
      });
      return;
    }
    if (board[0][2] != '' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      setState(() {
        winner = board[0][2];
      });
      return;
    }

    // Check for a draw
    bool isBoardFull = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          isBoardFull = false;
          break;
        }
      }
    }
    if (isBoardFull) {
      setState(() {
        winner = 'Draw';
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
                opacity: 0.5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerName(
                  name: widget.player1,
                  sign: "cross",
                  isActive: (currentPlayer==widget.player1),
                ),
                PlayerName(
                  name: widget.player2,
                  sign: "circle",
                  isActive: (currentPlayer==widget.player2),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: GridView.count(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  Tile(row: 0, col: 0,onTap: handleTap, icon: move,),
                  Tile(row: 0, col: 1,onTap: handleTap, icon: move,),
                  Tile(row: 0, col: 2,onTap: handleTap, icon: move,),  
                  Tile(row: 1, col: 0,onTap: handleTap, icon: move,),
                  Tile(row: 1, col: 1,onTap: handleTap, icon: move,),
                  Tile(row: 1, col: 2,onTap: handleTap, icon: move,),
                  Tile(row: 2, col: 0,onTap: handleTap, icon: move,),
                  Tile(row: 2, col: 1,onTap: handleTap, icon: move,),
                  Tile(row: 2, col: 2,onTap: handleTap, icon: move,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
