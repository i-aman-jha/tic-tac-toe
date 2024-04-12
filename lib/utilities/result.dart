import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/pages/game.dart';
import 'package:tic_tac_toe/pages/homepage.dart';
import 'package:tic_tac_toe/utilities/button.dart';

class Result extends StatelessWidget {
  final String winner;
  final String player1;
  final String player2;
  const Result({
    super.key,
    required this.winner,
    required this.player1,
    required this.player2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepOrangeAccent,
                Colors.orangeAccent,
                Colors.amber
              ]),
          border: Border.all(
            color: Colors.white,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: (winner!='Draw')? const AssetImage('assets/images/winner.png'): const AssetImage('assets/images/draw.png')),
            Text(
              winner,
              style: GoogleFonts.bungeeHairline(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                    text: "Play",
                    icon: Icons.play_arrow,
                    size: MediaQuery.of(context).size.width * 0.07,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Game(player1: player1,player2: player2,)),
                        (route) => false,
                      );
                    }),
                Button(
                    text: "Exit",
                    size: MediaQuery.of(context).size.width * 0.07,
                    icon: Icons.logout,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
